package Control.history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountains_history;
import Model.Mountains_historyDao;
import Utility.FlowParameters;
import Utility.Paging;

public class hiListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ControllerForward forward = new ControllerForward();
		Mountains_historyDao dao = new Mountains_historyDao();

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

		int totalCount = dao.selectCount();
		System.out.println("totalCount : " + totalCount);

		String myurl = req.getContextPath() + "/YamaManCtrl?command=hiList";

		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, myurl,
				mode, keyword);

		List<Mountains_history> lists = dao.SelectDataList(pageInfo.getBeginRow(), pageInfo.getEndRow(), mode, keyword);

		req.setAttribute("lists", lists);
		req.setAttribute("pagingHtml", pageInfo.getPagingHtml());
		req.setAttribute("pagingStatus", pageInfo.getPagingStatus());

		req.setAttribute("mode", mode);
		req.setAttribute("keyword", keyword);

		req.setAttribute("parameters", parameters.toString());

		forward.setRedirect(false);
		forward.setPath("/View/history/hiList.jsp");

		return forward;
	}

}
