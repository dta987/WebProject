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
			
			forward.setRedirect(false);
			req.setAttribute("board_no", req.getParameter("board_no"));
			req.setAttribute("board_title", req.getParameter("board_title"));
			forward.setPath(req.getContextPath() + "/MiniShopCtrl?command=boSelect");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
		
	}

}
