package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MountainDao extends SuperDao {

	private Object String;

	public MountainDao() {
	}

	// 게시물 삭제
	public int DeleteMountain(int mountain_no) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from moutains where mountain_no=?";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, mountain_no);
			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode(); // 오라클 오류 상수가 리턴
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	// 게시물 수정
	public int UpdateMountain(Mountain mountain) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update mountains set(mountain_name=?, mountain_area=?, mountain_address=?, mountain_img=?, mountain_introduce=?, "
				+ "mountain_thema=?, updatedate =to_date(sysdate, 'yyyy/MM/dd HH:mm:ss') where mountain_no=?";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);

			pstmt.setString(1, mountain.getMountain_name());
			pstmt.setString(2, mountain.getMountain_area());
			pstmt.setString(3, mountain.getMountain_address());
			pstmt.setString(4, mountain.getMountain_img());
			pstmt.setString(5, mountain.getMountain_introduce());
			pstmt.setString(6, mountain.getMountain_thema());
			pstmt.setInt(7, mountain.getMountain_no());

			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode(); // 오라클 오류 상수가 리턴
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;

	}

	// 게시글 작성
	public int InsertMountain(Mountain mountain) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = "insert into mountains(mountain_no, mountain_name, mountain_area, mountain_address, mountain_img, mountain_introduce, mountain_thema, mountain_thema2)"
				+ " values(mountain_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, mountain.getMountain_name());
			pstmt.setString(2, mountain.getMountain_area());
			pstmt.setString(3, mountain.getMountain_address());
			pstmt.setString(4, mountain.getMountain_img());
			pstmt.setString(5, mountain.getMountain_introduce());
			pstmt.setString(6, mountain.getMountain_thema());
			pstmt.setString(7, mountain.getMountain_thema2());

			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -(err.getErrorCode()); // 오라클 오류 상수가 리턴
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;

	}

	
	public List<Mountain> SelectDataList(String selecter) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select mountain_no, mountain_name, mountain_area, mountain_thema, mountain_thema2, mountain_img from mountains";

		List<Mountain> mountain_list = new ArrayList<Mountain>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mountain mountain = new Mountain();
				mountain.setMountain_no(rs.getInt("mountain_no"));
				mountain.setMountain_area(rs.getString("mountain_area"));			
				mountain.setMountain_thema(rs.getString("mountain_thema"));
				mountain.setMountain_thema2(rs.getString("mountain_thema2"));
				mountain.setMountain_img(rs.getString("mountain_img"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				mountain_list.add(mountain);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return mountain_list;
	}

	public Mountain SelectMountain(int pk) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from mountains where mountain_no=?";

		Mountain mountain = new Mountain();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, pk);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				mountain.setMountain_no(rs.getInt("mountain_no"));
				mountain.setMountain_area(rs.getString("mountain_area"));
				mountain.setMountain_address(rs.getString("mountain_address"));
				String Mountain_img = rs.getString("mountain_img");
				if (Mountain_img == null || Mountain_img == "") {
					mountain.setMountain_img("산타니05.jpg");
				} else {
					mountain.setMountain_img(Mountain_img);
				}
				mountain.setMountain_introduce(rs
						.getString("mountain_introduce"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				mountain.setMountain_thema(rs.getString("mountain_thema"));
				mountain.setUpdate_date(rs.getString("update_date"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return mountain;
	}
	

	public int selectCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from mountains";

		int cnt = 0;

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public List<Mountain> adminSelectDataList(int beginRow, int endRow,
			String mode, String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select mountain_no, mountain_name, mountain_area, mountain_thema, mountain_thema2, update_date, ranking";
		sql += " from";
		sql += " (";
		sql += " select mountain_no, mountain_name, mountain_area, mountain_thema, mountain_thema2, update_date, rank() over( order by mountain_no desc ) as ranking";
		sql += " from mountains ";
		if (!mode.equals("all")) {
			sql += "where " + mode + " like '%" + keyword + "%'";
		}
		sql += " )";
		sql += " where ranking between ? and ? ";
		List<Mountain> lists = new ArrayList<Mountain>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mountain mountain = new Mountain();
				mountain.setMountain_no(rs.getInt("mountain_no"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				mountain.setMountain_area(rs.getString("mountain_area"));
				mountain.setMountain_thema(rs.getString("mountain_thema"));
				mountain.setMountain_thema2(rs.getString("mountain_thema2"));
				mountain.setUpdate_date(rs.getString("update_date"));
				lists.add(mountain);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists;
	}
	
	// 지역(혼슈, 홋카이도, 알프스지역, 큐슈)에 따른 산들의 목록(산 관리번호랑 산 이름만 필요함)을 뽑아오기 위한 select문
	public List<Mountain> AreaSelectDataList(String mountain_area) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Mountain> lists = new ArrayList<Mountain>();
		String sql = " select mountain_no, mountain_name from mountains where mountain_area = ?";
		
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, mountain_area);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mountain mountain = new Mountain();
				mountain.setMountain_no(rs.getInt("mountain_no"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				lists.add(mountain);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists;
	}

}
