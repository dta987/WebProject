package Control.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.BoardDao;
import Utility.FlowParameters;

public class boDepthInsertFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();

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
		
		req.setAttribute("parameters", parameters.toString());

		int depth = Integer.parseInt(req.getParameter("depth"));
		int group_no = Integer.parseInt(req.getParameter("group_no"));
		int order_no = Integer.parseInt(req.getParameter("order_no"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		req.setAttribute("depth", depth);
		req.setAttribute("group_no", group_no);
		req.setAttribute("order_no", order_no);
		req.setAttribute("no", no);
		

		if (depth >= 3) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath()
					+ "/YamaManCtrl?command=boList");
			new boListController().doProcess(req, resp);
		} else {
			forward.setRedirect(false);
			forward.setPath("/View/board/boDepthInsertForm.jsp");
		}

		return forward;
	}

}
