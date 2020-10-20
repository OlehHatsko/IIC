<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "UPDATE "+Const.USER_TABLE
            + " SET "+ Const.USER_GROUP + "="+request.getParameter("group_id")
            +" WHERE " +Const.USER_ID +"="+request.getParameter("user_id");
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("students");
%>