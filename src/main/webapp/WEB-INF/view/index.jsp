<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHandler" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "Cenat Dance";%>
<%@ include file = "layouts/header.jsp"%>
<%
    DBHandler DBH = new DBHandler();
    Connection conn = DBH.getDbConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM user ";
    ResultSet rs = stmt.executeQuery(sql);
    int id = 0;
    String name = "";
    while (rs.next()) {
        id = rs.getInt(Const.USER_ID);
        name = rs.getString(Const.USER_NAME);
    }
    conn.close();
%>
<div style="min-height: calc(100vh - 160px);padding: 0;margin: 0;">

</div>
<%@ include file = "layouts/footer.jsp"%>
