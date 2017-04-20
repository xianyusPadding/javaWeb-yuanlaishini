package action;

import java.util.List;

import javaBean.Diary;
import javaBean.User;
import utils.OptionDB;

public class DiaryAction {
	OptionDB db =new OptionDB();
	public boolean insertDiary(Diary diary){
		return db.insertDiary(diary);
	}
	public Diary select(Diary diary){
		return db.selectDiary_single(diary);
	}
	
	public boolean update(Diary diary){
		return db.alterDiary(diary);
	}
	public List<Diary>selectDiary_user(User user){
		return db.selectDiary_user(user);
	}
	
	public List<Diary>selectDiary_all(){
		return db.selectDiary_all();
	}
	
	public List<Diary>selectDiary_page(int index){
		return db.selectDiary_page(index);
	}
}
