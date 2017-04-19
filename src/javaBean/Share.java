package javaBean;

import java.util.List;

public class Share {
	private int s_id;
	private String u_id;
	private String s_title;
	private String s_content;
	private String s_p_url;
	private int startNum;
	private int readNum;
	private String flag;
	private String date;
	private User user;
	private List<Comment> listComment;

	public Share() {
		super();
	}
	
	public List<Comment> getListComment() {
		return listComment;
	}
	public void setListComment(List<Comment> listComment) {
		this.listComment = listComment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_p_url() {
		return s_p_url;
	}
	public void setS_p_url(String s_p_url) {
		this.s_p_url = s_p_url;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public Share(int s_id, String u_id, String s_title, String s_content, String s_p_url, int startNum, int readNum,
			String flag, String date) {
		super();
		this.s_id = s_id;
		this.u_id = u_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_p_url = s_p_url;
		this.startNum = startNum;
		this.readNum = readNum;
		this.flag = flag;
		this.date = date;
	}
	@Override
	public String toString() {
		return "share [s_id=" + s_id + ", u_id=" + u_id + ", s_title=" + s_title + ", s_content=" + s_content
				+ ", s_p_url=" + s_p_url + ", startNum=" + startNum + ", readNum=" + readNum + ", flag=" + flag
				+ ", date=" + date + "]";
	}
}
