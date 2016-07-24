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

public class boReplyInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		int cnt = 0;
		
		Board board = new Board();

		board.setBoard_writer(req.getParameter("id"));
		board.setUser_nickname(req.getParameter("nickname"));
		board.setBoard_content(req.getParameter("content"));
		int group_no = Integer.parseInt(req.getParameter("group_no"));
		board.setGroup_no(group_no );
		int order_no = Integer.parseInt(req.getParameter("order_no"));
		board.setOrder_no(order_no + 1);
		int depth = Integer.parseInt(req.getParameter("depth"));
		board.setDepth(depth);

		
		cnt = dao.UpdateReply(group_no, order_no);
		cnt = dao.InsertReply(board);
		

		if (cnt > 0) {
			forward.setRedirect(true);
			forward.setPath("/YamaManCtrl?command=boDetailView&no="+ group_no);
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		}

		return forward;

	}

}
