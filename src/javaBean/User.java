package javaBean;

public class User {
	private String username;
	private String u_id;
	private String password;
	private	String sex;
	private String email;
	private String i_p_url;
	private int age;
	private int tall;
	private int salary;
	private String province;
	private String city;
	private String country;
	private String date;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getI_p_url() {
		return i_p_url;
	}
	public void setI_p_url(String i_p_url) {
		this.i_p_url = i_p_url;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getTall() {
		return tall;
	}
	public void setTall(int tall) {
		this.tall = tall;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public User(String username, String u_id, String password, String sex, String email, String i_p_url, int age,
			int tall, int salary, String province, String city, String country, String date) {
		super();
		this.username = username;
		this.u_id = u_id;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.i_p_url = i_p_url;
		this.age = age;
		this.tall = tall;
		this.salary = salary;
		this.province = province;
		this.city = city;
		this.country = country;
		this.date = date;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", u_id=" + u_id + ", password=" + password + ", sex=" + sex + ", email="
				+ email + ", i_p_url=" + i_p_url + ", age=" + age + ", tall=" + tall + ", salary=" + salary
				+ ", province=" + province + ", city=" + city + ", country=" + country + ", date=" + date + "]";
	}
}
