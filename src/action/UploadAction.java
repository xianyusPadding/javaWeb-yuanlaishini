package action;

import java.util.List;

import javaBean.Photo;
import utils.OptionDB;

public class UploadAction {
	OptionDB optionDB = new OptionDB();
	public boolean uploadImg(Photo photo){
		return optionDB.insertphoto(photo);
	}
	public List<Photo> selectImg_album(Photo photo){
		return optionDB.selectPhoto_Ablum(photo);
	}
	public List<Photo> selectImg_user(Photo photo){
		return optionDB.selectPhoto_User(photo);
	}
}
