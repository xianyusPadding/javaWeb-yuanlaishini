package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DiaryAction;
import action.IndexAction;
import javaBean.Diary;
import javaBean.User;

public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndexServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		DiaryAction dAction =new DiaryAction();
		List<Diary>diaryAllList =dAction.selectDiary_all();
		session.setAttribute("diaryAllList",diaryAllList );
		session.setAttribute("diaryAllSize", diaryAllList.size());
		if(user!=null) {
			IndexAction iAction =new IndexAction();
			List<User> indexUserList=new ArrayList<>();
			indexUserList=iAction.selectUser(user.getU_id());
			session.setAttribute("indexUserList",indexUserList );
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			IndexAction iAction =new IndexAction();
			List<User> indexUserList=new ArrayList<>();
			indexUserList=iAction.selectUser_none();
			session.setAttribute("indexUserList",indexUserList );
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}
}
