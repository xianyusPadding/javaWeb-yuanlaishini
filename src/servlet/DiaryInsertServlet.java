package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DiaryAction;
import javaBean.Diary;
import javaBean.User;
import utils.MyConstant;

public class DiaryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DiaryInsertServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			String dgrounp=request.getParameter("dgrounp");
			String s_title=request.getParameter("title");
			String s_content=request.getParameter("content");
			String s_p_url=request.getParameter("s_p_url");
//			String flag =request.getParameter("flag");
//			if(flag.equals("0"))flag="动态";else flag="愿望";
			Diary diary =new Diary();
			diary.setU_id(user.getU_id());
			diary.setDg_id(Integer.parseInt(dgrounp));
			diary.setS_title(s_title);
			diary.setS_content(s_content);
			diary.setS_p_url(s_p_url);
			DiaryAction dAction =new DiaryAction();
			if(s_title.isEmpty()){
				session.setAttribute("status",MyConstant.STATUS_DGROUNP_TEMPTY);
				response.sendRedirect(request.getContextPath()+"/errorServlet");
			}else
			if(s_content.isEmpty()){
				session.setAttribute("status",MyConstant.STATUS_SHARE_CONTENT_EMPTY);
				response.sendRedirect(request.getContextPath()+"/errorServlet");
			}else{
				if(dAction.insertDiary(diary)){
					List<Diary>diaryList =dAction.selectDiary_user(user);
					session.setAttribute("diaryList",diaryList );
					session.setAttribute("diarySize", diaryList.size());
					response.sendRedirect(request.getContextPath()+"/personal.jsp");
				}else{
					session.setAttribute("status",MyConstant.STATUS_SHARE_INSERT);
					response.sendRedirect(request.getContextPath()+"/errorServlet");
				}
			}
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
