package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.FriendAction;
import javaBean.Friend;

public class FriendAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FriendAddServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("uid");
		String fid=request.getParameter("fid");
		String fri=request.getParameter("friend");
		String f_feeling=request.getParameter("f_feeling");
		String f_collection=request.getParameter("f_collection");
		FriendAction fAction =new FriendAction();
		Friend friend=new Friend();
		friend.setUid(uid);
		friend.setFid(fid);
		if(fri!=null)
			friend.setFriend(Integer.parseInt(fri));
		if(f_feeling!=null)
			friend.setF_feeling(Integer.parseInt(f_feeling));
		if(f_collection!=null)
			friend.setF_collection(Integer.parseInt(f_collection));
		PrintWriter writer=response.getWriter();
		if(fAction.insert(friend)){
		}else{
			writer.append("0");
		}
	}
}
