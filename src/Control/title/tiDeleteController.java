package Control.title;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;
import Model.TitleDao;
import Utility.FlowParameters;

public class tiDeleteController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = new ControllerForward();
		TitleDao dao = new TitleDao();
		
		int no = Integer.parseInt(req.getParameter("no"));
		//String password = req.getParameter("password");
		
		System.out.println(dao.SelectDataByPk(no).toString());
		FlowParameters parameters = new FlowParameters() ;
		parameters.setKeyword( req.getParameter("keyword") ); 
		parameters.setMode( req.getParameter("mode") ); 
		parameters.setPageNumber( req.getParameter("pageNumber") );
		parameters.setPageSize( req.getParameter("pageSize") );
		
		
		
		int cnt = dao.DeleteDate(Integer.parseInt(req.getParameter("no")));
		
		
		
		if(cnt > 0 ) {
			forward.setRedirect(true);
			forward.setPath("/YamaManCtrl?command=tiList&" + parameters.toString() ) ;
		} else {
			forward.setRedirect(true);
			forward.setPath("/View/review/reErrPage.jsp");
		}

		return forward;

	}

}

