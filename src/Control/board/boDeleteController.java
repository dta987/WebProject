package Control.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDao;
import Utility.FlowParameters;
import Control.ControllerForward;
import Control.SuperController;

public class boDeleteController implements SuperController {

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
		parameters.setKeyword(req.getParameter("keyword"));
		parameters.setMode(req.getParameter("mode"));
		parameters.setPageNumber(req.getParameter("pageNumber"));
		parameters.setPageSize(req.getParameter("pageSize"));

		int cnt = dao.DeleteBoard(Integer.parseInt(req.getParameter("no")));

		if (cnt > 0) {
			forward.setRedirect(true);
			forward.setPath("/YamaManCtrl?command=boList&" + parameters.toString());
		} else {
			forward.setRedirect(false);
			System.out.println("틀려???");
			String result = "회원 탈퇴 중 오류코드 : " + cnt + "이(가) 발생하였습니다";
			forward.setPath(req.getContextPath() + "/View/reErrPage.jsp");
			// forward.setPath(req.getContextPath() +
			// "/View/member/meLoginForm.jsp");

		}

		return forward;

	}

}
