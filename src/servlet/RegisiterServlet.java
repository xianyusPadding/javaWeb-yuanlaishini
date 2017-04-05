package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.InformationAction;
import action.RegisterAction;
import javaBean.Information;
import javaBean.User;
import utils.MyConstant;
public class RegisiterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

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
		//默认头像
		user.setI_p_url("./upload/guys.jpg");
		RegisterAction registerAction=new RegisterAction();
		HttpSession session =req.getSession();
		boolean result=registerAction.register(user);
		InformationAction iAction =new InformationAction();
		Information information =new Information();
		information.setUid(u_id);
		iAction.insert(information);
		if(result){
			session.setAttribute("user", user);
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_REGISTER_ERROR);
			resp.sendRedirect(req.getContextPath()+"/errorServlet");
		}
	}
	
}
