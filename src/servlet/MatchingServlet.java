package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.MatchingAction;
import javaBean.User;
import utils.MyConstant;

public class MatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MatchingServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			MatchingAction mAction=new MatchingAction();
			List<User> userList=mAction.selectUser(user.getU_id());
			session.setAttribute("userList",userList );
			session.setAttribute("userSize", userList.size());
			response.sendRedirect(request.getContextPath()+"/matching.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
