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

public class ComSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComSelectServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			String u_id=user.getU_id();
			String s_id=request.getParameter("s_id");
			Share share =new Share(Integer.parseInt(s_id), u_id, null, null, null, 0, 0, null, null);
			UserAction uAction=new UserAction();
			CommentAction cAction =new CommentAction();
			List<Comment>commentList =cAction.selectComment_share(share);
			//设置编码，不然会出现乱码 
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			for(int i=0;i<commentList.size();i++){
				Comment c =commentList.get(i);
				User u =uAction.selectUser_single(c.getUid());
				 writer.append("<div class='row fl-personal-dynamic' style='margin-top: 10px;padding-top:10px;background:#B97A57'>");
	/*			.append("<div class='row'>")
				.append("<div class='col-md-1' style='float:left'>")
				.append("<img src='images/photoalbum1.jpg' style='width:60px;height:60px;border-radius: 50px;' alt=''>")
				.append("</div>")
				.append("<div class='col-md-11' style='float:left'>")
				.append("<h4>"+user.getUsername()+"</h4>")
				.append("<p style='font-size: 12px'>"+s.getDate()+"</p>")
				.append("<p style='font-size: 15px'>"+s.getS_content()+"</p>")
				.append("</div>")
				.append("</div>")
				.append("<div class='row'>")
				.append("<ul class='nav nav-tabs nav-justified' style=''>")
				.append("<li style=''><a href=''>阅读("+s.getReadNum()+")</a></li>")
				.append("<li><a href=''>转发</a></li>")
				.append("<li><a href=''>评论</a></li>")
				.append("<li><a href=''>赞("+s.getStartNum()+")</a></li>")
				.append("</ul>")
				.append("</div>")
				.append("</div>");*/
			}
		}else{
			response.getWriter().append("0");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
