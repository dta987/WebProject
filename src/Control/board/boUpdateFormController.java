package Control.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Model.MemberDao;
import Utility.FlowParameters;

public class boUpdateFormController implements SuperController{

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		Board bean = new Board();

		// 뒤로가기 시 보던페이지로 이동
		String mode = req.getParameter("mode");
		if (mode == null || mode.equals("null") || mode.equals("")) {
			mode = "all";
		}

		// keyword는 메소드 호출 시점에 %를 붙이도록 하자
		String keyword = req.getParameter("keyword");
		if (keyword == null || keyword.equals("null")) {
			keyword = "";
		}

		String pageNumber = req.getParameter("pageNumber");
		String pageSize = req.getParameter("pageSize");

		FlowParameters parameters = new FlowParameters();
		parameters.setKeyword(keyword);
		parameters.setMode(mode);
		parameters.setPageNumber(pageNumber);
		parameters.setPageSize(pageSize);
		
		int no = Integer.parseInt(req.getParameter("no"));
		bean = dao.SelectBoard(no);
		
		req.setAttribute("bean", bean);



		forward.setRedirect(false);
		forward.setPath("/View/board/boUpdateForm.jsp");

		return forward;
	}

}
