<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "[USER]Timetable";%>
<%@ include file = "header.jsp"%>
<%
    DBHandler DBH = new DBHandler();
    Connection conn = null;
    Statement stmt = null;
    try {
        conn = DBH.getDbConnection();
        stmt = conn.createStatement();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet rs = null;
%>

<div style="width: 100%;height: 100%;padding: 0;margin: 0; display: flex;justify-content: center;
align-items: center; min-height: calc(100vh - 160px)">
    <table>
        <tr>
            <td>GROUP</td>
            <td>
                Sunday
            </td>
            <td>
                Monday
            </td>
            <td>
                Tuesday
            </td>
            <td>
                Wednesday
            </td>
            <td>
                Thursday
            </td>
            <td>
                Friday
            </td>
            <td>
                Saturday
            </td>
        </tr>
        <%
            rs = stmt.executeQuery("SELECT * FROM "+Const.TT_TABLE + " WHERE " + Const.TT_ID + "="+session.getAttribute("group"));
            rs.next();
        %>

        <tr>
            <td>
                <%=rs.getInt(Const.TT_ID)%> group
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_SUNDAY) != null)
                        out.println(rs.getString(Const.TT_SUNDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_MONDAY) != null)
                        out.println(rs.getString(Const.TT_MONDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_TUESDAY) != null)
                        out.println(rs.getString(Const.TT_TUESDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_WEDNESDAY) != null)
                        out.println(rs.getString(Const.TT_WEDNESDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_THURSDAY) != null)
                        out.println(rs.getString(Const.TT_THURSDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_FRIDAY) != null)
                        out.println(rs.getString(Const.TT_FRIDAY));
                %>
            </td>
            <td>
                <%
                    if(rs.getString(Const.TT_SATURDAY) != null)
                        out.println(rs.getString(Const.TT_SATURDAY));
                %>
            </td>
        </tr>
    </table>
</div>

<%
    conn.close();
%>
<%@ include file = "../layouts/footer.jsp"%>