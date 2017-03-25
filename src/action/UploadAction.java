package action;

import javaBean.Photo;
import utils.OptionDB;

public class UploadAction {
	OptionDB optionDB = new OptionDB();
	public boolean uploadImg(Photo photo){
		return optionDB.insertphoto(photo);
	}
}
