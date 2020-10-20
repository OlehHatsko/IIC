<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "[ADMIN]Timetable";%>
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
            rs = stmt.executeQuery("SELECT "+Const.GROUP_ID+" FROM "+ Const.GROUP_TABLE);
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }
            int grArr[] = new int[rowCount];
            rs = stmt.executeQuery("SELECT "+Const.GROUP_ID+" FROM "+ Const.GROUP_TABLE);
            int i = 0;
            while(rs.next()) {
            grArr[i] = rs.getInt(Const.GROUP_ID);
            i++;
            }
            for(int k = 0; k<grArr.length;k++){
                rs = stmt.executeQuery("SELECT * FROM "+Const.TT_TABLE + " WHERE "+Const.TT_ID + "="+grArr[k]);
                if(rs.next()){
        %>

        <tr>
        <td>
            <%=rs.getInt(Const.TT_ID)%> group
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>1')">
            <%
                if(rs.getString(Const.TT_SUNDAY) != null)
                    out.println(rs.getString(Const.TT_SUNDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>1"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="1">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>2')">
            <%
                if(rs.getString(Const.TT_MONDAY) != null)
                    out.println(rs.getString(Const.TT_MONDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>2"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="2">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>3')">
            <%
                if(rs.getString(Const.TT_TUESDAY) != null)
                    out.println(rs.getString(Const.TT_TUESDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>3"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="3">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>4')">
            <%
                if(rs.getString(Const.TT_WEDNESDAY) != null)
                    out.println(rs.getString(Const.TT_WEDNESDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>4"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="4">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>5')">
            <%
                if(rs.getString(Const.TT_THURSDAY) != null)
                    out.println(rs.getString(Const.TT_THURSDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>5"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="5">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>6')">
            <%
                if(rs.getString(Const.TT_FRIDAY) != null)
                    out.println(rs.getString(Const.TT_FRIDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>6"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="6">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        <td onclick="toggle('#alterTimetable<%=rs.getInt(Const.TT_ID)%>7')">
            <%
                if(rs.getString(Const.TT_SATURDAY) != null)
                    out.println(rs.getString(Const.TT_SATURDAY));
            %>
            <form action="alterTimetable" method="post" id="alterTimetable<%=rs.getInt(Const.TT_ID)%>7"
                  style="display: none;">
                <input type="hidden" name="group_id" value="<%=rs.getInt(Const.TT_ID)%>">
                <input type="hidden" name="tt_id" value="7">
                <input onclick="event.stopPropagation()" type="text" maxlength="5" name="value" placeholder="00:00">
            </form>
        </td>
        </tr>

        <%
            }}
        %>
    </table>
</div>

<%
    conn.close();
%>
<%@ include file = "../layouts/footer.jsp"%>