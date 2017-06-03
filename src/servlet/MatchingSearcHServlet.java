package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.MatchingAction;
import javaBean.Information;
import javaBean.User;
import utils.MyConstant;

public class MatchingSearcHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MatchingSearcHServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User u =(User) session.getAttribute("user");
		List<User> list;
	    User user=new User();
	    Information information=new Information();
	    information.setUid(u.getU_id());
		String height = request.getParameter("height");
		String heightEnd= request.getParameter("heightEnd");
		String age = request.getParameter("age");
		String ageEnd=request.getParameter("ageEnd");
		String sex=request.getParameter("sex");
		if(height!=""){
			information.setHeight(Integer.parseInt(height));
		}
		if(heightEnd!=""){
			information.setHeightEnd(Integer.parseInt(heightEnd));
		}
		if(age!=""){
			user.setAge(Integer.parseInt(age));
		}
		if(ageEnd!=""){
			user.setAgeEnd(Integer.parseInt(ageEnd));
		}
		String salary=request.getParameter("salary");
		String salaryEnd =request.getParameter("salaryEnd");
	    if(salary!="")
	    	user.setSalary(Integer.parseInt(salary));
	    if(salaryEnd!="")
	    	user.setSalaryEnd(Integer.parseInt(salaryEnd));
		String province=request.getParameter("province");
		String city=request.getParameter("city");
		String country=request.getParameter("county");
	    String hobby=request.getParameter("hobby");
	    String blood_type=request.getParameter("bloodtype");
	    String nation=request.getParameter("nation");
	    String house=request.getParameter("house");
	    String child=request.getParameter("child");
	    String uid=request.getParameter("uid");
	    String graduate_school=request.getParameter("graduate_school");
	    user.setU_id(uid);
	    user.setSex(sex);	    
	    user.setProvince(province);
	    user.setCity(city);
	    user.setCountry(country);
	    
	    information.setHobby(hobby);
	    information.setBloodtype(blood_type);
	    information.setNation(nation);
	    information.setHouse(house);
	    information.setHave_child_not(child);
	    information.setGraduate_school(graduate_school);
	    user.setInformation(information);
	    MatchingAction match=new MatchingAction();
	    list=match.matching(user);
	    if(!(list==null)){
			session.setAttribute("userList", list);
			session.setAttribute("userSize", list.size());
			response.sendRedirect(request.getContextPath()+"/matching.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_MATCHING_SELECT );
			response.sendRedirect(request.getContextPath()+"/ErrorServlet");
		}
	}
}
