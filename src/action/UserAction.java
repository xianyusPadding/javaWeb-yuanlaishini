package action;

import javaBean.User;
import utils.OptionDB;

public class UserAction {
	OptionDB db =new OptionDB();
	public boolean insert(User user){
		return db.insertUser(user);
	}
	public User selectUser_single(String u_id){
		return db.selectUser(u_id);
	}
}
