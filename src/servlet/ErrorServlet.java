package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ErrorAction;
import action.LoginAction;
import javaBean.User;

/**
 * Servlet implementation class Error
 */
public class ErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ErrorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		int status =(int) session.getAttribute("status");
		ErrorAction error=new ErrorAction(status).error();
		session.setAttribute("message",error.getMessage());
		session.setAttribute("link",error.getLink());
		response.sendRedirect(request.getContextPath()+"/error.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
