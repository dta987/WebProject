package Model;

public class Member {
	
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private String user_img;
	private String user_title;
	private String sign_date;
	
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_password="
				+ user_password + ", user_name=" + user_name + ", user_email="
				+ user_email + ", user_nickname=" + user_nickname
				+ ", user_img=" + user_img + ", user_title=" + user_title
				+ ", sign_date=" + sign_date + "]";
	}
	
	public String getSign_date() {
		return sign_date;
	}
	public void setSign_date(String sign_date) {
		this.sign_date = sign_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		if(user_img == null) {
			user_img = "";
		}
		this.user_img = user_img;
	}
	public String getUser_title() {
		return user_title;
	}
	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}	

}
