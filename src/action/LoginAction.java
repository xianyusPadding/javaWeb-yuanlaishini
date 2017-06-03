package action;

import javaBean.User;
import utils.OptionDB;

public class LoginAction {
	OptionDB db =new OptionDB();
	public User login(String username,String password){
		return db.login(username,password);
	}
}
