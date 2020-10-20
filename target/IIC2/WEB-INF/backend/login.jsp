<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="DB.Const" %>
<%
    String entLogin = request.getParameter("login");
    String entPass =  request.getParameter("password");

    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM user WHERE login="+"'"+ entLogin +"'";
    ResultSet rs = null;
    try {
        rs = stmt.executeQuery(sql);
    } catch (SQLException e) {
        response.sendRedirect("logError");
    }
    String pass = null;
    if(rs.next()){
        pass = rs.getString(Const.USER_PASS);
        session.setAttribute("name",rs.getString(Const.USER_NAME));
        session.setAttribute("group",rs.getString(Const.USER_GROUP));
        session.setAttribute("surname",rs.getString(Const.USER_SURNAME));
    }
    if(entPass.equals(pass)) {
        if(rs.getString(Const.USER_RIGHTS).equals("admin")) response.sendRedirect("admin/main");
        else if(rs.getString(Const.USER_RIGHTS).equals("user")) response.sendRedirect("user/main");
    }
    else{
        response.sendRedirect("logError");
    }
    conn.close();
%>