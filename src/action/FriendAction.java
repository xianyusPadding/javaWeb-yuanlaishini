package action;

import java.util.List;

import javaBean.Friend;
import javaBean.User;
import utils.OptionDB;

public class FriendAction {
	OptionDB db =new OptionDB();
	public boolean insert(Friend friend){
		return db.insertFriend(friend);
	}
	public Friend select_single(Friend friend){
		return db.selectFriend_single(friend);
	}
	
	public List<User> selectFriend_user(User user){
		return db.selectFriend_user(user);
	}
	
	public boolean delFriend(Friend friend){
		return db.deleteFriend(friend);
	}
	
}
