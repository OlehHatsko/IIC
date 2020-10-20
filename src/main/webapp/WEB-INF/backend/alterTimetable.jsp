<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="DB.Const" %><%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();

    String sql = null;
    String day = request.getParameter("tt_id");
    switch (day){
        case "1":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_SUNDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "2":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_MONDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "3":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_TUESDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "4":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_WEDNESDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "5":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_THURSDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "6":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_FRIDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
        case "7":
            sql = "UPDATE "+ Const.TT_TABLE
                    + " SET " + Const.TT_SATURDAY + "='" + request.getParameter("value") + "'"
                    + " WHERE " + Const.TT_ID + "=" + request.getParameter("group_id");
            break;
    }
    stmt.executeUpdate(sql);

    conn.close();

    response.sendRedirect("students");
%>