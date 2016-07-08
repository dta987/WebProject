package Control.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import jdk.nashorn.internal.ir.debug.JSONWriter;
import Control.ControllerForward;
import Control.SuperController;
import Model.MemberDao;

public class meIDcheckController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		JSONObject jsonobj = new JSONObject();
		PrintWriter out = resp.getWriter();
		MemberDao dao = new MemberDao();
		int no = 0;
		int check = 0;
		// 0이면 사용가능 1이면 이미사용중인 아이디
		forward.setRedirect(false);
		forward.setPath("");

		System.out.println(req.getParameter("id"));
		if (req.getParameter("id") != null) {
			no = 1;
			check = dao.OverlapCheck(req.getParameter("id"), no);
			jsonobj.put("check", check);
			out.print(jsonobj);
			out.flush();
			out.close();
		} else {
			no = 2;
			check = dao.OverlapCheck(req.getParameter("nickname"), no);
			jsonobj.put("check", check);
			out.print(jsonobj);
			out.flush();
			out.close();
		}

		return forward;
	}

}
