package jdbc;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import util.ConnectionPool;

public class FBoardDAO {
	//게시물 등록 
	public static int insert(String btitle, String bwriter, String bcontent, String bfileone, String bfiletwo) throws NamingException, SQLException {
		String sql = "INSERT INTO fboard(btitle, bwriter, bcontent, bfileone, bfiletwo) VALUES(?,?,?,?,?)";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bwriter);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bfileone);
			pstmt.setString(5, bfiletwo);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	//게시물 목록
	public static ArrayList<FBoardDTO> getList() throws NamingException, SQLException{
		String sql = "SELECT * FROM fboard";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<FBoardDTO> boards = new ArrayList<FBoardDTO>();
		
		while(rs.next()) {
			boards.add(new FBoardDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
		}
		
		return boards;
	}
}
