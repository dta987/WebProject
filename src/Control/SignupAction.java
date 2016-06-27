package Control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Member;
import Model.MemberDao;

public class SignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req,
			HttpServletResponse resp) throws IOException {

		ActionForward forward = new ActionForward();
		MemberDao dao = new MemberDao();

		Member member = new Member();

		member.setUser_id(req.getParameter("id"));
		member.setUser_password(req.getParameter("password"));
		member.setUser_name(req.getParameter("name"));
		member.setUser_nickname(req.getParameter("nickname"));
		member.setUser_email(req.getParameter("email"));
		member.setUser_img(req.getParameter("user_img"));

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String strdate = format.format(date);

		member.setSign_date(strdate);
		member.setUser_title("");

		System.out.println(member.toString());

		int cnt = dao.Signup(member);

		if (cnt < 0) {
			System.out.println("errCode : " + cnt);
			return null;
		} else {
			forward.setRedirect(true);
			forward.setPath("/WebProject/Login.jsp");
			return forward;
		}

	}

}
