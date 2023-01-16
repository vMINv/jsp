package jdbc;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardDAO {
	//게시물 등록 
	public static int insert(String btitle, String bwriter, String bcontent) throws NamingException, SQLException {
		String sql = "INSERT INTO board(btitle, bwriter, bcontent) VALUES(?,?,?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bwriter);
			pstmt.setString(3, bcontent);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	//게시물 목록
	public static ArrayList<BoardDTO> getList() throws NamingException, SQLException{
		String sql = "SELECT * FROM board";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
		
		while(rs.next()) {
			boards.add(new BoardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
		}
		
		return boards;
	}
	
	//게시물 하나
	public static BoardDTO getDetail(String bno) throws NamingException, SQLException {
		String sql = "SELECT * FROM board WHERE bno=?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		String btitle = rs.getString(2);
		String bwriter = rs.getString(3);
		String bcontent = rs.getString(4);
		String bdate = rs.getString(5);
		
		BoardDTO board = new BoardDTO(bno, btitle, bwriter, bcontent, bdate);
		
		return board;
	}
	
	//게시물 수정
	public static int update(String bno, String btitle, String bwriter, String bcontent) throws NamingException, SQLException {
		String sql = "UPDATE board SET btitle=?, bwriter=?, bcontent=? WHERE bno=?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bwriter);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bno);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	//게시물 삭제
	public static int delete(String bno) throws NamingException, SQLException {
		String sql = "DELETE FROM board WHERE bno=?";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
}
