package Control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.BoardDao;

public class boReplyFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		
		// depth >= 3, count(*) grupno
		BoardDao bdao = new BoardDao();
		// int cnt =
		// bdao.SelectReplyCount(Integer.parseInt(req.getParameter("no")));

		int depth = Integer.parseInt(req.getParameter("depth"));

//		if (depth >= 3) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/YamaManCtrl?command=boList");
			new boListController().doProcess(req, resp);
//		} else {
//			forward.setRedirect(false);
//			forward.setPath("/board/boReplyForm.jsp");
//		}

		return forward;
	}

}
