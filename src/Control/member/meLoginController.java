package Control.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meLoginController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		
		String url=req.getParameter("url");

		String id = req.getParameter("id");
		String password = req.getParameter("password");

		Member bean = dao.SelectDate(id, password);

		if (bean != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginfo", bean);

			String massage = bean.getUser_nickname() + "님 어서오세요!";
			req.setAttribute("massage", massage);

			forward.setRedirect(false);
			forward.setPath("/View/Main.jsp");
		} else {
			String massage = "아이디와 비밀번호를 확인해주세요";
			req.setAttribute("errmsg", massage);

			forward.setRedirect(false);
			forward.setPath("/View/member/meLoginForm.jsp");

		}

		return forward;
	}

}
