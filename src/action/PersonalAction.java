package action;

import java.util.List;

import javaBean.Album;
import javaBean.Photo;
import javaBean.User;

public class PersonalAction {
	
	public List<Album> selectAlbum(User user){
		AlbumAction albumAction=new AlbumAction();
		return albumAction.select(user);
	}
	public List<Photo> selectImg_user(Photo photo){
		UploadAction uAction=new UploadAction();
		return uAction.selectImg_user(photo);
	}
}
