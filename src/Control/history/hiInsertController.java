package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountains_history;
import Model.Mountains_historyDao;
import Model.MyInterface;

public class hiInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		Mountains_historyDao dao = new Mountains_historyDao();
		int cnt = MyInterface.ERROR_DEFALT;
		MultipartRequest multi = (MultipartRequest)req.getAttribute("multi");
		
		Mountains_history history = new Mountains_history();
		history.setUser_id(multi.getParameter("user_id"));
		history.setHiking_date(multi.getParameter("hiking_date"));
		history.setHiking_memo(multi.getParameter("hiking_memo"));
		history.setMountain_no(Integer.parseInt(multi.getParameter("mountain_no")));

		cnt = dao.InsertData(history);

		if (cnt > 0) {
			forward.setRedirect(false);
			forward.setPath("/YamaManCtrl?command=hiList");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		}

		return forward;

	}

}
