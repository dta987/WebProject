import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TEST {

	public static void main(String[] args) {

		HashMap<String, String> maps = new HashMap<String, String>();
		List<String> list = new ArrayList<String>();
		HashMap<String, String> titles = new HashMap<String, String>();

		maps.put("���� ������", "������, ��л�, ���߻�, �Ӹ���");
		maps.put("��� ������", "������, ���ǻ�, ���ѻ�, ������");
		maps.put("�ܿ�� ������", "���߻�, ��л�, ȯ�Ż�, �ֿջ�");

		list.add("������");
		list.add("������");
		list.add("������");
		list.add("��л�");
		list.add("���߻�");
		list.add("�Ӹ���");
		list.add("���ǻ�");
		list.add("���ѻ�");

		for (String key : maps.keySet()) {
			System.out.println("ó������ Ű�� : " + key);
			String value = maps.get(key);
			String[] str = value.split(",");
			int size = str.length;
			int cnt = 0;
			for (int i = 0; i < list.size(); i++) {
				if (value.indexOf(list.get(i)) > -1) {
					cnt++;
					System.out.println("Ȯ���� : " + list.get(i));
					if (cnt == size) {
						titles.put(key, value);
						break;

					}
				}

			}
		}

		System.out.println("=======================================");
		if (titles.size() == 0) {
			System.out.println("ȹ���� Ÿ��Ʋ�� �����ϴ�.");
		} else {
			for (String title : titles.keySet()) {
				System.out.println("ȹ���� Ÿ��Ʋ : " + title);
				System.out.println("���� : " + titles.get(title));
			}
		}

	}

}
