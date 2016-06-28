package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class BoardDao extends SuperDao {

	public BoardDao() {
	}
	
	//�Խù� ����
	public int DeleteBoard(String board_writer, int boards_no) {
		
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from boards where board_no=? and board_writer=?" ;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, boards_no);
			pstmt.setString(2, board_writer);

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
	
	//�Խù� ����
	public int UpdateBoard(Board board) {
		
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update boards set(board_title=?, board_update=?, board_content=?, board_img=?) wherd board_no=? and board_writer=?" ;
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_title());
			pstmt.setString(2, board.getBoard_update());
			pstmt.setString(3, board.getBoard_content());
			pstmt.setString(4, board.getBoard_img());
			pstmt.setInt(5, board.getBoard_no());
			pstmt.setString(6, board.getBoard_writer());

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

	//�Խù� �ۼ�
	public int Signup(Member member) {
				
		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		
		String sql = "";
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

	//�α���
	public Member Login(String id, String password) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id, user_img, user_nickname from members where user_id=?, user_password=?";
		Member member = new Member();
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			member.setUser_id(rs.getString("user_id"));
			member.setUser_img(rs.getString("user_img"));
			member.setUser_nickname(rs.getString("user_nickname"));

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
	public boolean OverlapCheck(String str, int chk) {

		Boolean Check = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		if (chk == 1) {
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

			if (rs == null) {
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

}
