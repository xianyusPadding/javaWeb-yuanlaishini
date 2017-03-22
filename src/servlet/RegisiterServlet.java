package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.RegisterAction;
import javaBean.User;
import utils.MyConstant;
public class RegisiterServlet extends HttpServlet {
	
	public void init()throws ServletException{
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username =req.getParameter("username");
		String u_id=req.getParameter("user");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String sex =req.getParameter("sex");
		User user=new User(username, u_id, password, sex, email, null, 0, 0, 0, null, null, null, null);
		RegisterAction registerAction=new RegisterAction();
		HttpSession session =req.getSession();
		boolean result=registerAction.register(user);
		if(result){
			session.setAttribute("username", user.getUsername());
			session.setAttribute("i_p_url", user.getI_p_url());
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_REGISTER_ERROR);
			resp.sendRedirect(req.getContextPath()+"/errorServlet");
		}
	}
	
}
