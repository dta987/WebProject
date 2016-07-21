package Control.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sun.swing.internal.plaf.basic.resources.basic;

import jdk.nashorn.internal.ir.debug.JSONWriter;
import Control.ControllerForward;
import Control.SuperController;
import Model.MemberDao;

public class meOverlapcheckController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		JSONObject jsonobj = new JSONObject();
		PrintWriter out = resp.getWriter();
		MemberDao dao = new MemberDao();
		int no = 0;
		boolean check = false;
		// 0이면 사용가능 1이면 이미사용중인 아이디
		forward.setRedirect(false);
		forward.setPath("");

		String id = req.getParameter("id");
		if ( id != null) {
			//boolean patterncheck = Pattern.matches("", req.getParameter("id"));
			
			System.out.println("id : " + id);
			no = 1;
			check = dao.OverlapCheck(id, no);
			jsonobj.put("check", check);
			out.print(jsonobj);
			out.flush();
			out.close();
		} else {
			System.out.println("nickname : " + req.getParameter("nickname"));
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
