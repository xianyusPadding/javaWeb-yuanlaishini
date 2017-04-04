package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.UserAction;
import javaBean.Information;
import javaBean.User;
import utils.MyConstant;

public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InformationServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		String name =request.getParameter("name");
		String height =request.getParameter("tall");
		String weight =request.getParameter("weight");
		String bloodtype =request.getParameter("blood_type");
		String nation =request.getParameter("nation");
		String house =request.getParameter("house");
		String have_child_not =request.getParameter("hava_child_not");
		String graduate_school =request.getParameter("graduate_school");
		Information information=new Information();
		information.setUid(user.getU_id());
		information.setName(name);
		information.setHeight(Integer.parseInt(height));
		information.setWeight(Integer.parseInt(weight));
		information.setBloodtype(bloodtype);
		information.setNation(nation);
		information.setHouse(house);
		information.setHave_child_not(have_child_not);
		information.setGraduate_school(graduate_school);
		
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
