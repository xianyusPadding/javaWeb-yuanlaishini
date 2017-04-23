package action;

import java.util.List;

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
	public boolean update(User user){
		return db.alterUser(user);
	}
	public List<User> selectUser_all(String u_id){
		return db.selectUser_all(u_id);
	}
}
