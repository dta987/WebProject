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
		List<Mountain> mountain_lists = null;
		
		int no = Integer.parseInt(req.getParameter("no"));
		mountain_lists = dao.SelectMountain(no);
		
		req.setAttribute("lists", mountain_lists);
		forward.setRedirect(false);
		forward.setPath("/View/mountain/moDetailView.jsp");

		return forward;
	}

}
