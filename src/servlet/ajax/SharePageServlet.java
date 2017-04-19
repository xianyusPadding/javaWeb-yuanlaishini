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
import javaBean.Share;
import javaBean.User;

public class SharePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SharePageServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index=request.getParameter("index");
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		//设置编码，不然会出现乱码 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=response.getWriter();
		ShareAction sAction =new ShareAction();
		List<Share>shareList =sAction.selectShare_page(Integer.parseInt(index));
		for (int i = 0; i < shareList.size(); i++) {
			Share share =shareList.get(i);
			writer.append("<div class='row fl-dynamic' style='margin-top:0'><div class='row'><div class='col-md-1 col-xs-2' style='float:left'>");
			if(share.getUser().getU_id()==user.getU_id()){
				writer.append("<a href='personalServlet'><img src='"+share.getUser().getI_p_url()+"' class='fl-dynamic-img' alt=''></a>");
			}else{
				writer.append("<a href='otherPersonalServlet?uid='"+share.getUser().getU_id()+"'><img src='"+share.getUser().getI_p_url()+"' class='fl-dynamic-img' alt=''></a>");
			}
			writer.append("</div><div class='col-md-10 col-xs-9' style='float:left;margin-left:5px;'>")
				  .append("<h4 class='fl-id'>"+share.getUser().getUsername()+"</h4>")
				  .append("<p class='fl-time'>"+share.getDate()+"</p>")
				  .append("<p class='fl-Content'>"+share.getS_content()+"</p>")
				  .append("</div></div><div class='row'><ul class='nav nav-tabs nav-justified fl-comment-parent' style=''>")
				  .append("<li><a href='' style='border:none;'>阅读("+share.getReadNum()+")</a></li>")
				  .append("<li><a href=''>转发</a></li><li class='fl-href-comment'><input type='text' value='"+share.getS_id()+"' hidden='hidden'><a href='#1'>评论</a></li>");
				  if(share.getU_id()==user.getU_id()){
					  writer.append("<li><input type='text' value='"+share.getS_id()+"' hidden='hidden'><a style='cursor:pointer;' class=''>赞("+share.getStartNum()+")</a></li>");
				  }else{
					  writer.append("<li><input type='text' value='"+share.getS_id()+"' hidden='hidden'><a style='cursor:pointer;' class='clickStart'>赞("+share.getStartNum()+")</a></li>");
				  }
				  writer.append("</ul><div class='fl-comment row' style='display: none;background: #B66F58;'><div class='row' ><div class='col-md-1 col-xs-2'>")
				  .append("<img class=''  src='"+user.getI_p_url()+"' style='border-radius: 50px;' alt=''/></div>")
				  .append("<textarea class='col-md-11 col-xs-10 fl-commentText ' name='comment' cols='30' rows='3'  wrap='hard'></textarea>")
				  .append("<input type='text' value='"+share.getS_id()+"' hidden='hidden'>")
				  .append("</div><div class='row fl-commentSubmit'><input type='submit' class='btn btn-default comment_submit' name='comment' value='评论' /></div><div class='row' ></div></div></div></div>");
		}
	}
}
			
			
			
		
