package Model;

public class Reply {
	
	private int reply_no; //리플 번호
	private int board_no; //게시글 번호
	private String reply_writer; //리플 작성자
	private String reply_writ_date; //리플 작성 시간
	private String reply_content; //리플 내용
	private String user_nickName; //작성자 닉네임
	
	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", board_no=" + board_no
				+ ", reply_writer=" + reply_writer + ", reply_writ_date="
				+ reply_writ_date + ", reply_content=" + reply_content
				+ ", user_nickName=" + user_nickName + "]";
	}
		
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_writ_date() {
		return reply_writ_date;
	}
	public void setReply_writ_date(String reply_writ_date) {
		this.reply_writ_date = reply_writ_date;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getUser_nickName() {
		return user_nickName;
	}
	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}
}
