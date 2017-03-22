package action;

import javaBean.User;
import utils.OptionDB;

public class RegisterAction {
	OptionDB db =new OptionDB();
	public boolean register(User user){
		boolean result=true;
		result=db.insertUser(user);
		return result;
	}
}
