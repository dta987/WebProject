package Utility ;

public class pageTest {
	public static void main(String[] args) {
		String _pageNumber = "3" ;
		String _pageSize = "10" ;
		int totalCount = 35 ;
		String url = "boList.jsp" ;
		String mode = "" ;
		String keyword = "" ;
		
		Paging pageInfo = new Paging( _pageNumber, _pageSize, totalCount, url, mode, keyword ) ;
		
		//pageTest.jsp 파일 만드시고, 아래의 결과물을 <body> 태그에 넣어서 실행하세요.
		
		System.out.println( pageInfo.getPagingHtml() );
	}
}