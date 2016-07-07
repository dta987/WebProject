package Control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utility.MyFileUpload;

import com.oreilly.servlet.MultipartRequest;

@WebServlet(urlPatterns = { "/MiniShopCtrl" }, initParams = { @WebInitParam(name = "configFile", value = "/WEB-INF/commandList.properties") })
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// <커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, SuperController> ActionMap = new HashMap<String, SuperController>();

	public void init() throws ServletException {
		String configFile = getInitParameter("configFile"); //meLogin=Control.meLoginController
		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			String configFilePath = getServletContext().getRealPath(configFile);
			fis = new FileInputStream(configFilePath);
			prop.load(fis); // 자바의 스트림을 이용하여 Properties 컬렉션에 요소들을 추가한다.
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}

		Iterator keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();

			// handlerClassName는 클래스 정보를 담고 있는 문자열
			String handlerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);

				// 각 요청 업무에 따르는 Controller들은 SuperController의 하위 클래스이다.
				SuperController handlerInstance = (SuperController) handlerClass
						.newInstance();
				
				// 객체로 만들어서 자바의 맵 구조에 추가한다.
				ActionMap.put(command, handlerInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		System.out.println("맵 사이즈 : " + ActionMap.size());
	}

	protected void doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = null;
		
		// 파일 업로드를 이용하기 위하여 multipart/form-data을 사용하게 되면
		// request 객체를 직접 이용하지 못한다.
		String command = req.getParameter("command");
		ServletContext context = getServletContext();
		if (command == null) { // 파일 업로드를 위한 케이스이다.
			// String uploadedPath = context.getRealPath("upload") ; //실제 업로드될
			// 웹서버 경로
			String uploadedPath = "c:\\temp\\";
			System.out.println("uploadedPath : " + uploadedPath);

			// 그래서, 파일 업로드를 위한 MultipartRequest 객체를 구해주는 메소드를 호출한다.
			MultipartRequest multi = MyFileUpload.getMultiPartRequest(req,
					uploadedPath);
			if (multi != null) { // MultipartRequest 객체가 구해지면
				command = multi.getParameter("command");
				req.setAttribute("multi", multi); // request에 바인딩
				req.setAttribute("uploadedPath", uploadedPath); // request에
																	// 바인딩
			}
		}
		// 해당 커맨드에 맞는 컨트롤러를 찾아서 해당 컨트롤러의 doProcess() 메소드를 호출한다.
		SuperController controller = ActionMap.get(command);
		if (controller != null) {
			forward = controller.doProcess(req, resp);
		}
		
		
		//결과값 이동
		if (forward.isRedirect()) {
			resp.sendRedirect(req.getContextPath() + forward.getPath());
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(forward
					.getPath());
			dispatcher.forward(req, resp);
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
}