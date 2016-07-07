package Control.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meDeleteController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");

		int cnt = dao.DeleteMember(id, password);
		
		if(cnt > 0 ) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/meLoginForm.jsp");
		} else {
			forward.setRedirect(false);
			String result = "회원 탈퇴 중 오류코드 : " + cnt + "이(가) 발생하였습니다";
			req.setAttribute("errmsg", result);
			forward.setPath(req.getContextPath() + "/View/reErrPage.jsp");
		}

		return forward;

	}

}
