package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.MakeFriendAction;
import javaBean.Information;
import javaBean.Share;
import javaBean.User;
import utils.MyConstant;

public class MakeFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MakeFriendServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null) {
			MakeFriendAction mAction =new MakeFriendAction();
			List<Share>shareList =mAction.selectShare_all();
			Information information=mAction.selectInformation_user(user.getU_id());
			//当前用户的好友列表
			List<User> userList =mAction.selectFriend_user(user);
			List<User> userFriend=new ArrayList<>();
			List<User> userFeel=new ArrayList<>();
			List<User> userFcollect=new ArrayList<>();
			for (int i = 0; i < userList.size(); i++) {
				User u =userList.get(i);
				if(u.getFriend().getFriend()==1)
					userFriend.add(u);
				if(u.getFriend().getF_feeling()==1)
					userFeel.add(u);
				if(u.getFriend().getF_collection()==1)
					userFcollect.add(u);
			}
			
			session.setAttribute("userFriend",userFriend );
			session.setAttribute("userFeel",userFeel );
			session.setAttribute("userFcollect",userFcollect );
			
			session.setAttribute("shareList",shareList );
			session.setAttribute("shareSize", shareList.size());
			
			session.setAttribute("information", information);
			response.sendRedirect(request.getContextPath()+"/makeFriend.jsp");
		}else{
			session.setAttribute("status",MyConstant.STATUS_AUTHOR);
			response.sendRedirect(request.getContextPath()+"/errorServlet");
		}
	}
}
