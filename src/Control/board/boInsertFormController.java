package Control.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Board;
import Model.BoardDao;
import Utility.FlowParameters;
import Control.ControllerForward;
import Control.SuperController;

public class boInsertFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		Board board = null;
		List<Board> reply_lists = null;

		// �ڷΰ��� �� ������������ �̵�
		String mode = req.getParameter("mode");
		if (mode == null || mode.equals("null") || mode.equals("")) {
			mode = "all";
		}

		// keyword�� �޼ҵ� ȣ�� ������ %�� ���̵��� ����
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

		forward.setRedirect(true);
		forward.setPath("/View/board/boInsertForm.jsp");
		return forward;
	}

}
