package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.MatchingAction;
import javaBean.Information;
import javaBean.User;

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
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
	    try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	  //设置编码，不然会出现乱码 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer=response.getWriter();
		for (int i = 0; i < list.size(); i++) {
			User user1 =list.get(i);
			  writer.append("<figure>")
					.append("<a href='otherPersonalServlet?uid="+user1.getU_id()+"'><img src='"+user1.getI_p_url()+"' alt='' /></a>")
					.append("<figcaption>")
					.append("<p>"+user1.getUsername()+"</p>")
					.append("<p>"+user1.getAge()+"岁&nbsp;&nbsp;</p>")
					.append("<p"+user1.getProvince()+"&nbsp;"+user1.getCity()+"&nbsp;"+user1.getCountry()+"&nbsp;&nbsp;</p>")
					.append("<p>"+user1.getInformation().getHeight()+"cm</p>")
					.append("<p>"+user1.getInformation().getMotto()+"</p>")
					.append("</figcaption>")
					.append("</figure>");
		}
	}
}
