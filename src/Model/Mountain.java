package Model;

public class Mountain {
	
	private int mountain_no; //�� ��ȣ
	private String mountain_name; //�� �̸�
	private String mountain_position; //�� ��ġ
	private String mountain_img; //�� �̹���
	private String mountain_introduce; //�� ����
	
	@Override
	public String toString() {
		return "Mountain [mountain_no=" + mountain_no + ", mountain_name="
				+ mountain_name + ", mountain_position=" + mountain_position
				+ ", mountain_img=" + mountain_img + ", mountain_introduce="
				+ mountain_introduce + "]";
	}
	
	public int getMountain_no() {
		return mountain_no;
	}
	public void setMountain_no(int mountain_no) {
		this.mountain_no = mountain_no;
	}
	public String getMountain_name() {
		return mountain_name;
	}
	public void setMountain_name(String mountain_name) {
		this.mountain_name = mountain_name;
	}
	public String getMountain_position() {
		return mountain_position;
	}
	public void setMountain_position(String mountain_position) {
		this.mountain_position = mountain_position;
	}
	public String getMountain_img() {
		return mountain_img;
	}
	public void setMountain_img(String mountain_img) {
		this.mountain_img = mountain_img;
	}
	public String getMountain_introduce() {
		return mountain_introduce;
	}
	public void setMountain_introduce(String mountain_introduce) {
		this.mountain_introduce = mountain_introduce;
	}

}
