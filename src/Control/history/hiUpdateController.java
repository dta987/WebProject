package Control.history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountain;
import Model.MountainDao;
import Model.Title;
import Model.TitleDao;

public class hiUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		TitleDao dao = new TitleDao();

		Title title = new Title();
		title.setTitle_no(Integer.parseInt(req.getParameter("title_no")));
		title.setTitle_condition(req.getParameter("title_condition"));
		title.setTitle_img(req.getParameter("title_img"));
		title.setTitle_name(req.getParameter("title_name"));
		
		int cnt = dao.UpdateData(title);

		if (cnt > 0) {
			
			forward.setRedirect(false);
			req.setAttribute("title_no", req.getParameter("title_no"));
			forward.setPath(req.getContextPath() + "/YamaManCtrl?command=moDetailView");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
	}

}
