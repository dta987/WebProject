package Control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meDetailViewController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		Member bean = new Member();

		String id = req.getParameter("id");

		bean = dao.SelectDateByPK(id);

		System.out.println(bean.toString());

		req.setAttribute("bean", bean);
		forward.setRedirect(false);
		forward.setPath("/View/member/meDetailView.jsp");

		return forward;
	}

}
