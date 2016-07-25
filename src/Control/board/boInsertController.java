package Control.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;

public class boInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Member loginfo = (Member) session.getAttribute("loginfo");
		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		int cnt = 0;

		Board board = new Board();

		board.setBoard_writer(loginfo.getUser_id());
		board.setUser_nickname(loginfo.getUser_nickname());
		board.setBoard_category(req.getParameter("category"));
		board.setBoard_title(req.getParameter("title"));
		board.setBoard_content(req.getParameter("content"));

		cnt = dao.InsertBoard(board);

		if (cnt > 0) {
			forward.setRedirect(true);
			forward.setPath("/YamaManCtrl?command=boList");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		}

		return forward;

	}

}
