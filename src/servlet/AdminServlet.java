package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DiaryAction;
import action.ShareAction;
import action.UserAction;
import javaBean.Diary;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			UserAction userAction=new UserAction();
			List<User> userList=userAction.selectUser_all(user.getU_id());
			session.setAttribute("userList",userList );
			session.setAttribute("userSize", userList.size());
			
			ShareAction shareAction=new ShareAction();
			List<Share> shareList=shareAction.selectShare_all();
			session.setAttribute("shareList",shareList );
			session.setAttribute("shareSize", shareList.size());
			
			DiaryAction diaryAction =new DiaryAction();
			List<Diary> diaryList=diaryAction.selectDiary_all();
			session.setAttribute("diaryList",diaryList );
			session.setAttribute("diarySize", diaryList.size());
			
			response.sendRedirect(request.getContextPath()+"/admin.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
