<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();

    String sql = "UPDATE "+Const.GROUP_TABLE
            + " SET "+ Const.GROUP_ID + "=" + request.getParameter("group_id")
            + " WHERE " +Const.GROUP_ID +"=" + request.getParameter("old_group_id");
    String sql2 = "UPDATE "+Const.USER_TABLE
            + " SET "+ Const.USER_GROUP + "=" + request.getParameter("group_id")
            +" WHERE " +Const.USER_GROUP + "=" + request.getParameter("old_group_id");
    String sql3 = "UPDATE "+Const.TT_TABLE
            + " SET "+ Const.TT_ID + "=" + request.getParameter("group_id")
            +" WHERE " +Const.TT_ID + "=" + request.getParameter("old_group_id");
    stmt.executeUpdate(sql3);
    stmt.executeUpdate(sql2);
    stmt.executeUpdate(sql);
    conn.close();

    response.sendRedirect("students");
%>