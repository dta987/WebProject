package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utility.FlowParameters;
import Control.ControllerForward;
import Control.SuperController;

public class hiInsertFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();

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
		
		forward.setRedirect(false);
		forward.setPath("/View/history/hiInsertForm.jsp");

		return forward;
	}

}
