package action;

import javaBean.Information;
import utils.OptionDB;

public class InformationAction {
	OptionDB db =new OptionDB();
	public boolean insert(Information information){
		return db.insertInformation(information);
	}
	public Information select(Information information){
		return db.select(information);
	}
	public boolean update(Information information){
		return db.alterInformation(information);
	}
}
