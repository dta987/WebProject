package Control.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meListController implements SuperController{

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MemberDao dao = new MemberDao();
		
		List<Member> member_lists = dao.MemberList();
		
		if (member_lists.size() > 0 ) {
			req.setAttribute("member_lists", member_lists);
			forward.setRedirect(true);
			//forward.setPath(req.getContextPath() + "/View/rvMain.jsp");
		} else {
			forward.setRedirect(false);
			//forward.setPath(req.getContextPath() + "/View/meLoginForm.jsp");
			
		}

		return forward;
		
	}
	
	

}
