package action;

import javaBean.Information;
import javaBean.User;
import utils.OptionDB;

public class InformationAction {
	OptionDB db =new OptionDB();
	public boolean insert(Information information){
		return true;
	}
	public User selectUser_single(String u_id){
		return db.selectUser(u_id);
	}
	public boolean update(User user){
		return db.alterUser(user);
	}
}
