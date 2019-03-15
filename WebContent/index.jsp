<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<HTML>
<HEAD>
<TITLE>图像测试</TITLE>

</HEAD>

<BODY>
	<%
		//String photo_no = request.getParameter("photo_no");

		//mysql连接
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String URL = "jdbc:mysql://localhost/ymc_touzijituan20190125?user=root&password=yascn&useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(URL);
	%>
	<TABLE align=center>
		<TR >
			<TD>plid</TD>
			<TD>姓名</TD>
		</TR>
		<%
			try {
				// 准备语句执行对象
				Statement stmt = con.createStatement();

				//String sql = " SELECT * FROM pltemplate WHERE id = "+ photo_no;
//优化sql查询效率
				String sql = "SELECT t.plid,t.plname,t.facepic,t.facefeature from pltemplate t LIMIT 1,2";
//				String sql = "SELECT * from pltemplate LIMIT 1,2";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
		%>
		<TR border=1>
			<TD><%=rs.getInt("plid")%></TD>
			<TD><%=rs.getString("plname")%></TD>
			<TD><img src='show.jsp?plid=<%=rs.getInt("plid")%>'></TD>
			 
			<!--TD><img src='show2.jsp?plid=<%=rs.getInt("plid")%>'></TD-->
			 
		</TR>
		<%
			}
				rs.close();
				con.close();
			} finally {

			}
		%>
	</TABLE>

</BODY>
</HTML>
