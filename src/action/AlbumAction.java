package action;


import java.util.List;

import javaBean.Album;
import javaBean.User;
import utils.OptionDB;

public class AlbumAction {
	
	OptionDB db =new OptionDB();
	public boolean insert(Album album){
		return db.insertAlbum(album);
	}
	public List<Album> select(User user){
		return db.selectAlbum(user);
	}
}
