package Control.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;
import Utility.Paging;

public class meListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();

		String _pageNumber = req.getParameter("pageNumber");
		String _pageSize = req.getParameter("pageSize");
		String mode = req.getParameter("mode");
		String keyword = req.getParameter("keyword");
		int totalCount = dao.selectCount();
		System.out.println("totalCount : " + totalCount);

		String myurl = req.getContextPath() + "/YamaManCtrl?command=meList";

		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, myurl, mode, keyword);

		List<Member> lists = dao.SelectDataList(pageInfo.getBeginRow(), pageInfo.getEndRow());
		
		req.setAttribute("lists", lists);
		req.setAttribute("pagingHtml", pageInfo.getPagingHtml());
		req.setAttribute("pagingStatus", pageInfo.getPagingStatus());

		forward.setRedirect(false);
		forward.setPath("/View/member/meList.jsp");

		return forward;

	}

}
