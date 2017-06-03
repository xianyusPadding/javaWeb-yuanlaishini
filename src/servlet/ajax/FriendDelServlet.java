package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.FriendAction;
import javaBean.Friend;
public class FriendDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FriendDelServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("uid");
		String fid=request.getParameter("fid");
		FriendAction fAction =new FriendAction();
		Friend friend=new Friend();
		friend.setUid(uid);
		friend.setFid(fid);
		PrintWriter writer=response.getWriter();
		if(fAction.delFriend(friend)){
		}else{
			writer.append("0");
		}
	}
}
