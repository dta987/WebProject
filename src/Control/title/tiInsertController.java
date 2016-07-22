package Control.title;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;

public class tiInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		//Title
		int cnt = 0;
		
		HttpSession session = req.getSession();
		if(session.getAttribute("title_no") == null || session.getAttribute("title_no").equals("")) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/tiInsertForm.jsp");
		} else {
			Board board = new Board();
			
			board.setBoard_writer(String.valueOf(session.getAttribute("id")));
			board.setUser_nickname(String.valueOf(session.getAttribute("nickname")));
			board.setBoard_category(Integer.parseInt(req.getParameter("category")));
			board.setBoard_title(req.getParameter("title"));
			board.setBoard_content(req.getParameter("content"));
			board.setBoard_img(req.getParameter("img"));
			
			//cnt = dao.InsertBoard(board);
			
			
			if(cnt > 0 ) {
				forward.setRedirect(false);
				forward.setPath("/YamaManCtrl?command=boList");
			} else {
				forward.setRedirect(true);
				forward.setPath("/View/review/reErrPage.jsp");
			}

		}

		return forward;
		
	}

}
