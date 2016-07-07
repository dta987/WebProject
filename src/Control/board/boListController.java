package Control.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Model.MemberDao;

public class boListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();

		List<Board> board_lists = dao.BoardList();

		if (board_lists.size() > 0) {
			req.setAttribute("board_lists", board_lists);
			forward.setRedirect(false);
			forward.setPath("/View/board/boListFrom.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/board/rvErrPage.jsp");

		}

		return forward;
	}

}
