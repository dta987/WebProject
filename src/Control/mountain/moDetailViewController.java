package Control.mountain;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.Mountain;
import Model.MountainDao;

public class moDetailViewController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ControllerForward forward = new ControllerForward();
		MountainDao dao = new MountainDao();
		Mountain bean = null;
		
		int no = Integer.parseInt(req.getParameter("no"));
		bean = dao.SelectMountain(no);
		
		req.setAttribute("bean", bean);
		forward.setRedirect(false);
		forward.setPath("/View/mountain/moDetailView.jsp");

		return forward;
	}

}
