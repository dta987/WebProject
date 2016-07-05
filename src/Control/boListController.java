package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/boListFrom.jsp");
		} else {
			forward.setRedirect(false);
			String result = "회원목록을 불러 오지 못했습니다";
			req.setAttribute("errmsg", result);
			forward.setPath(req.getContextPath() + "/View/rvErrPage.jsp");

		}

		return forward;
	}

}
