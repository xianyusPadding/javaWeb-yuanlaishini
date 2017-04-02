package action;

import java.util.List;

import javaBean.Photo;
import javaBean.User;
import utils.OptionDB;

public class UploadAction {
	OptionDB optionDB = new OptionDB();
	//上传图片到相册
	public boolean uploadImg(Photo photo){
		return optionDB.insertphoto(photo);
	}
	public boolean alterHeadImg(User user){
		return optionDB.alterUser(user);
	}
	//从一个相册选出所有图片
	public List<Photo> selectImg_album(Photo photo){
		return optionDB.selectPhoto_Ablum(photo);
	}
	//从一个用户选出所有相册图片
	public List<Photo> selectImg_user(Photo photo){
		return optionDB.selectPhoto_User(photo);
	}
	//选出一个用户所有相册的第一张图片
	public List<Photo> selectImg_single(Photo photo){
		return optionDB.selectPhoto_single(photo);
	}
}
