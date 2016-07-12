package Control.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meSignupController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		Member member = new Member();

		member.setUser_id(req.getParameter("id"));
		member.setUser_password(req.getParameter("password"));
		member.setUser_name(req.getParameter("name"));
		member.setUser_nickname(req.getParameter("nickname"));
		member.setUser_email(req.getParameter("email"));
		member.setUser_img(req.getParameter("user_img"));

		int cnt = dao.InsertData(member);

		if (cnt < 0) {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/member/meLoginForm.jsp");

		}

		return forward;

	}

}
