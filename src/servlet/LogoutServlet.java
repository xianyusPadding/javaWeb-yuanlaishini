package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Diary;
import javaBean.User;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {
	
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
	
	@SuppressWarnings({  "unchecked" })
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session =req.getSession();
		List<User> indexUserList=new ArrayList<>();
		indexUserList=(List<User>) session.getAttribute("indexUserList");
		List<Diary>diaryAllList =new ArrayList<>();
		diaryAllList=(List<Diary>) session.getAttribute("diaryAllList");
		//清除所有session
		session.invalidate();
		session =req.getSession();
		session.setAttribute("indexUserList", indexUserList);
		session.setAttribute("diaryAllList",diaryAllList );
		session.setAttribute("diaryAllSize", diaryAllList.size());
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
	}
	
}
