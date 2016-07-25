package Control.mountain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import Control.ControllerForward;
import Control.SuperController;
import Model.Mountain;
import Model.MountainDao;

public class moInsertController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		MultipartRequest multi = (MultipartRequest)req.getAttribute("multi");
		
		ControllerForward forward = new ControllerForward();
		MountainDao dao = new MountainDao();
		Mountain mountain = new Mountain();
		
		mountain.setMountain_area(multi.getParameter("area"));
		mountain.setMountain_thema(multi.getParameter("thema"));
		mountain.setMountain_name(multi.getParameter("name"));
		mountain.setMountain_address(multi.getParameter("address"));
		mountain.setMountain_img(multi.getFilesystemName("image"));
		mountain.setMountain_introduce(multi.getParameter("content"));

		int cnt = dao.InsertMountain(mountain);

		if (cnt > 0) {
			forward.setRedirect(false);
			forward.setPath("/YamaManCtrl?command=moInsertForm");
			//forward.setPath("/YamaManCtrl?command=moList");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		}

		return forward;

	}

}
