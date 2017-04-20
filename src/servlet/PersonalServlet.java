package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DgrounpAction;
import action.DiaryAction;
import action.PersonalAction;
import javaBean.Album;
import javaBean.Dgrounp;
import javaBean.Diary;
import javaBean.Information;
import javaBean.Photo;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;

public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			PersonalAction personal=new PersonalAction();
			Photo photo=new Photo(0, user.getU_id(), 0, null, null);
			List<Album> list =personal.selectAlbum(user);
			List<Photo> pslist=personal.selectImg_single(photo);
			List<Share>shareList =personal.selectShare_user(user);
			Information information=personal.selectInformation(user.getU_id());
			
			DgrounpAction dAction =new DgrounpAction();
			List<Dgrounp> dg_list =dAction.select(user);
			session.setAttribute("dg_list", dg_list);
			session.setAttribute("dg_size", dg_list.size());
			
			DiaryAction diaryAction =new DiaryAction();
			Diary diary=new Diary();
			diary.setU_id(user.getU_id());
			diary.setDg_id(0);
			List<Diary>diaryList =diaryAction.selectDiary_user_dg(diary);
			session.setAttribute("diaryList",diaryList );
			session.setAttribute("diarySize", diaryList.size());
			
			session.setAttribute("shareList",shareList );
			session.setAttribute("shareSize", shareList.size());
			
			session.setAttribute("a_list",list );
			session.setAttribute("a_size", list.size());
			
			session.setAttribute("p_s_list",pslist );
			session.setAttribute("p_s_size", pslist.size());
			
			session.setAttribute("information", information);
			response.sendRedirect(request.getContextPath()+"/personal.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}

}
