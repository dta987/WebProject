package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends SuperDao {

	public BoardDao() {
	}

	public int InsertData(Board bean) {
		System.out.println(bean.toString());
		String sql = ""; //insert sql
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = err.getErrorCode(); // 오라클 오류 상수가 리턴
			// 예 : not null 이면 1400
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
			} catch (Exception e3) {
				e3.printStackTrace();
			}

		}
		return cnt;
	}

	public int UpdateData(Board bean) {
		// 데이터 수정
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = ""; // update sql
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = err.getErrorCode(); // 오라클 오류 상수가 리턴
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				try {
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (Exception e3) {
					e3.printStackTrace();
				}

			}
		}
		return cnt;
	}

	public int DeleteData(String pmkey) {
		// 데이터 수정
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = ""; // delete sql
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = err.getErrorCode(); // 오라클 오류 상수가 리턴
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				try {
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (Exception e3) {
					e3.printStackTrace();
				}

			}
		}
		return cnt;
	}

	public List<Board> SelectDateList() {
		// 모든 데이터 조회
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Board> boards_list = new ArrayList<Board>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board bean = new Board();

				boards_list.add(bean);
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
		return boards_list;
	}

}