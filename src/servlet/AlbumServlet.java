package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.AlbumAction;
import javaBean.Album;
import javaBean.User;
import utils.MyConstant;

/**
 * Servlet implementation class AlbumServlet
 */
public class AlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		String title =request.getParameter("title");
		if(!title.isEmpty()) {
			String flag =request.getParameter("flag");
			if(flag.equals("0"))flag="公开";else flag="私密";
			AlbumAction albumAction=new AlbumAction();
			Album album =new Album(0, user.getU_id(), title, flag,null);
			boolean rs =albumAction.insert(album);
			if(rs){
				List<Album> list =albumAction.select(user);
				session.setAttribute("a_list", list);
				session.setAttribute("a_size", list.size());
				response.sendRedirect(request.getContextPath()+"/personal.jsp");
			}else{
				session.setAttribute("status",MyConstant.STATUS_ALBUM_INSERT);
				response.sendRedirect(request.getContextPath()+"/errorServlet");
			}
		}else{
			session.setAttribute("status",MyConstant.STATUS_ALBUM_INSERT_EMPTY);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
		
	}
	
}
