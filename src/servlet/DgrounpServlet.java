package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.DgrounpAction;
import javaBean.Dgrounp;
import javaBean.User;
import utils.MyConstant;

public class DgrounpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DgrounpServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		String dg_title =request.getParameter("dg_title");
		if(dg_title==""){
			session.setAttribute("status",MyConstant.STATUS_DGROUNP_TEMPTY);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
		String flag =request.getParameter("addGroup");
		if(flag.equals("0"))flag="公开";else flag="私密";
		
		DgrounpAction dAction=new DgrounpAction();
		Dgrounp dgrounp =new Dgrounp(0, user.getU_id(), dg_title, flag,null);
		boolean rs =dAction.insert(dgrounp);
		if(rs){
			List<Dgrounp> list =dAction.select(user);
			session.setAttribute("dg_list", list);
			session.setAttribute("dg_size", list.size());
			response.sendRedirect(request.getContextPath()+"/personal.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_DGROUNP_INSERT);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
