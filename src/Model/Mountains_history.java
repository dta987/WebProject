package Model;

public class Mountains_history {

	private int history_no;
	private String user_id;
	private int mountain_no;
	private String hiking_date;
	private String hiking_memo;
	@Override
    public String toString() {
	    return "Mountains_history [history_no=" + history_no + ", user_id=" + user_id + ", mountain_no=" + mountain_no
	            + ", hiking_date=" + hiking_date + ", hiking_memo=" + hiking_memo + "]";
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
	public int getMountain_no() {
		return mountain_no;
	}
	public void setMountain_no(int mountain_no) {
		this.mountain_no = mountain_no;
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
	
	

}
