package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DiaryAction;
import javaBean.Diary;
import javaBean.User;

public class DiarySelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DiarySelectServlet() {
        super();
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//发送这个参数过来，名字要是 dg_id
		String dg_id =request.getParameter("dg_id");
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		//设置编码，不然会出现乱码 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=response.getWriter();
		Diary diary=new Diary();
		diary.setU_id(user.getU_id());
		diary.setDg_id(Integer.parseInt(dg_id));
		DiaryAction dAction =new DiaryAction();
		List<Diary>diaryList =dAction.selectDiary_user_dg(diary);
		for(int i=0;i<diaryList.size();i++){
			Diary d =diaryList.get(i);
			writer.append("<li class='fl-diaryTitle1'><a href='diaryShowServlet?s_id="+d.getS_id()+"'>"+d.getS_title()+"</a></li>");
		}
	}
}
