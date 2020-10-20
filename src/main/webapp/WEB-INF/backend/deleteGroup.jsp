<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "DELETE FROM "+Const.GROUP_TABLE
            +" WHERE " +Const.GROUP_ID +"="+request.getParameter("group_id");
    stmt.executeUpdate(sql);
    String sql2 = "UPDATE "+Const.USER_TABLE
            + " SET "+ Const.USER_GROUP + "=null"
            +" WHERE " +Const.GROUP_ID +"="+request.getParameter("group_id");
    stmt.executeUpdate(sql2);
    String sql3 = "DELETE FROM "+Const.TT_TABLE
            +" WHERE " +Const.TT_ID + "=" + request.getParameter("old_group_id");
    stmt.executeUpdate(sql3);
    conn.close();

    response.sendRedirect("students");
%>