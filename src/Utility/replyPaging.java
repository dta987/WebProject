package Utility ;

public class replyPaging {
	//페이징 관련 변수
	private int totalCount = 0 ; //총 레코드 건수 
	//ex) 34
	private int totalPage = 0 ; //전체 페이지 수 
	//ex) 34/pageCount+1
	
	private int pageNumber = 0 ; //보여줄 페이지 넘버(표현 가능한 페이지는 1부터 totalPage까지이다.)
	//17	
	private int pageSize = 0 ; //한 페이지에 보여줄 건수
	//10
	private int beginRow = 0 ; //현재 페이지의 시작 행
	//pageNumber*pageSize-(pageSize-1) // boginRow = (pageNumber-1) * pageSize +1
	private int endRow = 0 ; //현재 페이지의 끝 행
	//pageNumber*pageCount // endRow = pageNumber * pageSize 
	
	private int pageCount = 5 ; //보여줄 페이지 링크 수
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	// beginPage = (pageNumber - 1) / pageCount * pageCount + 1
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	// endPage = beginPage 
	
	private String url = "" ; //예시 ==>  http://localhost:8989/MyServlet/list.do
	private String pagingHtml = "";//하단의 숫자 페이지 링크
	private String pagingStatus = ""; //상단 우측의 현재 페이지 위치 표시
	
	private int Group_no = 0;
		
	//pagination Size 변수
	private String paginationSize = " pagination-sm" ; //  pagination-lg   pagination-sm    pagination-xs

	
	public replyPaging(String _pageNumber, String _pageSize, int totalCount, String url, int Group_no) {
		if ( _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")) {
			_pageNumber = "1" ; 
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ;
		
		if ( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("")) {
			_pageSize = "5" ; 
		}
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.totalCount = totalCount ;
		this.url = url ;
		
		this.totalPage = (int)Math.ceil((double)totalCount / pageSize) ;
		
		this.beginRow = ( pageNumber - 1 ) * pageSize + 1 ;
		
		this.endRow = this.pageNumber * this.pageSize  ;

		this.beginPage = ( this.pageNumber -1 ) / this.pageCount * this.pageCount + 1 ;
		
		this.endPage = this.beginPage + this.pageCount - 1 ;  

		if( this.totalPage < this.endPage ){ this.endPage = this.totalPage ;  } 
		
		
		this.pagingHtml = this.getPagingHtml( url, Group_no ) ;
		
		this.pagingStatus = "총 " + totalCount + "건[" 
				+ this.pageNumber + "/" + this.totalPage + "]" ;
	
		this.Group_no = Group_no;
			
		//this.DisplayInformation(); 
		
	}

	private String getPagingHtml( String url, int Group_no ){ //페이징 문자열을 만든다.
		String result = "" ;
		
		result += "<ul class='pagination" + paginationSize + "'>";
		if ( pageNumber <= pageCount ) {//1부터 10페이지까지는 [맨처음]과 [이전]이 없다 
			//result += "맨처음&nbsp;&nbsp;";
			//result += "이전&nbsp;&nbsp;";			
		} else {
			result += "<li><a href='" + url + "&pageNumber=" + 1 + 
				"&pageSize=" + pageSize + "&no=" + Group_no + "'>맨처음</a></li>&nbsp;&nbsp;";
			System.out.println(result);
			
			result += "<li><a href='" + url + "&pageNumber=" + (beginPage - 1) + 
				"&pageSize=" + pageSize + "&no=" + Group_no + "'>이전</a></li>&nbsp;&nbsp;";
		}		
		//페이지 시작 번호 부터 ~ 끝 번호 까지 표시
		
		for (int i = beginPage ; i <= endPage ; i++) {
			if(i == pageNumber){ //현재 페이지이면 링크는 없고
				result += "<li class='active'><a><b>" + i + "</b></a></li>&nbsp;";
			}else{
				result += "<li><a href='" + url + "&pageNumber=" + i + 
					"&pageSize=" + pageSize + "&no=" + Group_no + "'>" + i + "</li></a>&nbsp;";	
			}			
		}
		
		//마지막에는 [다음]과 [맨끝]이 없다
		if ( pageNumber >= (totalPage / pageCount * pageCount + 1) ) {
			//result += "다음&nbsp;&nbsp;";
			//result += "맨 끝&nbsp;&nbsp;";	
		} else {			
			result += "<li><a href='" + url + "&pageNumber=" + (endPage + 1) + 
				"&pageSize=" + pageSize + "&no=" + Group_no + "'>다음</a></li>&nbsp;&nbsp;";
			
			result += "<li><a href='" + url + "&pageNumber=" + totalPage + 
				"&pageSize=" + pageSize + "&no=" + Group_no + "'>맨 끝</a></li>";
		}
		result += "</ul>"; 
		return result ;
	}	

	private void DisplayInformation() {
		System.out.println("총 레코드 건수 : " + totalCount + "\n");
		System.out.println("전체 페이지 수 : " + totalPage + "\n");
		System.out.println("보여줄 페이지 넘버 : " + pageNumber + "\n");
		System.out.println("한 페이지에 보여줄 건수 : " + pageSize + "\n");
		System.out.println("현재 페이지의 시작 행 : " + beginRow + "\n");
		System.out.println("현재 페이지의 끝 행 : " + endRow + "\n");
		System.out.println("보여줄 페이지 링크 수 : " + pageCount + "\n");
		System.out.println("페이징 처리 시작 페이지 번호 : " + beginPage + "\n");
		System.out.println("페이징 처리 끝 페이지 번호 : " + endPage + "\n");
		System.out.println("요청 URL : " + url + "\n");
		//System.out.println("하단의 숫자 페이지 링크 : " + pagingHtml + "\n");
		System.out.println("상단 우측의 현재 페이지 위치 표시 : " + pagingStatus + "\n");	
	}
	
	public String getPagingHtml() {	return pagingHtml;}
	public int getPageNumber() {	return pageNumber;}
	public int getPageSize() {	return pageSize;}	
	public String getPagingStatus() {	return pagingStatus;}	
	public int getBeginRow() {	return beginRow;}
	public int getEndRow() {	return endRow;}
	public int getGroup_no() {	return Group_no;}
	
	//상세 검색을 위하여 검색 모드와 검색 키워드 항목이 추가
}






