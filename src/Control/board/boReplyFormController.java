package Control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.BoardDao;

public class boReplyFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//depth >= 3, count(*) grupno
		BoardDao bdao = new BoardDao();
		int cnt = bdao.SelectReplyCount(Integer.parseInt(req.getParameter("no")));
		int depth = Integer.parseInt(req.getParameter("depth"));
		if( cnt >=10 || depth >= 3){
			new boListController().doProcess(req, resp);
		}else{
			String url = "/board/boReplyForm.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(url);
			dispatcher.forward(req, resp);
		}
		return null;
	}

}
