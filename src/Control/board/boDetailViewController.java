package Control.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Member;
import Utility.FlowParameters;
import Utility.FlowreplyParameters;
import Utility.replyPaging;

public class boDetailViewController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		BoardDao dao = new BoardDao();
		Board board = null;
		List<Board> reply_lists = null;
		
		String pageNumber = req.getParameter("pageNumber");
		String pageSize = req.getParameter("pageSize");
		int no = Integer.parseInt(req.getParameter("no"));
						
		FlowreplyParameters replyparameters = new FlowreplyParameters();
		replyparameters.setPageNumber(pageNumber);
		replyparameters.setPageSize(pageSize);
		replyparameters.setGroup_no(no);
		
		int totalCount = dao.selectReplyCount(no);
		
		String myurl = req.getContextPath() + "/YamaManCtrl?command=boDetailView";

		replyPaging replypageInfo = new replyPaging(pageNumber, pageSize, totalCount, myurl, no);

		Member loginfo = null;
		loginfo = (Member) req.getSession().getAttribute("loginfo");

		if (loginfo == null) {
			dao.updatereadhit(no);
		} else {
			if(loginfo.getUser_id() != req.getParameter("id")) {
				dao.updatereadhit(no);
			}	
		}

		board = dao.SelectBoard(no);
		reply_lists = dao.SelectBoardReply(no, replypageInfo.getBeginRow(), replypageInfo.getEndRow());

		req.setAttribute("bean", board);
		req.setAttribute("lists", reply_lists);
		
		req.setAttribute("pagingHtml", replypageInfo.getPagingHtml());
		req.setAttribute("pagingStatus", replypageInfo.getPagingStatus());
		
		req.setAttribute("replyparameters", replyparameters.toString());

		forward.setRedirect(false);
		forward.setPath("/View/board/boDetailView.jsp");

		return forward;

	}

}
