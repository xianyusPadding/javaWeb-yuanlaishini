package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.LoginAction;
import javaBean.User;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {
	
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
	
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session =req.getSession();
		session.setAttribute("user", null);
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
	}
	
}
