package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.LoginAction;
import action.UserAction;
import javaBean.User;
import utils.MyConstant;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		String usernmae =request.getParameter("username");
		String sex =request.getParameter("sex");
		String email =request.getParameter("email");
		String age =request.getParameter("age");
		String province =request.getParameter("s_province");
		String city =request.getParameter("s_city");
		String country =request.getParameter("s_county");
		String salary =request.getParameter("salary");
		user.setUsername(usernmae);
		user.setSex(sex);
		user.setEmail(email);
		user.setAge(Integer.parseInt(age));
		user.setProvince(province);
		user.setCity(city);
		user.setCountry(country);
		user.setSalary(Integer.parseInt(salary));
		UserAction uAction =new UserAction();
		if(uAction.update(user)){
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/personalServlet");
		}else{
			session.setAttribute("status",MyConstant.STATUS_USER_UPDATE);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}	
	}

}
