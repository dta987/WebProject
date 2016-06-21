package Model;

public class Board {
	
	private int board_no; //게시글 번호
	private String board_writer; //게시글 작성자
	private String board_writ_date; //게시글 작성 시간
	private String board_content; //게시글 내용
	private String board_img; //게시글 이미지
	private String user_nickName; //작성자 닉네임
	
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_writer=" + board_writer
				+ ", board_writ_date=" + board_writ_date + ", board_content="
				+ board_content + ", board_img=" + board_img
				+ ", user_nickName=" + user_nickName + "]";
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_writ_date() {
		return board_writ_date;
	}
	public void setBoard_writ_date(String board_writ_date) {
		this.board_writ_date = board_writ_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public String getUser_nickName() {
		return user_nickName;
	}
	public void setUser_nickName(String user_nickName) {
		this.user_nickName = user_nickName;
	}
}
