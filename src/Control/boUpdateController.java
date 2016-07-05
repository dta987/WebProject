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

public class boUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		Board board = new Board();
		BoardDao dao = new BoardDao();
		
		HttpSession Session = req.getSession(); 
		board.setBoard_no(Integer.parseInt(req.getParameter("board_no")));
		board.setBoard_category(Integer.parseInt(req.getParameter("board_category")));
		board.setBoard_title(req.getParameter("board_title"));
		board.setBoard_content(req.getParameter("board_content"));
		board.setBoard_img(req.getParameter("board_img"));
		board.setUser_nickname(String.valueOf(Session.getAttribute("nickname")));
		
		int cnt = dao.UpdateBoard(board);
		

		if (cnt > 0) {
			
			List<Board> board_lists = new ArrayList<Board>();
			
			int no = Integer.parseInt(req.getParameter("board_no"));
			String title = req.getParameter("board_title");
			board_lists = dao.SelectBoard(no, title);
			
			req.setAttribute("board_lists", board_lists);
			
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/View/boReadFrom.jsp");
			
		} else {
			forward.setRedirect(false);
			String result = "게시글 " + req.getParameter("board_title") + "을(를) 수정 하지 못했습니다.";
			req.setAttribute("errmsg", result);
			forward.setPath(req.getContextPath() + "/View/rvErrPage.jsp");

		}

		return forward;
		
	}

}
