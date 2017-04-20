package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DiaryAction;
import javaBean.Diary;
import javaBean.User;
import utils.MyConstant;

public class DiaryShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DiaryShowServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			String s_id=request.getParameter("s_id");
			DiaryAction dAction=new DiaryAction();
			Diary diary =new Diary();
			diary.setS_id(Integer.parseInt(s_id));
			diary =dAction.select(diary);
			session.setAttribute("diary", diary);
			response.sendRedirect(request.getContextPath()+"/diaryShow.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}

}
