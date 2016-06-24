package Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String RequestURL = req.getRequestURI();
		String contextPath = req.getContextPath();
		String commend = RequestURL.substring(contextPath.length());

		System.out.println("RequestURL : " + RequestURL);
		System.out.println("contextPath : " + contextPath);
		System.out.println("commend : " + commend);
		
		if(commend == "/loing.servlet") {
			
		}
		
	}
}
