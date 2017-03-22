package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.LoginAction;
import javaBean.User;
import utils.MyConstant;

public class LoginServlet extends HttpServlet {
	
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username =req.getParameter("user");
		String password =req.getParameter("pass");
		LoginAction loginAction =new LoginAction();
		HttpSession session =req.getSession();
		User user =loginAction.login(username,password);
		if(user!=null){
			session.setAttribute("username", user.getUsername());
			session.setAttribute("i_p_url", user.getI_p_url());
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_LOGIN_ERROR);
			resp.sendRedirect(req.getContextPath()+"/errorServlet");
		}	
	}
	
}
