package Model;

public class Member {
	
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_emali;
	private String user_nickname;
	private String user_signdate;
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_password="
				+ user_password + ", user_name=" + user_name + ", user_emali="
				+ user_emali + ", user_nickname=" + user_nickname
				+ ", user_signdate=" + user_signdate + "]";
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
	public String getUser_emali() {
		return user_emali;
	}
	public void setUser_emali(String user_emali) {
		this.user_emali = user_emali;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_signdate() {
		return user_signdate;
	}
	public void setUser_signdate(String user_signdate) {
		this.user_signdate = user_signdate;
	}
	
	
	
	
	
}
