package action;

import java.util.List;

import javaBean.Album;
import javaBean.User;

public class PersonalAction {
	
	public List<Album> selectAlbum(User user){
		AlbumAction albumAction=new AlbumAction();
		return albumAction.select(user);
	}
	
}
