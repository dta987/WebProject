package Utility;

public class FlowreplyParameters {
	private String pageNumber ;
	private String pageSize ;
	private int Group_no;
	
	@Override
	public String toString() {
		return "pageNumber=" + pageNumber + "&pageSize="
				+ pageSize + "&no=" + Group_no + "";
	}	
	
	public int getGroup_no() {
		return Group_no;
	}

	public void setGroup_no(int group_no) {
		Group_no = group_no;
	}
	
	/*@Override
	public String toString() {
		return "pageNumber=" + pageNumber + "&pageSize="
				+ pageSize + "&mode=" + mode + "&keyword=" + keyword + "";
	}*/
	public String getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
}