import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TEST {

	public static void main(String[] args) {

		HashMap<String, String> maps = new HashMap<String, String>();
		List<String> list = new ArrayList<String>();
		HashMap<String, String> titles = new HashMap<String, String>();

		maps.put("봄산 마스터", "덕유산, 대둔산, 가야산, 속리산");
		maps.put("명산 마스터", "지리산, 설악산, 북한산, 덕유산");
		maps.put("겨울산 마스터", "가야산, 대둔산, 환매산, 주왕산");

		list.add("도봉산");
		list.add("지리산");
		list.add("덕유산");
		list.add("대둔산");
		list.add("가야산");
		list.add("속리산");
		list.add("설악산");
		list.add("북한산");

		for (String key : maps.keySet()) {
			System.out.println("처리중인 키값 : " + key);
			String value = maps.get(key);
			String[] str = value.split(",");
			int size = str.length;
			int cnt = 0;
			for (int i = 0; i < list.size(); i++) {
				if (value.indexOf(list.get(i)) > -1) {
					cnt++;
					System.out.println("확인중 : " + list.get(i));
					if (cnt == size) {
						titles.put(key, value);
						break;

					}
				}

			}
		}

		System.out.println("=======================================");
		if (titles.size() == 0) {
			System.out.println("획득한 타이틀이 없습니다.");
		} else {
			for (String title : titles.keySet()) {
				System.out.println("획득한 타이틀 : " + title);
				System.out.println("조건 : " + titles.get(title));
			}
		}

	}

}
