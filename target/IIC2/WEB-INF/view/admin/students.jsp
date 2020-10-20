<%@ page import="DB.DBHandler" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.Const" %>
<%! String pageTitle = "[ADMIN]Students";%>
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
<div style="padding: 0;margin: 0;min-height: calc(100vh - 160px)">
<div class="functionMenu">
    <div class="funcOpt" onclick="toggle('#addGroupTogg')">
        Add Group
    </div>
    <div class="toggled" id="addGroupTogg" style="right: 170px;display: none">
        <form action="addGroup" id="addGroupForm" method="post" >
            <label for="selTech" style="padding: 10px;">Teacher</label>
            <select name="teacher" id="selTech">
                <%
                    rs = stmt.executeQuery("SELECT "+Const.USER_ID+","+Const.USER_NAME+","+Const.USER_SURNAME+" FROM "
                            + Const.USER_TABLE + " WHERE rights='admin'");
                    while (rs.next()){
                %>

                <option value="<%=rs.getInt(Const.USER_ID)%>"><%=rs.getString(Const.USER_NAME)+" "+rs.getString(Const.USER_SURNAME)%></option>

                <%
                    }
                %>
            </select>
            <button onclick="document.querySelector('#addGroupForm').submit()">Add</button>
        </form>
    </div>
    <div class="funcOpt" onclick="toggle('#addStudentTogg')">
        Add Student
    </div>
    <div class="toggled" id="addStudentTogg" id="addStudentForm" style="right: 10px;display: none">
        <form action="addStudent" method="post" style="display: flex">
            <input type="text" name="name" placeholder="Name">
            <input type="text" name="surname" placeholder="Surname">
            <input type="text" name="rights" placeholder="Rights">
            <input type="text" name="login" placeholder="Login">
            <input type="text" name="password" placeholder="Password">
            <button onclick="document.querySelector('#addStudentForm').submit()">Add</button>
        </form>
    </div>
