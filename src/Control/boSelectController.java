package Control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Board;
import Model.BoardDao;

public class boSelectController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		List<Board> board_lists = new ArrayList<Board>();
		
		int no = Integer.parseInt(req.getParameter("board_no"));
		String title = req.getParameter("board_title");
		
		board_lists = dao.SelectBoard(no, title);
		
		if (board_lists.size() > 0) {
			req.setAttribute("board_lists", board_lists);
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/View/boReadFrom.jsp");
		} else {
			forward.setRedirect(false);
			String result = "게시글 " + title + "을(를) 불러 오지 못했습니다";
			req.setAttribute("errmsg", result);
			forward.setPath(req.getContextPath() + "/View/rvErrPage.jsp");

		}

		return forward;
		
	}
	
	

}
