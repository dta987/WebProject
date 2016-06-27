package Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	private void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String RequestURL = req.getRequestURI();
		String contextPath = req.getContextPath();
		String commend = RequestURL.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;

		System.out.println("RequestURL : " + RequestURL);
		System.out.println("contextPath : " + contextPath);
		System.out.println("commend : " + commend);

		if (commend.equals("/Loing.servlet")) {
			// forward = new ActionForward();
			// forward.setRedirect(false);
			action = new LoginAction();

			forward = action.execute(req, resp);

		} else if (commend.equals("/Signup.servlet")) {
			action = new SignupAction();

			forward = action.execute(req, resp);
		}

		if (forward.isRedirect()) {
			resp.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(forward
					.getPath());
			dispatcher.forward(req, resp);
		}
	}
}
