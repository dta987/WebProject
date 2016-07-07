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

	// <Ŀ�ǵ�, �ڵ鷯�ν��Ͻ�> ���� ���� ����
	private Map<String, SuperController> ActionMap = new HashMap<String, SuperController>();

	public void init() throws ServletException {
		String configFile = getInitParameter("configFile"); //meLogin=Control.meLoginController
		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			String configFilePath = getServletContext().getRealPath(configFile);
			fis = new FileInputStream(configFilePath);
			prop.load(fis); // �ڹ��� ��Ʈ���� �̿��Ͽ� Properties �÷��ǿ� ��ҵ��� �߰��Ѵ�.
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

			// handlerClassName�� Ŭ���� ������ ��� �ִ� ���ڿ�
			String handlerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);

				// �� ��û ������ ������ Controller���� SuperController�� ���� Ŭ�����̴�.
				SuperController handlerInstance = (SuperController) handlerClass
						.newInstance();
				
				// ��ü�� ���� �ڹ��� �� ������ �߰��Ѵ�.
				ActionMap.put(command, handlerInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		System.out.println("�� ������ : " + ActionMap.size());
	}

	protected void doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		ControllerForward forward = null;
		
		// ���� ���ε带 �̿��ϱ� ���Ͽ� multipart/form-data�� ����ϰ� �Ǹ�
		// request ��ü�� ���� �̿����� ���Ѵ�.
		String command = req.getParameter("command");
		ServletContext context = getServletContext();
		if (command == null) { // ���� ���ε带 ���� ���̽��̴�.
			// String uploadedPath = context.getRealPath("upload") ; //���� ���ε��
			// ������ ���
			String uploadedPath = "c:\\temp\\";
			System.out.println("uploadedPath : " + uploadedPath);

			// �׷���, ���� ���ε带 ���� MultipartRequest ��ü�� �����ִ� �޼ҵ带 ȣ���Ѵ�.
			MultipartRequest multi = MyFileUpload.getMultiPartRequest(req,
					uploadedPath);
			if (multi != null) { // MultipartRequest ��ü�� ��������
				command = multi.getParameter("command");
				req.setAttribute("multi", multi); // request�� ���ε�
				req.setAttribute("uploadedPath", uploadedPath); // request��
																	// ���ε�
			}
		}
		// �ش� Ŀ�ǵ忡 �´� ��Ʈ�ѷ��� ã�Ƽ� �ش� ��Ʈ�ѷ��� doProcess() �޼ҵ带 ȣ���Ѵ�.
		SuperController controller = ActionMap.get(command);
		if (controller != null) {
			forward = controller.doProcess(req, resp);
		}
		
		
		//����� �̵�
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