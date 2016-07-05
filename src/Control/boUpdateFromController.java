package Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class boUpdateFromController implements SuperController{

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/View/boUpdateFrom.jsp");

		return forward;
	}

}
