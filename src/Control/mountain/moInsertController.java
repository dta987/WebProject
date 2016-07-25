package Control.mountain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountain;
import Model.MountainDao;

public class moInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		
		MountainDao dao = new MountainDao();
		int cnt = 0;
		
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null || session.getAttribute("id").equals("") || session.getAttribute("id").equals("null") ) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/View/meLoginForm.jsp");
		} else {
			Mountain mountain = new Mountain();
			
			mountain.setMountain_area(req.getParameter("mountain_area"));
			mountain.setMountain_address(req.getParameter("mountain_address"));
			mountain.setMountain_img(req.getParameter("mountain_img"));
			mountain.setMountain_introduce(req.getParameter("mountain_introduce"));
			mountain.setMountain_name(req.getParameter("mountain_name"));
			mountain.setMountain_thema(Integer.parseInt(req.getParameter("mountain_thema")));
			mountain.setUpdatedate(req.getParameter("updatedate"));
			
			cnt = dao.InsertMountain(mountain);
			
			if(cnt > 0 ) {
				forward.setRedirect(false);
				forward.setPath("/YamaManCtrl?command=moList");
			} else {
				forward.setRedirect(true);
				forward.setPath("/View/review/reErrPage.jsp");
			}

		}

		return forward;
		
	}

}
