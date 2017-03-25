package javaBean;

public class Comment {
	private int cid;
	private String uid;
	private int sid;
	private String cContent;
	private String date;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	public Comment(int cid, String uid, int sid, String cContent, String date) {
		super();
		this.cid = cid;
		this.uid = uid;
		this.sid = sid;
		this.cContent = cContent;
		this.date = date;
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", uid=" + uid + ", sid=" + sid +
				", cContent=" + cContent + ", date=" + date
				+ "]";
	}
	
}
