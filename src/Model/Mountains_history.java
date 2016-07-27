package Model;

public class Mountains_history {

	private int history_no;
	private String user_id;
	private String mountain;
	private String mountain_name;
	private String hiking_date;
	private String hiking_memo;
	@Override
    public String toString() {
	    return "Mountains_history [history_no=" + history_no + ", user_id=" + user_id + ", mountain=" + mountain
	            + ", mountain_name=" + mountain_name + ", hiking_date=" + hiking_date + ", hiking_memo=" + hiking_memo + "]";
    }
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMountain() {
		return mountain;
	}
	public void setMountain(String mountain) {
		this.mountain = mountain;
	}
	public String getHiking_date() {
		return hiking_date;
	}
	public void setHiking_date(String hiking_date) {
		this.hiking_date = hiking_date;
	}
	public String getHiking_memo() {
		return hiking_memo;
	}
	public void setHiking_memo(String hiking_memo) {
		this.hiking_memo = hiking_memo;
	}
	public String getMountain_name() {
		return mountain_name;
	}
	public void setMountain_name(String mountain_name) {
		this.mountain_name = mountain_name;
	}
	
	

}
