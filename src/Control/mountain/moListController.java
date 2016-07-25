package Control.mountain;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Board;
import Model.Mountain;
import Model.MountainDao;
import Utility.FlowParameters;
import Utility.Paging;

public class moListController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		MountainDao dao = new MountainDao();
		
		List<Mountain> mountain_list = new ArrayList<Mountain>();
		
		String selecter = req.getParameter("selecter");
		
		mountain_list = dao.SelectDataList(selecter);


		req.setAttribute("selecter", selecter);
		req.setAttribute("lists", mountain_list);


		forward.setRedirect(false);
		forward.setPath("/View/mountain/moList.jsp");

		return forward;

	}

}
