package Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Controller(컨트롤러) 인터페이스 : 모든 컨트롤러들의 부모 인터페이스
//요청이 들어오게 되면 특정한 컨트롤러(동작)를 수행해주기 위한 인터페이스 
public interface SuperController {
	//모든 비즈니스 로직을 수행하기 위한 추상 메소드를 정의한다.
	public ControllerForward doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException;
	
}