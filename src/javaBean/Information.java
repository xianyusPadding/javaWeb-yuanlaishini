package javaBean;

public class Information {
	private String uid;
	private String name;
	private String hobby;
	private String motto;
	private int start;
	private String friend;
	private String f_feeling;
	private String f_collection;
	private String where;
	private int weight;
	private String bloodtype;
	private String nation;
	private String house;
	private String have_child_not;
	private String graduate_school;
	private int height;
	
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}
	public String getF_feeling() {
		return f_feeling;
	}
	public void setF_feeling(String f_feeling) {
		this.f_feeling = f_feeling;
	}
	public String getF_collection() {
		return f_collection;
	}
	public void setF_collection(String f_collection) {
		this.f_collection = f_collection;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public String getHave_child_not() {
		return have_child_not;
	}
	public void setHave_child_not(String have_child_not) {
		this.have_child_not = have_child_not;
	}
	public String getGraduate_school() {
		return graduate_school;
	}
	public void setGraduate_school(String graduate_school) {
		this.graduate_school = graduate_school;
	}
	
	public Information(String uid, String name, String hobby, String motto, int start, String friend, String f_feeling,
			String f_collection, String where, int weight, String bloodtype, String nation, String house,
			String have_child_not, String graduate_school, int height) {
		this.uid = uid;
		this.name = name;
		this.hobby = hobby;
		this.motto = motto;
		this.start = start;
		this.friend = friend;
		this.f_feeling = f_feeling;
		this.f_collection = f_collection;
		this.where = where;
		this.weight = weight;
		this.bloodtype = bloodtype;
		this.nation = nation;
		this.house = house;
		this.have_child_not = have_child_not;
		this.graduate_school = graduate_school;
		this.height = height;
	}
	@Override
	public String toString() {
		return "Information [uid=" + uid + ", name=" + name + ", hobby=" + hobby + ", motto=" + motto + ", start="
				+ start + ", friend=" + friend + ", f_feeling=" + f_feeling + ", f_collection=" + f_collection
				+ ", height=" + height + ", weight=" + weight + ", bloodtype=" + bloodtype + ", nation=" + nation
				+ ", house=" + house + ", have_child_not=" + have_child_not + ", graduate_school=" + graduate_school
				+ ", where=" + where + "]";
	}
}
