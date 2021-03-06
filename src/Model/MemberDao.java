package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao extends SuperDao {

	public MemberDao() {
	}

	// 회원삭제
	public int DeleteDate(String id) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from members where user_id=?" ;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, id);

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
	public int UpdateData(Member member) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update members set user_password=?, user_name=?, user_email=?, user_nickName=?, user_img=? where user_id=? ";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_password());
			pstmt.setString(2, member.getUser_name());
			pstmt.setString(3, member.getUser_email());
			pstmt.setString(4, member.getUser_nickname());
			pstmt.setString(5, member.getUser_img());
			pstmt.setString(6, member.getUser_id());

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

	// 회원가입
	public int InsertData(Member member) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = " insert into members(user_id, user_password, user_name, user_email, user_nickname, user_img)"
				+ " values(?, ?, ?, ?, ?, ?)";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_password());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getUser_email());
			pstmt.setString(5, member.getUser_nickname());
			pstmt.setString(6, member.getUser_img());

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

	// 로그인
	public Member SelectDate(String id, String password) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id, user_img, user_nickname from members where user_id=? and user_password=?";
		Member member = null;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_img(rs.getString("user_img"));
				member.setUser_nickname(rs.getString("user_nickname"));
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
		return member;
	}

	public Member SelectDateByPK(String id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id, user_password , user_name, user_email, sign_date, user_title, user_img, user_nickname from members where user_id=?";
		Member member = null;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setUser_id(rs.getString("user_id"));
				//회원 정보 수정을 위해 user_password 추가함
				member.setUser_password(rs.getString("user_password"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_email(rs.getString("user_email"));
				member.setSign_date(rs.getString("sign_date"));
				if(rs.getString("user_img") == null || rs.getString("user_img") == "") {
					member.setUser_img("산타니05.jpg");
				} else {
					member.setUser_img(rs.getString("user_img"));
				}				
				member.setUser_title(rs.getString("user_title"));
				member.setUser_nickname(rs.getString("user_nickname"));
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
		return member;
	}

	// 중복체크
	// str - 아이디 OR 닉네임
	// chk - 아이디는 1, 아니면 닉네임
	public boolean OverlapCheck(String str, int no) {

		boolean Check = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (no == 1) {
			sql = "select user_id from members where user_id=?";
		} else if( no == 2) {
			sql = "select user_id from members where user_nickname=?";
		} else if( no == 3){
			sql = "select user_id from members where user_email=?";
		}

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, str);

			rs = pstmt.executeQuery();

			if (!rs.next()) {
				Check = true; // 사용가능한 아이디 OR 닉네임 or 이메일
			} else {
				Check = false; // 이미 사용중인 아디이 OR 닉네임 or 이메일
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

		return Check;

	}

	public List<Member> SelectDataList(int beginRow, int endRow, String mode,
			String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id, user_name, user_email, user_nickname, sign_date, user_title, ranking";
		sql += " from";
		sql += " (";
		sql += " select user_id, user_name, user_email, user_nickname, sign_date, user_title, rank() over( order by user_id desc ) as ranking";
		sql += " from members ";
		if(!mode.equals("all")) {
			sql += "where " + mode + " like '%" + keyword + "%'";
		}
		sql += " )";
		sql += " where ranking between ? and ? ";
		List<Member> member_list = new ArrayList<Member>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_email(rs.getString("user_email"));
				member.setUser_nickname(rs.getString("user_nickname"));
				member.setSign_date(String.valueOf((rs.getDate("sign_date"))));
				member.setUser_title(rs.getString("user_title"));
				member_list.add(member);
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
		return member_list;
	}

	public int selectCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from members";

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
