package action;

import java.util.List;

import javaBean.Dgrounp;
import javaBean.User;
import utils.OptionDB;

public class DgrounpAction {
	OptionDB db =new OptionDB();
	public boolean insert(Dgrounp dgrounp){
		return db.insertDgrounp(dgrounp);
	}
	public List<Dgrounp> select(User user){
		return db.selectDgrounp(user);
	}
}
