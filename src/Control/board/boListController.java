package Control.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Model.MemberDao;
import Utility.Paging;

public class boListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();

		String _pageNumber = req.getParameter("pageNumber");
		String _pageSize = req.getParameter("pageSize");
		String mode = null;
		String keyword = null;
		int totalCount = dao.selectCount();
		System.out.println("totalCount : " + totalCount);

		String myurl = req.getContextPath() + "/YamaManCtrl?command=boList";

		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, myurl,
				mode, keyword);

		List<Board> lists = dao.SelectDataList(pageInfo.getBeginRow(),
				pageInfo.getEndRow());

		req.setAttribute("lists", lists);
		req.setAttribute("pagingHtml", pageInfo.getPagingHtml());
		req.setAttribute("pagingStatus", pageInfo.getPagingStatus());

		forward.setRedirect(false);
		forward.setPath("/View/board/boListFrom.jsp");

		return forward;
	}

}
