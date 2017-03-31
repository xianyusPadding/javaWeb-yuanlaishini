package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.CommentAction;
import action.UserAction;
import javaBean.Comment;
import javaBean.Share;
import javaBean.User;

public class ComAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComAddServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			String u_id=user.getU_id();
			String s_id=request.getParameter("s_id");
			String c_content=request.getParameter("c_content");
			Comment comment=new Comment(0, u_id, Integer.parseInt(s_id), c_content, null);
			Share share =new Share(Integer.parseInt(s_id), u_id, null, null, null, 0, 0, null, null);
			UserAction uAction=new UserAction();
			CommentAction cAction =new CommentAction();
			if(c_content.isEmpty()){
				response.getWriter().append("1");
			}else{
				if(cAction.insert(comment)){
					List<Comment>commentList =cAction.selectComment_share(share);
					//设置编码，不然会出现乱码 
					response.setContentType("text/html;charset=utf-8");
					PrintWriter writer=response.getWriter();
					for(int i=0;i<commentList.size();i++){
						Comment c =commentList.get(i);
						User u =uAction.selectUser_single(c.getUid());
						   writer.append("<div class='row' >")
								 .append("<div class='col-md-1 fl-commentHead'>")
								 .append("<img  src='images/photoalbum3.jpg' style='width:60px;height:60px;border-radius: 50px;' alt='' />")
								 .append("</div>")
								 .append("<div class='col-md-11 '>")
								 .append("<p>"+u.getUsername()+":"+c.getcContent()+"</p>")
								 .append("<p style='float:left;'>"+c.getDate()+"</p>")
								 .append("<a href='#1' style='float:right;'>&nbsp;&nbsp;赞+15</a><a href='#1' class='fl-reply' style='float:right;'>回复&nbsp;&nbsp;|</a>")
								 .append("<div class='row fl-replyArea' style='display: none;'>")
						 	     .append("<textarea class='col-md-12' name='comment'  cols='30' rows='1'  wrap='hard'></textarea>")
						 	     .append("<input type='submit' class='btn btn-default btn-sm' value='回复'/></div></div></div>");						
					}
				}else{
					response.getWriter().append("2");
				}
			}
		}else{
			response.getWriter().append("0");
		}
	}
}
