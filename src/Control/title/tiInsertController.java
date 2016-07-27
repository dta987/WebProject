package Control.title;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

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
		MultipartRequest multi = (MultipartRequest) req.getAttribute("multi");

		Title bean = new Title();
		bean.setTitle_img(multi.getFilesystemName("image")); // Ÿ��Ʋ �̹���
		bean.setTitle_name(multi.getParameter("name")); // Ÿ��Ʋ �̸�
		String str = "";

		String mainthema = multi.getParameter("mainthema");
		if (mainthema.equals("����")) {
			for (int i = 1; i <= 5; i++) {
				if (!multi.getParameter("area" + i).equals("-")) {
					str += multi.getParameter("area" + i);
					str += ", ";
				}
			}

		} else if (mainthema.equals("����")) {
			String season = multi.getParameter("season");

			if (season.equals("��")) {

				for (int i = 1; i >= 4; i++) {
					if (!multi.getParameter("haruseason" + i).equals("-")) {
						str += multi.getParameter("haruseason" + i + ", ");
					}
				}

			}

		} else if (mainthema.equals("��")) {

			for (int i = 1; i >= 4; i++) {
				if (!multi.getParameter("flower" + i).equals("-")) {
					str += multi.getParameter("flower" + i + ", ");
				}
			}
		}
		
		
		bean.setTitle_condition(str);
		System.out.println("str : " + str);
		int cnt = dao.InsertData(bean);

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
