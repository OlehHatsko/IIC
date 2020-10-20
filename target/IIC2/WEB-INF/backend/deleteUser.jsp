<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "DELETE FROM "+Const.USER_TABLE+" WHERE "+Const.USER_ID+"="+request.getParameter("user_id");
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("students");
%>