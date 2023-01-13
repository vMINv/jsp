package jdbc6steps;

import java.sql.*;

public class dbconnclose {
	//DB 연결 공통부분 메소드 
	public static Connection getConnection() {
		//Step 2 Load JDBC Driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException err) {
			System.out.println("JDBC Driver loading error<br>" + err.getMessage());
		}

		//Step 3 Create Connection Object
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","0000");
		} catch(SQLException err) {
			System.out.println("Connection Object error<br>" + err.getMessage());
		}
		
		return conn;
	}
	
	//DB 해제 공통부분 메소드 
	public static void closeConnection(PreparedStatement pstmt, Connection conn) {
		//Step 6 Close Connection
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
