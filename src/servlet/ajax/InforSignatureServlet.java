package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.InformationAction;
import javaBean.Information;

/**
 * Servlet implementation class InforSignatureServlet
 */
public class InforSignatureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InforSignatureServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		response.setContentType("text/html;charset=utf-8");
		Information information =(Information) session.getAttribute("information");
		String motto=request.getParameter("motto");
		information.setMotto(motto);
		InformationAction iAction =new InformationAction();
		PrintWriter writer=response.getWriter();
		if(iAction.update(information)){
			writer.append(motto);
		}else{
			writer.append("0");
		}
	}

}
