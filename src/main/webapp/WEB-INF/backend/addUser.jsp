<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "INSERT INTO "+ Const.USER_TABLE+"("
            + Const.USER_NAME + ", "
            + Const.USER_SURNAME + ", "
            + Const.USER_RIGHTS + ", "
            + Const.USER_LOGIN + ", "
            + Const.USER_PASS + ") VALUES('"
            + request.getParameter("name") + "', '"
            + request.getParameter("surname") + "', '"
            + request.getParameter("rights") + "', '"
            + request.getParameter("login") + "', '"
            + request.getParameter("password") + "')";
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("students");
%>