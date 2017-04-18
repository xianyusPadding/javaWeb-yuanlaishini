package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ShareAction;
import javaBean.Share;

public class UpdateShareStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateShareStart() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		ShareAction sAction=new ShareAction();
		Share share =new Share();
		String sid=request.getParameter("s_id");
		share.setS_id(Integer.parseInt(sid));
		share=sAction.select(share);
		share.setStartNum(share.getStartNum()+1);
		share.setReadNum(share.getReadNum()+1);
		PrintWriter writer=response.getWriter();
		if(sAction.update(share)){
			writer.append(share.getStartNum()+"");
		}else{
			writer.append("0");
		}
	}
}
