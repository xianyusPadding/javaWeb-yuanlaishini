package action;

import java.util.List;

import javaBean.Information;
import javaBean.Share;
import javaBean.User;
import utils.OptionDB;

public class MakeFriendAction {
	OptionDB db =new OptionDB();
	public List<Share>selectShare_all(){
		return db.selectShare_all();
	}
	public Information selectInformation_user(String uid){
		InformationAction iAction=new InformationAction();
		User user =new User();
		user.setU_id(uid);
		return iAction.select(user);
	}
	public List<User> selectFriend_user(User user){
		return db.selectFriend_user(user);
	}
}
