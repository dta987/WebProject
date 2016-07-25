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

public class boDepthInsertController implements SuperController {

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
		int group_no = Integer.parseInt(req.getParameter("group_no"));
		board.setGroup_no(group_no);
		int order_no = Integer.parseInt(req.getParameter("order_no"));
		board.setOrder_no(order_no + 1);
		int depth = Integer.parseInt(req.getParameter("depth"));
		board.setDepth(depth + 1);
		int no = Integer.parseInt(req.getParameter("no"));
		board.setBoard_no(no);
		board.setBoard_title(req.getParameter("title"));
		board.setBoard_content(req.getParameter("content"));

		cnt = dao.UpdateReply(group_no, order_no);
		cnt = dao.UpdateReplyDepth(group_no, order_no, depth);
		cnt = dao.insertDepth(board);

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
