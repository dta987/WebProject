package Model;

public class Mountain {

	private int mountain_no;
	private String mountain_name;
	private String mountain_area;
	private String mountain_address;
	private String mountain_img;
	private String mountain_introduce;
	private String updatedate;
	private String mountain_thema;
	@Override
    public String toString() {
	    return "Mountain [mountain_no=" + mountain_no + ", mountain_name=" + mountain_name + ", mountain_area=" + mountain_area
	            + ", mountain_address=" + mountain_address + ", mountain_img=" + mountain_img + ", mountain_introduce="
	            + mountain_introduce + ", updatedate=" + updatedate + ", mountain_thema=" + mountain_thema + "]";
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
	public String getMountain_area() {
		return mountain_area;
	}
	public void setMountain_area(String mountain_area) {
		this.mountain_area = mountain_area;
	}
	public String getMountain_address() {
		return mountain_address;
	}
	public void setMountain_address(String mountain_address) {
		this.mountain_address = mountain_address;
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
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getMountain_thema() {
		return mountain_thema;
	}
	public void setMountain_thema(String mountain_thema) {
		this.mountain_thema = mountain_thema;
	}
	
	
}
