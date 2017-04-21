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
import javaBean.Dgrounp;
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
			String index=request.getParameter("index");
			DiaryAction dAction=new DiaryAction();
			Diary diary =new Diary();
			diary.setS_id(Integer.parseInt(s_id));
			diary =dAction.select(diary);
			session.setAttribute("index", index);
			session.setAttribute("diary", diary);
			DgrounpAction dgrounpAction =new DgrounpAction();
			List<Dgrounp> dg_list =dgrounpAction.select(diary.getUser());
			session.setAttribute("dg_list", dg_list);
			session.setAttribute("dg_size", dg_list.size());
			response.sendRedirect(request.getContextPath()+"/diaryShow.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}

}
