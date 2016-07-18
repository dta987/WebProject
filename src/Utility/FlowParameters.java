package Utility;

public class FlowParameters {
	private String pageNumber ;
	private String pageSize ;
	private String mode = "" ;
	private String keyword = "" ;
	
	
	@Override
	public String toString() {
		return "pageNumber=" + pageNumber + "&pageSize="
				+ pageSize + "&mode=" + mode + "&keyword=" + keyword + "";
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
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	 
	
}