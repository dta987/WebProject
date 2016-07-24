package Model;

public class Board {
	
	private int board_no;
	private String board_category;
	private String board_title;
	private String board_writer;
	private String board_writ_date;
	private String board_update;
	private String board_content;
	private String board_img;
	private String board_readhit;
	private String user_nickname;
	private int group_no; //게시글 번호
	private int order_no; //댓글 번호
	private int depth;
	
	@Override
	public String toString() {
		return "Boards [board_no=" + board_no + ", board_category="
				+ board_category + ", board_title=" + board_title
				+ ", board_writer=" + board_writer + ", board_writ_date="
				+ board_writ_date + ", board_update=" + board_update
				+ ", board_content=" + board_content + ", board_img="
				+ board_img + ", board_readhit=" + board_readhit
				+ ", user_nickname=" + user_nickname + ", group_no=" + group_no
				+ ", order_no=" + order_no + ", depth=" + depth + "]";
	}
	
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
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

	public String getBoard_update() {
		return board_update;
	}

	public void setBoard_update(String board_update) {
		this.board_update = board_update;
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

	public String getBoard_readhit() {
		return board_readhit;
	}

	public void setBoard_readhit(String board_readhit) {
		this.board_readhit = board_readhit;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
