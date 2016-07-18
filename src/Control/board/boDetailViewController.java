package Control.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Model.MemberDao;

public class boDetailViewController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		List<Board> board_lists = null;
		
		int no = Integer.parseInt(req.getParameter("no"));
		board_lists = dao.SelectBoard(no);
		
		Member loginfo = (Member)req.getSession().getAttribute("loginfo");
		if(loginfo.getUser_id() != req.getParameter("id")) {
			dao.updatereadhit(no);
		}
		
		
		req.setAttribute("lists", board_lists);
		forward.setRedirect(false);
		forward.setPath("/View/member/meDetailView.jsp");

		return forward;

	}

}
