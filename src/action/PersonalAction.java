package action;

import java.util.List;

import javaBean.Album;
import javaBean.Photo;
import javaBean.Share;
import javaBean.User;

public class PersonalAction {
	
	public List<Album> selectAlbum(User user){
		AlbumAction albumAction=new AlbumAction();
		return albumAction.select(user);
	}
	public List<Photo> selectImg_album(Photo photo){
		UploadAction uAction=new UploadAction();
		return uAction.selectImg_album(photo);
	}
	public List<Photo> selectImg_user(Photo photo){
		UploadAction uAction=new UploadAction();
		return uAction.selectImg_user(photo);
	}
	public List<Photo> selectImg_single(Photo photo){
		UploadAction uAction=new UploadAction();
		return uAction.selectImg_single(photo);
	}
	public List<Share> selectShare_user(User user){
		ShareAction sAction=new ShareAction();
		return sAction.selectShare_user(user);
	}
}
