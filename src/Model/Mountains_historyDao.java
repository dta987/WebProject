package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class Mountains_historyDao extends SuperDao {

	public Mountains_historyDao() {
	}

	// 히스토리 1 건 삭제
	public int DeleteDate(int history_no) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from mountains_history where history_no=?" ;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, history_no);

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

	// 히스토리 1건 수정
	public int UpdateData(Mountains_history mountains_history) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update mountains_history set user_id, mountain_no, hiking_date, hiking_memo where history_no=? ";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, mountains_history.getUser_id());
			pstmt.setInt(2, mountains_history.getMountain_no());
			pstmt.setString(3, mountains_history.getHiking_date());
			pstmt.setString(4, mountains_history.getHiking_memo());
			pstmt.setInt(5, mountains_history.getHistory_no());

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

	// 히스토리 1건 추가
	public int InsertData(Mountains_history mountains_history) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = " insert into mountains_history(user_id, mountain_no, hiking_date, hiking_memo, history_no)"
				+ " values(?, ?, ?, ?, history_no_seq.nextval)";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, mountains_history.getUser_id());
			pstmt.setInt(2, mountains_history.getMountain_no());
			pstmt.setString(3, mountains_history.getHiking_date());
			pstmt.setString(4, mountains_history.getHiking_memo());

			cnt = pstmt.executeUpdate();

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

	public Mountains_history SelectDateByPK(int history_no) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select history_no, user_id, mountain_no, hiking_date, hiking_memo from mountains_history where history_no=?";
		Mountains_history mountains_history = null;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, history_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				mountains_history = new Mountains_history();
				mountains_history.setUser_id(rs.getString("user_id"));
				mountains_history.setHiking_date(rs.getString("hiking_date"));
				mountains_history.setHiking_memo(rs.getString("hiking_memo"));
				mountains_history.setHistory_no(rs.getInt("history_no"));
				mountains_history.setMountain_no(rs.getInt("mountain_no"));
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
		return mountains_history;
	}

	public List<Mountains_history> SelectDataList(int beginRow, int endRow, String mode,
			String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select history_no, user_id, mountain_no, hiking_date, hiking_memo , ranking";
		sql += " from";
		sql += " (";
		sql += " select history_no, user_id, mountain_no, hiking_date, hiking_memo, rank() over( order by history_no desc ) as ranking";
		sql += " from mountains_history ";
		if(!mode.equals("all")) {
			sql += "where " + mode + " like '%" + keyword + "%'";
		}
		sql += " )";
		sql += " where ranking between ? and ? ";
		List<Mountains_history> mountains_history_list = new ArrayList<Mountains_history>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Mountains_history mountains_history = new Mountains_history();
				mountains_history.setUser_id(rs.getString("user_id"));
				mountains_history.setHiking_date(rs.getString("hiking_date"));
				mountains_history.setHiking_memo(rs.getString("hiking_memo"));
				mountains_history.setHistory_no(rs.getInt("history_no"));
				mountains_history.setMountain_no(rs.getInt("mountain_no"));
				mountains_history_list.add(mountains_history);
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
		return mountains_history_list;
	}

	public int selectCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from mountains_history";

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
