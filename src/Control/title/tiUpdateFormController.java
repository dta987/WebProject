package Control.title;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Control.ControllerForward;
import Control.SuperController;
import Model.Title;
import Model.TitleDao;
import Utility.FlowParameters;

public class tiUpdateFormController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ControllerForward forward = new ControllerForward();
		TitleDao dao = new TitleDao();
		Title bean = new Title();
		
		// �ڷΰ��� �� ������������ �̵�
				String mode = req.getParameter("mode");
				if (mode == null || mode.equals("null") || mode.equals("")) {
					mode = "all";
				}

				// keyword�� �޼ҵ� ȣ�� ������ %�� ���̵��� ����
				String keyword = req.getParameter("keyword");
				if (keyword == null || keyword.equals("null")) {
					keyword = "";
				}

				String pageNumber = req.getParameter("pageNumber");
				String pageSize = req.getParameter("pageSize");
				
				FlowParameters parameters = new FlowParameters();
				parameters.setKeyword(keyword);
				parameters.setMode(mode);
				parameters.setPageNumber(pageNumber);
				parameters.setPageSize(pageSize);
				
				String no = req.getParameter("no");
				bean = dao.SelectDataByPk(Integer.parseInt(no));
				
				System.out.println(bean.toString());
				
				req.setAttribute("bean", bean);
				forward.setRedirect(false);
				forward.setPath("/View/title/tiUpdateForm.jsp");

				return forward;
	}

}
