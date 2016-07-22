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

	// 게시물 삭제
	public int DeleteBoard(String board_writer, int boards_no) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "delete from boards where board_no=? and board_writer=?";
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
	public int UpdateBoard(Board board) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;
		String sql = "update boards set(board_title=?, board_update=to_date(sysdate, 'yyyy/MM/dd HH:mm:ss'), board_content=?, board_img=?, user_nickname=?) where board_no=?";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);

			pstmt.setString(1, board.getBoard_title());
			pstmt.setString(2, board.getBoard_content());
			pstmt.setString(3, board.getBoard_img());
			pstmt.setString(4, board.getUser_nickname());
			pstmt.setInt(5, board.getBoard_no());

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
	public int InsertBoard(Board board) {

		PreparedStatement pstmt = null;
		int cnt = MyInterface.ERROR_DEFALT;

		String sql = "insert into boards(board_no, board_writ_date, board_update, board_category, board_writer, user_nickname, board_title, board_content, board_img, group_no)"
				+ " values(board_no_seq.nextval, ?, ?, ?, ?, ?, ?, board_no_seq.currval)";
		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, board.getBoard_category());
			pstmt.setString(2, board.getBoard_writer());
			pstmt.setString(3, board.getUser_nickname());
			pstmt.setString(4, board.getBoard_title());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, board.getBoard_img());

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

	public List<Board> SelectDataList(int beginRow, int endRow) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select board_no, board_title, board_writ_date, board_readhit, user_nickname, board_writer, ranking"
				+ " from"
				+ " ("
				+ " select board_no, board_title, board_writ_date, board_readhit, user_nickname, board_writer, rank() over( order by board_no desc ) as ranking"
				+ " from boards where order_no = 0"
				+ " )"
				+ " where ranking between ? and ? ";

		List<Board> board_lists = new ArrayList<Board>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_writ_date(rs.getString("board_writ_date"));
				board.setBoard_update(rs.getString("board_update"));
				board.setBoard_readhit(rs.getString("board_readhit"));
				board.setUser_nickname(rs.getString("user_nickname"));
				board.setBoard_writer("board_writer");
				board_lists.add(board);
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
		return board_lists;
	}

	public List<Board> SelectBoard(int pk) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select board_no, board_title, board_writer, board_writ_date, board_update, board_readhit, user_nickname, board_content, board_img, order_no"
				+ " from boards where board_no=? order by orderno asc";

		List<Board> board_lists = new ArrayList<Board>();

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, pk);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_writer(rs.getString("board_writer"));
				board.setBoard_writ_date(rs.getString("board_writ_date"));
				board.setBoard_update(rs.getString("board_update"));
				board.setBoard_readhit(rs.getString("board_readhit"));
				board.setUser_nickname(rs.getString("user_nickname"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_img(rs.getString("board_img"));
				board.setOrder_no(rs.getInt("order_no"));
				board_lists.add(board);
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
		return board_lists;
	}

	public int selectCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from boards";

		int cnt = 0;

		List<Board> board_lists = new ArrayList<Board>();

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

	//조회수 증가
	public void updatereadhit(int no) { 
		PreparedStatement pstmt = null;
		int cnt = 0;
		String sql = "update boards set board_readhit=board_readhit+1 whwere board_no=?";

		try {
			if (conn == null) {
				super.conn = super.getConnection();
			}
			pstmt = super.conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return;

	}
/**
 * 
 * @param groupno 게시글의 currval 값
 * @return int sql문 결과 리턴값
 *
 * 한 게시글에 대한 리플 제한 수를 두기 위한 메소드. boReplyController.java 참조
 */
	public int SelectReplyCount(int groupno) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select count(*) as cnt from boards where groupno = ?" ;
		
		int cnt = 0 ; //없는 경우의 기본 값
		try {
			if( this.conn == null ){this.conn = this.getConnection() ;}
			pstmt = this.conn.prepareStatement(sql) ;
			pstmt.setInt(1, groupno);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()){
				cnt = rs.getInt("cnt") ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs != null){rs.close() ;}
				if(pstmt != null){pstmt.close();}
			}catch (Exception e2) {
				e2.printStackTrace() ;
			}
		}
		return cnt;
    }
}
