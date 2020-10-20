<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %>
<%@ page import="java.sql.ResultSet" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO "+ Const.GROUP_TABLE+"("
            + Const.GROUP_TEACHER + ") VALUES('"
            + request.getParameter("teacher") + "')";
    stmt.executeUpdate(sql);
    String sql1 = "SELECT * FROM "+Const.GROUP_TABLE+" ORDER BY " + Const.GROUP_ID + " DESC ";
    ResultSet rs = stmt.executeQuery(sql1);
    rs.next();
    String sql2 = "INSERT INTO "+Const.TT_TABLE + "("
            + Const.TT_ID + ") VALUES('"
            + rs.getInt(Const.GROUP_ID) + "')";
    stmt.executeUpdate(sql2);
    conn.close();

    response.sendRedirect("students");
%>