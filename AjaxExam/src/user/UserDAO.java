package user;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import org.json.simple.*;

import user.User;
import util.ConnectionPool;

public class UserDAO {
	public static ArrayList<User> getList() throws NamingException, SQLException{
		String sql = "SELECT * FROM user";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		ArrayList<User> users = new ArrayList<User>();
		
		while(rs.next()) {
			users.add(new User(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
		}
		
		return users;
	} 
	
	public static String getListJSON() throws NamingException, SQLException{
		String sql = "SELECT * FROM user";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		JSONArray users = new JSONArray();
		
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("userName", rs.getString("userName"));
			obj.put("userAge", rs.getString("userAge"));
			obj.put("userGender", rs.getString("userGender"));
			obj.put("userEmail", rs.getString("userEmail"));
			users.add(obj);
		}
		
		return users.toJSONString();
	}
	
	public static ArrayList<User> search(String userName) {
		String sql = "SELECT * FROM user WHERE userName LIKE ?";
		
		ArrayList<User> users = new ArrayList<User>();
		
		try {
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+userName+'%');
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				users.add(new User(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	public int register(User user) {
		String sql = "INSERT INTO user VALUES(?,?,?,?)";
		
		try {
			Connection conn = ConnectionPool.get();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserName());
				pstmt.setInt(2, user.getUserAge());
				pstmt.setString(3, user.getUserGender());
				pstmt.setString(4, user.getUserEmail());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;//데이터베이스 오류
	}
}

