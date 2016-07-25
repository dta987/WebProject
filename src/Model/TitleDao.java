package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class TitleDao extends SuperDao {

	public TitleDao() {
	}

	// 타이틀 삭제
	public int DeleteDate(int title_no) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = " delete from titles where title_no=? " ;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, title_no);

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

	// 회원정보 수정
	public int UpdateData(Title title) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update titles set title_condition = ?, title_img = ?, title_name = ? where title_no=? ";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, title.getTitle_condition());
			pstmt.setString(2, title.getTitle_img());
			pstmt.setString(3, title.getTitle_name());
			pstmt.setInt(4, title.getTitle_no());

			cnt = pstmt.executeUpdate();

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

	// 회원가입
	public int InsertData(Title title) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = " insert into titles( title_no, title_name, title_condition, title_img)"
				+ " values(title_no_seq.nextval, ?, ?, ?)";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, title.getTitle_name());
			pstmt.setString(2, title.getTitle_condition());
			pstmt.setString(3, title.getTitle_img());

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

	//
	public Title SelectDataByPk(int title_no) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from titles where title_no =? ";
		Title title = null;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, title_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				title =new Title(); 
				title.setTitle_condition(rs.getString("title_condition"));
				title.setTitle_img(rs.getString("title_img"));
				title.setTitle_name(rs.getString("title_name"));
				title.setTitle_no(rs.getInt("title_no"));
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
		return title;
	}

	public List<Title> SelectDataList(int beginRow, int endRow, String mode, String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *";
		sql += " from";
		sql += " (";
		sql += " select title_no, title_name, title_condition, title_img, rank() over( order by title_no ) as ranking";
		sql += " from titles ";
		if( ! mode.equals("all")) {
			sql += "where " + mode + " like '%" + keyword + "%'";
		}
		sql += " )";
		sql += " where ranking between ? and ? ";
		List<Title> title_list = new ArrayList<Title>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Title title = new Title();
				title.setTitle_condition(rs.getString("title_condition"));
				title.setTitle_img(rs.getString("title_img"));
				title.setTitle_name(rs.getString("title_name"));
				title.setTitle_no(rs.getInt("title_no"));
				title_list.add(title);
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
		return title_list;
	}

	public int selectCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from titles";

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
