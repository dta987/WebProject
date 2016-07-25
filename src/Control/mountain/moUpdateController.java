package Control.mountain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.BoardDao;
import Model.Mountain;
import Model.MountainDao;

public class moUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		Mountain mountain = new Mountain();
		MountainDao dao = new MountainDao();
		
		HttpSession Session = req.getSession(); 
		
		mountain.setMountain_no(Integer.parseInt(req.getParameter("mountain_no")));
		mountain.setMountain_area(req.getParameter("mountain_area"));
		mountain.setMountain_address(req.getParameter("mountain_address"));
		mountain.setMountain_img(req.getParameter("mountain_img"));
		mountain.setMountain_introduce(req.getParameter("mountain_introduce"));
		mountain.setMountain_name(req.getParameter("mountain_name"));
		mountain.setUpdatedate(req.getParameter("updatedate"));
		
		int cnt = dao.UpdateMountain(mountain);
		

		if (cnt > 0) {
			
			forward.setRedirect(false);
			req.setAttribute("board_no", req.getParameter("board_no"));
			req.setAttribute("board_title", req.getParameter("board_title"));
			forward.setPath(req.getContextPath() + "/YamaManCtrl?command=moDetailView");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
	}

}
