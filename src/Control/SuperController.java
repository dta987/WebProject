package Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Controller(��Ʈ�ѷ�) �������̽� : ��� ��Ʈ�ѷ����� �θ� �������̽�
//��û�� ������ �Ǹ� Ư���� ��Ʈ�ѷ�(����)�� �������ֱ� ���� �������̽� 
public interface SuperController {
	//��� ����Ͻ� ������ �����ϱ� ���� �߻� �޼ҵ带 �����Ѵ�.
	public ControllerForward doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException;
	
}