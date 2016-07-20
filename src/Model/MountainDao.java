package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MountainDao extends SuperDao {

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
			pstmt.setString(2, mountain.getMountain_address1());
			pstmt.setString(3, mountain.getMountain_address2());
			pstmt.setString(4, mountain.getMountain_img());
			pstmt.setString(5, mountain.getMountain_introduce());
			pstmt.setInt(6, mountain.getMountain_thema());
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

		String sql = "insert into mountains(mountain_no, mountain_name, mountain_area, mountain_address, mountain_img, mountain_introduce, mountain_thema, updatedate)"
		        + " values(mountain_no_seq.nextval, ?, ?, ?, ?, ?, ? , to_date(sysdate, 'yyyy/MM/dd HH:mm:ss')   )";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, mountain.getMountain_name());
			pstmt.setString(2, mountain.getMountain_address1());
			pstmt.setString(3, mountain.getMountain_address2());
			pstmt.setString(4, mountain.getMountain_img());
			pstmt.setString(5, mountain.getMountain_introduce());
			pstmt.setInt(6, mountain.getMountain_thema());

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

	public List<Mountain> SelectDataList(int beginRow, int endRow) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *"
		        + " from"
		        + " ("
		        + " select mountain_no, mountain_name, mountain_area, mountain_address, mountain_img, "
		        + "mountain_introduce, mountain_thema, updatedate, rank() over( order by mountain_no desc ) as ranking from mountains  )"
		        + " where ranking between ? and ? ";

		List<Mountain> mountain_lists = new ArrayList<Mountain>();

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
				mountain.setMountain_address1(rs.getString("mountain_address1"));
				mountain.setMountain_address2(rs.getString("mountain_address2"));
				mountain.setMountain_img(rs.getString("mountain_img"));
				mountain.setMountain_introduce(rs.getString("mountain_introduce"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				mountain.setMountain_thema(rs.getInt("mountain_thema"));
				mountain.setUpdatedate(rs.getString("updatedate"));
				mountain_lists.add(mountain);
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
		return mountain_lists;
	}

	public List<Mountain> Selectmountain(int pk) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select mountain_no, mountain_name, mountain_area, mountain_address, mountain_img, mountain_introduce,"
		        + " mountain_thema, updatedate from mountains from mountains where mountain_no=? order by orderno asc";

		List<Mountain> mountain_lists = new ArrayList<Mountain>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, pk);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mountain mountain = new Mountain();
				mountain.setMountain_no(rs.getInt("mountain_no"));
				mountain.setMountain_address1(rs.getString("mountain_address1"));
				mountain.setMountain_address2(rs.getString("mountain_address2"));
				mountain.setMountain_img(rs.getString("mountain_img"));
				mountain.setMountain_introduce(rs.getString("mountain_introduce"));
				mountain.setMountain_name(rs.getString("mountain_name"));
				mountain.setMountain_thema(rs.getInt("mountain_thema"));
				mountain.setUpdatedate(rs.getString("updatedate"));
				mountain_lists.add(mountain);

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
		return mountain_lists;
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
	
}
