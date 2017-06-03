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
import action.ShareAction;
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
			String type=request.getParameter("type");
			String u_id=user.getU_id();
			String s_id=request.getParameter("s_id");
			Share share =new Share(Integer.parseInt(s_id), u_id, null, null, null, 0, 0, null, null);
			UserAction uAction=new UserAction();
			CommentAction cAction =new CommentAction();
			List<Comment>commentList =cAction.selectComment_share(share);
			ShareAction sAction=new ShareAction();
			share=sAction.select(share);
			share.setReadNum(share.getReadNum()+1);
			sAction.update(share);
			//设置编码，不然会出现乱码 
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			if(commentList.size()>0){
				if(type.equals("personal")){
					writer.append("<div class='row' >")
					.append("<div class='col-md-1'>")
					.append("<img class='' src='"+user.getI_p_url()+"' style='width:60px;height:60px;border-radius: 50px;'alt=''/>")
					.append("</div>")
					.append("<textarea class='col-md-11 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>")
					.append("<input type='text' value='"+s_id+"' hidden='hidden'>")
					.append("</div>")
					.append("<div class='row fl-commentSubmit'>")
					.append("<input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' /></div>");
				}else if(type.equals("makeFriend")){
					writer.append("<div class='row' >")
					.append("<div class='col-md-1'>")
					.append("<img class='' src='"+user.getI_p_url()+"' style='border-radius: 50px;'alt=''/>")
					.append("</div>")
					.append("<textarea class='col-md-11 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>")
					.append("<input type='text' value='"+s_id+"' hidden='hidden'>")
					.append("</div>")
					.append("<div class='row fl-commentSubmit'>")
					.append("<input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' /></div>");
				}
			}
			for(int i=0;i<commentList.size();i++){
				Comment c =commentList.get(i);
				User u =uAction.selectUser_single(c.getUid());
				if(type.equals("personal")){
					writer.append("<div class='row' >")
					 .append("<div class='col-md-1 fl-commentHead'>")
					 .append("<img  src='"+u.getI_p_url()+"' style='width:60px;height:60px;border-radius: 50px;' alt='' />")
					 .append("</div>")
					 .append("<div class='col-md-11 '>")
					 .append("<p>"+u.getUsername()+":"+c.getcContent()+"</p>")
					 .append("<p style='float:left;'>"+c.getDate()+"</p>")
					 .append("<a href='#1' style='float:right;'>&nbsp;&nbsp;赞+15</a><a href='#1' class='fl-reply' style='float:right;'>回复&nbsp;&nbsp;|</a>")
					 .append("<div class='row fl-replyArea' style='display: none;'>")
			 	     .append("<textarea class='col-md-12' name='comment'  cols='30' rows='1'  wrap='hard'></textarea>")
			 	     .append("<input type='submit' class='btn btn-default btn-sm' value='回复'/></div></div></div>");	
				}else if(type.equals("makeFriend")){
					writer.append("<div class='row' >")
					 .append("<div class='col-md-1 fl-commentHead'>")
					 .append("<img  src='"+u.getI_p_url()+"' style='border-radius: 50px;' alt='' />")
					 .append("</div>")
					 .append("<div class='col-md-11 fl-reply-parent'>")
					 .append("<p>"+u.getUsername()+":"+c.getcContent()+"</p>")
					 .append("<p style='float:left;'>"+c.getDate()+"</p>")
					 .append("<a href='#1' style='float:right;'>&nbsp;&nbsp;赞+15</a><a href='#1' class='fl-reply' style='float:right;'>回复&nbsp;&nbsp;|</a>")
					 .append("<div class='row fl-replyArea' style='display: none;'>")
			 	     .append("<textarea class='col-md-12' name='comment'  cols='30' rows='1'  wrap='hard'></textarea>")
			 	     .append("<input type='submit' class='btn btn-default btn-sm' value='回复'/></div></div></div>");	
				}
				 
			}
		}else{
			response.getWriter().append("0");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
