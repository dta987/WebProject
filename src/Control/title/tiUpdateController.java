package Control.title;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Control.ControllerForward;
import Control.SuperController;
import Model.Title;
import Model.TitleDao;

public class tiUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		TitleDao dao = new TitleDao();
		Title bean = new Title();
		MultipartRequest multi = (MultipartRequest) req.getAttribute("multi") ;
		
		
		bean.setTitle_no(Integer.parseInt(multi.getParameter("no")));
		bean.setTitle_condition(multi.getParameter("condition"));
		bean.setTitle_img(multi.getFilesystemName("image"));
		bean.setTitle_name(multi.getParameter("name"));
		
		int cnt = dao.UpdateData(bean);

		if (cnt > 0) {
			forward.setRedirect(false);
			forward.setPath("/YamaManCtrl?command=tiList");
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/rvErrPage.jsp");

		}

		return forward;
	}

}
