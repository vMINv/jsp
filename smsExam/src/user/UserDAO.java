package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

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
}
