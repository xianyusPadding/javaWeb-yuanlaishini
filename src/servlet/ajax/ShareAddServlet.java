package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ShareAction;
import javaBean.Photo;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;

/**
 * Servlet implementation class AjaxShareServlet
 */
public class ShareAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ShareAddServlet() {
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
			String s_title=request.getParameter("title");
			String s_content=request.getParameter("content");
			String s_p_url=request.getParameter("s_p_url");
			String flag =request.getParameter("flag");
			if(flag.equals("0"))flag="动态";else flag="愿望";
			Share share=new Share(0, u_id, s_title, s_content, s_p_url, 0, 0, flag, null);
			ShareAction sAction =new ShareAction();
			if(s_content.isEmpty()){
				response.getWriter().append("1");
			}else{
				if(sAction.insertShare(share)){
					List<Share>shareList =sAction.selectShare_user(user);
					session.setAttribute("shareList",shareList );
					session.setAttribute("shareSize", shareList.size());
					//设置编码，不然会出现乱码 
					response.setContentType("text/html;charset=utf-8");
					PrintWriter writer=response.getWriter();
					for(int i=0;i<shareList.size();i++){
						Share s =shareList.get(i);
						 writer.append("<div class='row fl-personal-dynamic' style='margin-top: 10px;padding-top:10px;background:#B97A57'>")
						.append("<div class='row'>")
						.append("<div class='col-md-1 col-xs-2' style='float:left'>")
						.append("<img class='fl-dynamic-img' src='"+user.getI_p_url()+"' style='border-radius: 50px;' alt=''>")
						.append("</div>")
						.append("<div class='col-md-11 col-xs-10' style='float:left'>")
						.append("<h4>"+user.getUsername()+"</h4>")
						.append("<p style='font-size: 12px'>"+s.getDate()+"</p>")
						.append("<p style='font-size: 15px'>"+s.getS_content()+"</p>")
						.append("</div>")
						.append("</div>")
						.append("<div class='row'>")
						.append("<ul class='nav nav-tabs nav-justified' style=''>")
						.append("<li style=''><a href=''>阅读("+s.getReadNum()+")</a></li>")
						.append("<li><a href=''>转发</a></li>")
						.append("<li class='fl-href-comment'><input type='text' value='"+s.getS_id()+"' hidden='hidden'><a href='#1'>评论</a></li>")
						.append("<li><a href=''>赞("+s.getStartNum()+")</a></li>")
						.append("</ul>")
						.append("</div>")
						.append("</div>")
						 //评论
						.append("<div class='fl-comment row' style='display: none;background: #B66F58;'>")
						.append("<div class='row' >")
						.append("<div class='col-md-1 col-xs-2'>")
						.append("<img class='fl-dynamic-img' src='"+user.getI_p_url()+"' style='border-radius: 50px;'alt=''/>")
						.append("</div>")
						.append("<textarea class='col-md-11 col-xs-10 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>")
						.append("<input type='text' value='"+s.getS_id()+"' hidden='hidden'>")
						.append("</div>")
						.append("<div class='row fl-commentSubmit'>")
						.append("<input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' />")
						.append("</div>")
						.append("<div class='row' >")
						.append("</div>")
						.append("</div>");
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
