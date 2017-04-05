package action;

import java.util.List;

import javaBean.Information;
import javaBean.Share;
import utils.OptionDB;

public class MakeFriendAction {
	OptionDB db =new OptionDB();
	public List<Share>selectShare_all(){
		return db.selectShare_all();
	}
	public Information selectInformation_user(String uid){
		InformationAction iAction=new InformationAction();
		Information information=new Information();
		information.setUid(uid);
		return iAction.select(information);
	}
}
