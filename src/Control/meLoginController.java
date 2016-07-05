package Control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Member;
import Model.MemberDao;

public class meLoginController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();

		String id = req.getParameter("id");
		String password = req.getParameter("password");

		System.out.println("id : " + id);
		System.out.println("password : " + password);

		Member member = dao.Login(id, password);

		if (member.equals("")) {
			System.out.println("로그인이 됨");
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/rvMain.jsp");
		} else {
			PrintWriter out = resp.getWriter();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/meLoginForm.jsp");
			
			System.out.println("아이디와 비밀번호를 확인해주세요");
			
			out.print("<html>");
			out.print("<head>");
			out.print("<body>");
			out.print("<script> alert(\"아이디와 비밀번호를 확인해주세요\") <script>");
			out.print("</body>");
			out.print("</head>");
			out.print("</html>");
		}

		return forward;
	}

}
