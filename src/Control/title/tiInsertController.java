package Control.title;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Title;
import Model.TitleDao;

public class tiInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		TitleDao dao = new TitleDao();
		int cnt = 0;
		
		HttpSession session = req.getSession();
		if(session.getAttribute("title_no") == null || session.getAttribute("title_no").equals("")) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/tiInsertForm.jsp");
		} else {
			Title title = new Title();
			
			title.setTitle_condition(req.getParameter("title_condition"));
			title.setTitle_img(req.getParameter("title_img"));
			title.setTitle_name(req.getParameter("title_name"));
			
			cnt = dao.InsertData(title);
			
			
			if(cnt > 0 ) {
				forward.setRedirect(false);
				forward.setPath("/YamaManCtrl?command=tiList");
			} else {
				forward.setRedirect(true);
				forward.setPath("/View/review/reErrPage.jsp");
			}

		}

		return forward;
		
	}

}
