package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.Mountains_history;
import Model.Mountains_historyDao;
import Model.MyInterface;

import com.oreilly.servlet.MultipartRequest;

public class hiInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		Mountains_historyDao dao = new Mountains_historyDao();
		int cnt = MyInterface.ERROR_DEFALT;
		
		HttpSession session = req.getSession();
		Member loginfo = (Member) session.getAttribute("loginfo");
		
		MultipartRequest multi = (MultipartRequest)req.getAttribute("multi");
		
		Mountains_history history = new Mountains_history();
		history.setUser_id(loginfo.getUser_id());
		String thema = multi.getParameter("thema");
		String mountain = "";
		
		if(thema.equals("ÈÊÄ«ÀÌµµ")) {
			mountain = multi.getParameter("area");
		}
		history.setHiking_date(multi.getParameter("datepicker"));
		history.setHiking_memo(multi.getParameter("hiking_memo"));
		history.setMountain(mountain);

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