</div>
<div class="stManagement">
    <div style="width: 15%;background-color: #222;">
        <%
            rs = stmt.executeQuery("SELECT "+Const.GROUP_ID+" FROM "+ Const.GROUP_TABLE);
            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }
            int grArr[] = new int[rowCount];
            rs = stmt.executeQuery("SELECT "+Const.GROUP_ID+" FROM "+ Const.GROUP_TABLE);
            int i = 0;
            while(rs.next()){
        %>

        <div class="groupOpt" id="group<%=rs.getInt(Const.GROUP_ID)%>"
             onclick="showUserList(<%=rs.getInt(Const.GROUP_ID)%>)">
            <div><%=rs.getInt(Const.GROUP_ID)+" "%> group</div>
            <%grArr[i] = rs.getInt(Const.GROUP_ID);
            i++;%>
            <form action="deleteGroup" id="deleteGroup<%=rs.getInt(Const.GROUP_ID)%>" method="post"
                  style="display: none">
                <input type="hidden" value="<%=rs.getInt(Const.GROUP_ID)%>" name="group_id">
            </form>
            <form action="alterGroup" id="alterGroup<%=rs.getInt(Const.GROUP_ID)%>" method="post"
                  style="display: none;position: absolute;top: 0;left: 0;padding: 0;margin: 0;height: 100%;">
                <input type="text" value="<%=rs.getInt(Const.GROUP_ID)%>" name="group_id" style="width: 2em;">
                <input type="hidden" value="<%=rs.getInt(Const.GROUP_ID)%>" name="old_group_id">
            </form>
            <div style="display: flex;flex-wrap: nowrap">
                <div id="saveGroupAlter<%=rs.getInt(Const.GROUP_ID)%>" style="cursor:pointer;padding: 0 10px;display: none"
                     onclick="document.querySelector('#alterGroup<%=rs.getInt(Const.GROUP_ID)%>').submit()">
                    &#10004;
                </div>
                <div style="cursor:pointer;padding: 0 10px" onclick="toggle('#alterGroup<%=rs.getInt(Const.GROUP_ID)%>');
                                                                     toggle('#saveGroupAlter<%=rs.getInt(Const.GROUP_ID)%>')">
                    &#9998;
                </div>
                <div style="cursor:pointer;padding: 0 10px;"
                     onclick="document.querySelector('#deleteGroup<%=rs.getInt(Const.GROUP_ID)%>').submit()">
                    &#128465;
                </div>
            </div>
        </div>

        <%}%>
    </div>
    <div style="width: 45%;display: flex;justify-content: center;align-items: center">
        <div id="msgToChoose" style="color: #5c5c5c">Choose group</div>
        <%
            for (i=0;i<grArr.length;i++){
        %>
        <div id="userListFor<%=grArr[i]%>" style="height: 100%;width: 100%;padding: 0;margin: 0;display: none">
        <h5 align="center" style="color: #222"><%=grArr[i]+" group"%></h5>
        <%
            rs = stmt.executeQuery("SELECT "+Const.USER_ID+","+Const.USER_NAME+","+Const.USER_SURNAME+" FROM "
                    + Const.USER_TABLE + " WHERE rights='user' AND "+Const.USER_GROUP+"="+grArr[i]);
            while (rs.next()){
        %>
        <div class="midUserOpt">
            <div style="padding: 0 10px">
                <%=rs.getString(Const.USER_NAME)+ " " + rs.getString(Const.USER_SURNAME)%>
            </div>
            <form action="deleteFromGroup" id="deleteFromGroup<%=rs.getInt(Const.USER_ID)%>" method="post"
                  style="display: none">
                <input type="hidden" value="<%=rs.getInt(Const.USER_ID)%>" name="user_id">
            </form>
            <div style="cursor:pointer;padding: 0 10px" onclick="document.querySelector('#deleteFromGroup<%=rs.getInt(Const.USER_ID)%>').submit()">
                &#10095;
            </div>
        </div>

        <%
            }
        %>
            </div>
        <%
            }
        %>
    </div>
    <div style="width: 40%;background-color:#4b4e6d;display: flex; flex-wrap:wrap;position: relative ">
        <div style="width: 100% ">
            <h3>Admins:</h3>
            <%
                rs = stmt.executeQuery("SELECT "+Const.USER_NAME+","+Const.USER_SURNAME+" FROM "
                        + Const.USER_TABLE + " WHERE rights='admin'");
                while (rs.next()){
            %>

            <div style="color: #fff">
                <%=rs.getString("name")+ " " + rs.getString("surname")%>
            </div>

            <%
                }
            %>
        </div>

        <div style="width: 100%;overflow: hidden">
            <h3>Ungroupped users:</h3>
            <%
                rs = stmt.executeQuery("SELECT "+Const.USER_ID+","+Const.USER_NAME+","+Const.USER_SURNAME+" FROM "
                        + Const.USER_TABLE + " WHERE rights='user' AND "+Const.USER_GROUP+" IS null");
                while (rs.next()){
            %>

            <div class="userOpt" ;>
                <div onclick="toggle('#user<%=rs.getInt(Const.USER_ID)%>')">
                    <%=rs.getString(Const.USER_NAME)+ " " + rs.getString(Const.USER_SURNAME)%>
                </div>
                <div class="toggled" id="user<%=rs.getInt(Const.USER_ID)%>"
                     style="top:0px;right:0px;left:0;bottom:0; height: 100%;
                            width: 100%;display: none;justify-content: space-between; ">
                    <div style="color: #222;padding: 5px;width: 60%" onclick="toggle('#user<%=rs.getInt(Const.USER_ID)%>')">
                        <%=rs.getString(Const.USER_NAME)+ "&nbsp" + rs.getString(Const.USER_SURNAME)%>
                    </div>
                    <form action="addUserToGroup" id="addUserToGroup<%=rs.getInt(Const.USER_ID)%>" method="post" style="padding: 5px">
                        <input type="hidden" name="user_id" value="<%=rs.getInt(Const.USER_ID)%>">
                        <select name="group_id">
                            <%
                                for(int j = 0; j < grArr.length;j++){
                            %>
                            <option value="<%=grArr[j]%>"><%=grArr[j]+" gruop"%></option>
                            <%
                                }
                            %>
                        </select>
                    </form>
                    <div style="background-color: #84dcc6;padding: 5px 20px;margin-left: 100px"
                         onclick="document.querySelector('#addUserToGroup<%=rs.getInt(Const.USER_ID)%>').submit()">
                        add
                    </div>
                    <div style="background-color:darkred;padding: 5px 20px;margin-left: 10px"
                         onclick="document.querySelector('#deleteUser<%=rs.getInt(Const.USER_ID)%>').submit()">
                        delete
                    </div>

                    <form action="deleteUser" id="deleteUser<%=rs.getInt(Const.USER_ID)%>" method="post">
                        <input type="hidden" name="user_id" value="<%=rs.getInt(Const.USER_ID)%>">
                    </form>
                </div>
            </div>

            <%
                }
            %>
        </div>

    </div>
</div>
</div>
<%
    conn.close();
%>
<%@ include file = "../layouts/footer.jsp"%>