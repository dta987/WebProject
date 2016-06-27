package Model;

public class Title {

	private int title_no;
	private String title_name;
	private String title_condition;
	private String title_img;

	@Override
	public String toString() {
		return "Title [title_no=" + title_no + ", title_name=" + title_name
				+ ", title_condition=" + title_condition + ", title_img="
				+ title_img + "]";
	}

	public int getTitle_no() {
		return title_no;
	}

	public void setTitle_no(int title_no) {
		this.title_no = title_no;
	}

	public String getTitle_name() {
		return title_name;
	}

	public void setTitle_name(String title_name) {
		this.title_name = title_name;
	}

	public String getTitle_condition() {
		return title_condition;
	}

	public void setTitle_condition(String title_condition) {
		this.title_condition = title_condition;
	}

	public String getTitle_img() {
		return title_img;
	}

	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}

}
