package Control.mountain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;

public class moListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward() ;
		
		forward.setRedirect(false);
		forward.setPath("/View/mountain/moList.jsp");
		
		
		return forward;
	}

}
