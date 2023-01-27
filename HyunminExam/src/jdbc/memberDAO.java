package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import user.User;
import util.ConnectionPool;

public class memberDAO {
	//회원가입 
	public boolean insert(String mname, String mid, String mpass, String mgender, String memail, String mphone) {
		String sql = "INSERT INTO member(mname, mid, mpass, mgender, memail, mphone) VALUES(?,?,?,?,?,?)";
		
		try {
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mname);
				pstmt.setString(2, mid);
				pstmt.setString(3, mpass);
				pstmt.setString(4, mgender);
				pstmt.setString(5, memail);
				pstmt.setString(6, mphone);
			
			int result = pstmt.executeUpdate();
			if(result==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//로그인체크
	//회원전체목록
	public static ArrayList<member> getList() throws NamingException, SQLException{
		String sql = "SELECT * FROM member";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<member> members = new ArrayList<member>();
		
		while(rs.next()) {
			members.add(new member(rs.getString(2), rs.getString(3), rs.getString(5)));
		}
		
		return users;
	}
	
	//회원검색
	public static ArrayList<member> search(String userName) {
		String sql = "SELECT * FROM member WHERE userName LIKE ?";
		
		ArrayList<member> members = new ArrayList<member>();
		
		try {
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+userName+'%');
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				members.add(new member(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return members;
	}
	
	//회원한명목록
	//회원정보수정
	//회원정보삭제
}
