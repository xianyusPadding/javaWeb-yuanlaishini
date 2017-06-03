package action;

import java.util.List;

import javaBean.User;
import utils.OptionDB;

public class IndexAction {
	OptionDB db =new OptionDB();
	public List<User> selectUser(String u_id){
		return db.selectUser_all(u_id);
	}
	
	public List<User> selectUser_none( ){
		return db.selectUser_none();
	}
}
