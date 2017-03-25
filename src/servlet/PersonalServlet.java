package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.PersonalAction;
import javaBean.Album;
import javaBean.User;
import utils.MyConstant;

/**
 * Servlet implementation class PersonalServlet
 */
public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			PersonalAction personal=new PersonalAction();
			List<Album> list =personal.selectAlbum(user);
			session.setAttribute("albumList",list );
			session.setAttribute("size", list.size());
			response.sendRedirect(request.getContextPath()+"/personal.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}

}
