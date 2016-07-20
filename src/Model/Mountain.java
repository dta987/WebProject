package Model;

public class Mountain {

	private int mountain_no;
	private String mountain_name;
	private String mountain_address1;
	private String mountain_address2;
	private String mountain_img;
	private String mountain_introduce;
	private String updatedate;
	private int mountain_thema;

	
	
	@Override
    public String toString() {
	    return "Mountain [mountain_no=" + mountain_no + ", mountain_name=" + mountain_name + ", mountain_address1="
	            + mountain_address1 + ", mountain_address2=" + mountain_address2 + ", mountain_img=" + mountain_img
	            + ", mountain_introduce=" + mountain_introduce + ", updatedate=" + updatedate + ", mountain_thema="
	            + mountain_thema + "]";
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

	public String getMountain_address1() {
		return mountain_address1;
	}

	public void setMountain_address1(String mountain_address1) {
		this.mountain_address1 = mountain_address1;
	}

	public String getMountain_address2() {
		return mountain_address2;
	}

	public void setMountain_address2(String mountain_address2) {
		this.mountain_address2 = mountain_address2;
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

	public int getMountain_thema() {
		return mountain_thema;
	}

	public void setMountain_thema(int mountain_thema) {
		this.mountain_thema = mountain_thema;
	}
	
	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
}
