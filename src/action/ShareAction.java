package action;

import java.util.List;

import javaBean.Share;
import javaBean.User;
import utils.OptionDB;

public class ShareAction {
	OptionDB db =new OptionDB();
	public boolean insertShare(Share share){
		return db.insertShare(share);
	}
	public List<Share>selectShare_user(User user){
		return db.selectShare_user(user);
	}
	
	public List<Share>selectShare_all(){
		return db.selectShare_all();
	}
}
