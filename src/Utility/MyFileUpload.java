package Utility;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyFileUpload {
	public static MultipartRequest getMultiPartRequest( HttpServletRequest request, String uploadedPath  ){
		//파일 업로드를 위한 MultipartRequest 객체를 구해주는 static 메소드이다.
		
		String encType = "UTF-8"; //문자열 인코딩
		int sizeLimit = 20 * 1024 * 1024; //업로드 허용 최대 사이즈
		MultipartRequest multi = null ; //파일 업로드 객체
		
		try {
			multi = new MultipartRequest(request, uploadedPath, sizeLimit,
					encType, new DefaultFileRenamePolicy());
			
			/*String imagesPath = request.getContextPath() + "/images/" ; 
			
			File file = new File(uploadedPath);

			String pathname = imagesPath + file.getName();
			file.renameTo(new File(pathname));*/
			
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return multi ;
	}
}