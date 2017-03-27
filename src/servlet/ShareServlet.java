package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ShareAction;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;


public class ShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShareServlet() {
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
				session.setAttribute("status",MyConstant.STATUS_SHARE_CONTENT_EMPTY);
				response.sendRedirect(request.getContextPath()+"/errorServlet");
			}else{
				if(sAction.insertShare(share)){
					List<Share>shareList =sAction.selectShare_user(user);
					session.setAttribute("shareList",shareList );
					session.setAttribute("shareSize", shareList.size());
					response.sendRedirect(request.getContextPath()+"/personal.jsp");
				}else{
					session.setAttribute("status",MyConstant.STATUS_SHARE_INSERT);
					response.sendRedirect(request.getContextPath()+"/errorServlet");
				}
			}
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
