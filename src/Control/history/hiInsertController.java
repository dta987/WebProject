package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountains_history;
import Model.Mountains_historyDao;

public class hiInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		Mountains_historyDao dao = new Mountains_historyDao();
		int cnt = 0;
		
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null || session.getAttribute("id").equals("") || session.getAttribute("id").equals("null") ) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/meLoginForm.jsp");
		} else {
			Mountains_history history = new Mountains_history();
			
			history.setUser_id(req.getParameter("user_id"));
			history.setHiking_date(req.getParameter("hiking_date"));
			history.setHiking_memo(req.getParameter("hiking_memo"));
			history.setMountain_no(Integer.parseInt(req.getParameter("mountain_no")));
			
			cnt = dao.InsertData(history);
			
			
			if(cnt > 0 ) {
				forward.setRedirect(false);
				forward.setPath("/YamaManCtrl?command=hiList");
			} else {
				forward.setRedirect(true);
				forward.setPath("/View/review/reErrPage.jsp");
			}

		}

		return forward;
		
	}

}
