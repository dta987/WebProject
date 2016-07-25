package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountain;
import Model.MountainDao;
import Model.Mountains_history;
import Model.Mountains_historyDao;
import Model.Title;
import Model.TitleDao;

public class hiUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		Mountains_historyDao dao = new Mountains_historyDao();

		Mountains_history history = new Mountains_history();
		
		int history_no = Integer.parseInt(req.getParameter("history_no"));
		
		history.setUser_id(req.getParameter("user_id"));
		history.setHiking_date(req.getParameter("hiking_date"));
		history.setHiking_memo(req.getParameter("hiking_memo"));
		history.setMountain_no(Integer.parseInt(req.getParameter("mountain_no")));
		history.setHistory_no(history_no);
		
		
		int cnt = dao.UpdateData(history);

		if (cnt > 0) {
			
			forward.setRedirect(false);
			req.setAttribute("history_no", history_no);
			forward.setPath(req.getContextPath() + "/YamaManCtrl?command=hiUpdate");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
	}

}
