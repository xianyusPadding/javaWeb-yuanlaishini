package javaBean;

public class Friend {
	private String uid;
	private String fid;
	private int friend;
	private int f_feeling;
	private int f_collection;
	private User user;
	
	
	public Friend(String uid, String fid, int friend, int f_feeling, int f_collection) {
		super();
		this.uid = uid;
		this.fid = fid;
		this.friend = friend;
		this.f_feeling = f_feeling;
		this.f_collection = f_collection;
	}


	public Friend() {
		super();
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getFid() {
		return fid;
	}


	public void setFid(String fid) {
		this.fid = fid;
	}


	public int getFriend() {
		return friend;
	}


	public void setFriend(int friend) {
		this.friend = friend;
	}


	public int getF_feeling() {
		return f_feeling;
	}


	public void setF_feeling(int f_feeling) {
		this.f_feeling = f_feeling;
	}


	public int getF_collection() {
		return f_collection;
	}


	public void setF_collection(int f_collection) {
		this.f_collection = f_collection;
	}


	@Override
	public String toString() {
		return "Friend [uid=" + uid + ", fid=" + fid + ", friend=" + friend + ", f_feeling=" + f_feeling
				+ ", f_collection=" + f_collection + "]";
	}
	
}
