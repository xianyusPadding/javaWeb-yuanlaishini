package action;

import javaBean.Information;
import javaBean.User;
import utils.OptionDB;

public class InformationAction {
	OptionDB db =new OptionDB();
	public boolean insert(Information information){
		return db.insertInformation(information);
	}
	public Information select(User user){
		return db.select(user);
	}
	public boolean update(Information information){
		return db.alterInformation(information);
	}
}
