package Control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;

public class meMypageController implements SuperController{

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward =  new ControllerForward();
		
		///////////개인정보를 불러오는 코딩
		
		
		
		
		forward.setRedirect(true);
		forward.setPath("/View/member/meMypage.jsp");
		
		return forward;
		
		
	}

}
