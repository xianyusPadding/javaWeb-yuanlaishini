package action;

import java.util.List;

import javaBean.Comment;
import javaBean.Share;
import utils.OptionDB;

public class CommentAction {
	OptionDB db =new OptionDB();
	public boolean insert(Comment comment){
		return db.insertComment(comment);
	}
	public List<Comment> selectComment_share(Share share){
		return db.selectComment_share(share);
	}
}
