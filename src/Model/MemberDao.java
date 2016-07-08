package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class MemberDao extends SuperDao {

	public MemberDao() {
	}

	// ȸ������
	public int DeleteMember(String id, String password) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from members where user_id=? and user_password=?";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode(); // ����Ŭ ���� ����� ����
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

	// ȸ������ ����
	public int UpdateUser(Member member) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update members set(user_password=?, user_name=?, user_email=?, user_nickName=?, user_img=? where user_id=?)";
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

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -err.getErrorCode(); // ����Ŭ ���� ����� ����
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

	// ȸ������
	public int Signup(Member member) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = " insert into members(user_id, user_password, user_name, user_email, user_nickname, user_img, sign_date)"
				+ " values(?, ?, ?, ?, ?, ?, to_date(?, 'yyyy/MM/dd'))";
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
			pstmt.setString(7, member.getSign_date());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			SQLException err = (SQLException) e;
			cnt = -(err.getErrorCode()); // ����Ŭ ���� ����� ����
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

	// �α���
	public Member Login(String id, String password) {

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return member;
	}

	// �ߺ�üũ
	// str - ���̵� OR �г���
	// chk - ���̵�� 1, �ƴϸ� �г���
	public boolean OverlapCheck(String str, int no) {

		boolean Check = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (no == 1) {
			sql = "select user_id from members where user_id=?";
		} else {
			sql = "select user_id from members where user_nickname=?";
		}

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, str);

			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				Check = true; // ��밡���� ���̵� OR �г���
			} else {
				Check = false; // �̹� ������� �Ƶ��� OR �г���
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

		return Check;

	}

	public List<Member> MemberList() {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from members";
		List<Member> member_lists = new ArrayList<Member>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_password(rs.getString("user_password"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_email(rs.getString("user_email"));
				member.setUser_nickname(rs.getString("user_nickname"));
				member.setUser_img(rs.getString("user_img"));
				member.setSign_date(rs.getString("sign_date"));
				member.setUser_title(rs.getString("user_title"));
				member_lists.add(member);
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
		return member_lists;
	}

}
