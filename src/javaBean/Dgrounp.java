package javaBean;

public class Dgrounp {
	private int dg_id;
	private String u_id;
	private String dg_title;
	private String flag;
	private String date;
	public int getDg_id() {
		return dg_id;
	}
	public void setDg_id(int dg_id) {
		this.dg_id = dg_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getDg_title() {
		return dg_title;
	}
	public void setDg_title(String dg_title) {
		this.dg_title = dg_title;
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
	public Dgrounp(int dg_id, String u_id, String dg_title, String flag, String date) {
		super();
		this.dg_id = dg_id;
		this.u_id = u_id;
		this.dg_title = dg_title;
		this.flag = flag;
		this.date = date;
	}
	public Dgrounp() {
		super();
	}
	@Override
	public String toString() {
		return "Dgrounp [dg_id=" + dg_id + ", u_id=" + u_id + ", dg_title=" + dg_title + ", flag=" + flag + ", date="
				+ date + "]";
	}
}
