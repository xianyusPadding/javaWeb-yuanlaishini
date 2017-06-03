package action;

import java.util.List;
import javaBean.User;
import utils.OptionDB;

public class MatchingAction {
	OptionDB db=new OptionDB();
	
	public List<User> selectUser(String uid){
		return db.selectUser_all(uid);
	}
	
	public List<User> matching(User user){
		return db.matching(user);
	}
}
