package Control.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meSignupController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		MultipartRequest multi = (MultipartRequest)req.getAttribute("multi");

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		Member member = new Member();
		
		member.setUser_id(multi.getParameter("id"));
		member.setUser_password(multi.getParameter("password"));
		member.setUser_name(multi.getParameter("name"));
		member.setUser_nickname(multi.getParameter("nickname"));
		member.setUser_email(multi.getParameter("email"));
		member.setUser_img(multi.getFilesystemName("image"));

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
