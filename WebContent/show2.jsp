<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>

<%
	String plid = request.getParameter("plid");

	//mysql连接
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String URL = "jdbc:mysql://localhost/ymc?user=root&password=yascn&useUnicode=true&characterEncoding=utf8";
	Connection con = DriverManager.getConnection(URL);

	try {
		// 准备语句执行对象
		Statement stmt = con.createStatement();

		String sql = " SELECT * FROM pltemplate WHERE plid = " + plid;
		//System.out.println(photo);
		//String sql = " SELECT * FROM jiaoyu";
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			//System.out.println("123456");
			Blob b = rs.getBlob("facefeature");
			if(b==null)
			{
				System.out.println("nullnulklnlnklfjsdklfjlaskd");
			}
			else
			{
				long size = b.length();
				//out.print(size);
				byte[] bs = b.getBytes(1, (int) size);
				response.setContentType("image/jpeg");
				OutputStream outs = response.getOutputStream();
				outs.write(bs);
				outs.flush();
				out.clear();
				out = pageContext.pushBody();
				outs.close();
			}

		}
		rs.close();
		con.close();
	} finally {

	}
%>
