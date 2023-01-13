<%
	//Step 2 Load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch(ClassNotFoundException err) {
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	//Step 3 Creare Connection Object
	Connection conn = null;
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","0000");
	} catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}
%>