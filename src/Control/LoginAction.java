package Control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Member;
import Model.MemberDao;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req,
			HttpServletResponse resp) throws IOException {

		ActionForward forward = new ActionForward();
		MemberDao dao = new MemberDao();

		

		String id = req.getParameter("id");
		String password = req.getParameter("password");

		System.out.println("id : " + id);
		System.out.println("password : " + password);

		Member member = dao.Login(id, password);

		member.toString();
		
		if(member != null) {
			forward.setRedirect(true);
			forward.setPath("/WebProject/Main.jsp");
		} else {
			System.out.println("�Ƶ��̿� ��й�ȣ�� Ȯ�����ּ���");
		}

		
		return forward;

	}

}
