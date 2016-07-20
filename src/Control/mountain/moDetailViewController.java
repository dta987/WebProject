package Control.mountain;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Model.Mountains;

public class moDetailViewController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ControllerForward forward = new ControllerForward();
		 dao = new BoardDao();
		List<Mountains> mountain_lists = null;
		
		int no = Integer.parseInt(req.getParameter("no"));
		mountain_lists = dao.(no);
		
		Member loginfo = (Member)req.getSession().getAttribute("loginfo");
		if(loginfo.getUser_id() != req.getParameter("id")) {
			dao.updatereadhit(no);
		}
		
		
		req.setAttribute("lists", mountain_lists);
		forward.setRedirect(false);
		forward.setPath("/View/member/meDetailView.jsp");

		return forward;
	}

}
