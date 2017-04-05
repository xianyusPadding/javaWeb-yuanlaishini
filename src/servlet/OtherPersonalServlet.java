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
import javaBean.Information;
import javaBean.Photo;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;

public class OtherPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OtherPersonalServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		User other = null;
		if(user!=null) {
			PersonalAction personal=new PersonalAction();
			String uid=request.getParameter("uid");
			if(uid!=null)
				other =personal.selectUser(uid);
			Photo photo=new Photo(0, other.getU_id(), 0, null, null);
			List<Album> list =personal.selectAlbum(other);
			List<Photo> pslist=personal.selectImg_single(photo);
			List<Share>shareList =personal.selectShare_user(other);
			Information information=personal.selectInformation(other.getU_id());
			
			session.setAttribute("other",other );
			
			session.setAttribute("shareList",shareList );
			session.setAttribute("shareSize", shareList.size());
			
			session.setAttribute("a_list",list );
			session.setAttribute("a_size", list.size());
			
			session.setAttribute("p_s_list",pslist );
			session.setAttribute("p_s_size", pslist.size());
			
			session.setAttribute("information", information);
			response.sendRedirect(request.getContextPath()+"/otherpersonal.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
		
	}
}
