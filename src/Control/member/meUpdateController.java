package Control.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import Control.ControllerForward;
import Control.SuperController;
import Model.Member;
import Model.MemberDao;

public class meUpdateController implements SuperController {

	@Override
	public ControllerForward doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(this.getClass());
		ControllerForward forward = new ControllerForward() ;
		
		
		
		
		Member bean = new Member();
	
		MultipartRequest multi = (MultipartRequest) req.getAttribute("multi") ;
		
		bean.setUser_password(multi.getParameter("password"));
		bean.setUser_email(multi.getParameter("email"));
		bean.setUser_nickname(multi.getParameter("nickname"));
		bean.setUser_id(multi.getParameter("id"));
		bean.setUser_name(multi.getParameter("name"));
		bean.setUser_img(multi.getFilesystemName("image"));
		MemberDao dao = new MemberDao();
		
		int cnt = - 99999 ;
		cnt = dao.UpdateData(bean);
		
		req.setAttribute("bean", bean);
		forward.setRedirect(false);
		forward.setPath("/YamaManCtrl?command=meList&");
		//forward.setPath("/View/member/meDetailView.jsp");
		
		return forward;
	}

}
