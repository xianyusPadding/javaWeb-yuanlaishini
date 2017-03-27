package servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.PersonalAction;
import javaBean.Photo;

/**
 * Servlet implementation class AjaxPhotoServlet
 */
public class PhotoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PhotoSelectServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a_id =request.getParameter("a_id");
		String u_id=request.getParameter("u_id");
		if(a_id!=null){
			Photo photo=new Photo(0, u_id, 0, null, null);
			PersonalAction personal=new PersonalAction();
			photo.setA_id(Integer.parseInt(a_id.trim()));
			photo.setU_id(u_id);
			List<Photo> palist=personal.selectImg_album(photo);
			for(int i=0;i<palist.size();i++){
				Photo p =palist.get(i);
				response.getWriter().append("<li><img src="+p.getA_p_url()+" alt="+p.getA_id()+" ><div></div></li>");
			}
		}
	}

}
