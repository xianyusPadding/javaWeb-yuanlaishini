package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import action.UploadAction;
import javaBean.Photo;
import javaBean.User;
import utils.MyConstant;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 上传文件存储目录
    //private static final String UPLOAD_DIRECTORY = "F:/javaworkspace/Itweb/WebContent/upload";
	private static final String UPLOAD_DIRECTORY = "D:/web/Itweb/WebContent/upload";
	/*直接写tomcat服务器的upload路径就可以解决上传资源要刷新才能显示了*/
	//private static final String UPLOAD_DIRECTORY = "D:/tomat_worksapce/webapps/Itweb/upload";
	
	private static boolean flag=false;
	// 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException, IOException {
    	String picPath = null;
    	//存储传过来的数据
    	String date="";

    	HttpSession session = request.getSession();
    	
    	User user =(User) session.getAttribute("user");
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
		    // 如果不是则停止
		    PrintWriter writer = response.getWriter();
		    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
		    writer.flush();
		    return;
		}
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        //获取服务器上upload的绝对路径
        String uploadPath=UPLOAD_DIRECTORY;
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // 解析请求的内容提取文件数据
            List<FileItem> formItems = upload.parseRequest(request); 
            Iterator<FileItem> iter = formItems.iterator();   
            while (iter.hasNext()) {   
	            FileItem item1 = (FileItem) iter.next();
	            item1.getInputStream();
	            if (!item1.isFormField()) {
	            //文件流
	            }else{
	            	//非文件流  拿表单参数
	            	String value=item1.getString();
	            	value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
	            	date=value;
	            }
            }
            //文件流
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                	 if (!item.isFormField()) {
                         String fileName = new File(item.getName()).getName();
                         String filePath = uploadPath + '/'+ fileName;
                         picPath = "./upload/" + fileName;
                         String[] data=fileName.split("\\.");
                         if(!(data[1].equals("jpg")||data[1].equals("jpeg")||data[1].equals("png"))){
                        	 flag=true;
                        	 throw new Exception("NOT a photo");
                         }
                         File storeFile = new File(filePath);
                         // 保存文件到硬盘
                         item.write(storeFile);
                         boolean rs =false;
                         UploadAction uAction =new UploadAction();
                         //修改头像
                         if(date.equals("alterHeadPhoto")){
                         	user.setI_p_url(picPath);
                         	rs=uAction.alterHeadImg(user);
                         }else{
                         	 //上传相片到相册
                         	 Photo photo=new Photo(0, user.getU_id(), Integer.parseInt(date), picPath, null);
 	                         //写入数据库
 	                         rs=uAction.uploadImg(photo);
                         }
                         if(rs){
                          	response.sendRedirect(request.getContextPath()+"/personalServlet");
                          }else{
                          	session.setAttribute("status",MyConstant.STATUS_UPLOAD_INSERTPHOTO);
                          	response.sendRedirect(request.getContextPath()+"/errorServlet");
                          }
                     }
                  }
              }
        } catch (Exception ex) {
        	if(flag){
        		flag=false;
        		session.setAttribute("status",MyConstant.STATUS_UPLOAD_IMG_TYPE);
        		response.sendRedirect(request.getContextPath()+"/errorServlet"); 
        	}else{
            	session.setAttribute("status",MyConstant.STATUS_UPLOAD_PHOTO);
    			response.sendRedirect(request.getContextPath()+"/errorServlet");
        	}
        }
    }
}
