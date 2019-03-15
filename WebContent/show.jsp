<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>

<%
//public String getParameter(String name);以一个String返回指定的参数的值
	String plid = request.getParameter("plid");

	//mysql连接
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String URL = "jdbc:mysql://localhost/ymc_touzijituan20190125?user=root&password=yascn&useUnicode=true&characterEncoding=utf8";
	Connection con = DriverManager.getConnection(URL);

	try {
		// 准备语句执行对象
		Statement stmt = con.createStatement();

		String sql = "SELECT * FROM pltemplate WHERE plid = "+ plid;
		//String sql = "SELECT * FROM pltemplate WHERE plid = " + photo;
		//System.out.println(photo);
		//String sql = " SELECT * FROM jiaoyu";
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {

			//System.out.println("123456");
			Blob b = rs.getBlob("facepic");
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
