package action;


import java.util.ArrayList;
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
		List<Album> list =new ArrayList<>();
		list=db.selectAlbum(user);
		return list;
	}
}
