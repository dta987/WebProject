package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

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
		MultipartRequest multi = (MultipartRequest) req.getAttribute("multi");
		
		Mountains_history history = new Mountains_history();
		
		history.setUser_id(multi.getParameter("user_id"));
		history.setHiking_date(multi.getParameter("hiking_date"));
		history.setHiking_memo(multi.getParameter("hiking_memo"));
		history.setMountain(multi.getParameter("mountain"));
		history.setHistory_no(Integer.parseInt(multi.getParameter("history_no")));
		
		
		int cnt = dao.UpdateData(history);

		if (cnt > 0) {
			
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/YamaManCtrl?command=hiUpdate");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
	}

}
