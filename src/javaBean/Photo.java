package javaBean;
public class Photo {
	private int u_p_id;
	private String u_id;
	private int a_id;
	private String a_p_url;
	private String date;
	public Photo(int u_p_id, String u_id, int a_id, String a_p_url, String date) {
		this.u_p_id = u_p_id;
		this.u_id = u_id;
		this.a_id = a_id;
		this.a_p_url = a_p_url;
		this.date = date;
	}
	public int getU_p_id() {
		return u_p_id;
	}
	public void setU_p_id(int u_p_id) {
		this.u_p_id = u_p_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getA_p_url() {
		return a_p_url;
	}
	public void setA_p_url(String a_p_url) {
		this.a_p_url = a_p_url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

	@Override
	public String toString() {
		return "UnloadPhotoAlbum [u_p_id=" + u_p_id + ", u_id=" + u_id + 
				", a_id=" + a_id + ", a_p_url=" + a_p_url
				+ ", date=" + date + "]";
	}
	
	
}
