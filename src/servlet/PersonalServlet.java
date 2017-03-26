package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.PersonalAction;
import javaBean.Album;
import javaBean.Photo;
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
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			Photo photo=new Photo(0, user.getU_id(), 0, null, null);
			PersonalAction personal=new PersonalAction();
			List<Album> list =personal.selectAlbum(user);
			List<Photo> pulist=personal.selectImg_user(photo);
			List<Photo> pslist=personal.selectImg_single(photo);

			session.setAttribute("a_list",list );
			session.setAttribute("a_size", list.size());
			
			session.setAttribute("p_s_list",pslist );
			session.setAttribute("p_s_size", pslist.size());
			response.sendRedirect(request.getContextPath()+"/personal.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}

}
