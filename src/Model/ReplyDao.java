package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao extends SuperDao {

	public ReplyDao() {
	}

	public int InsertData(Reply bean) {
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
			cnt = err.getErrorCode(); // ����Ŭ ���� ����� ����
			// �� : not null �̸� 1400
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

	public int UpdateData(Reply bean) {
		// ������ ����
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
			cnt = err.getErrorCode(); // ����Ŭ ���� ����� ����
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
		// ������ ����
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
			cnt = err.getErrorCode(); // ����Ŭ ���� ����� ����
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

	public List<Reply> SelectDateList() {
		// ��� ������ ��ȸ
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Reply> rReplys_list = new ArrayList<Reply>();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply bean = new Reply();

				rReplys_list.add(bean);
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
		return rReplys_list;
	}

}