<%--
  Created by IntelliJ IDEA.
  User: miste
  Date: 14.10.2020
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%! String pageTitle = "Logging in denied";%>
<%@ include file = "layouts/header.jsp"%>

<div class="mainDiv">
    <div class="errWindow">
        An error ocured while loggin in <br>
        Try relog in the password or register <b style="color:#84dcc6">NOW</b>
        <form action="login" method="post" id="secLogForm" style="display: block;width: 100%">
            <input id="login" name="login" type="text" placeholder="Login">
            <input id="password" name="password" type="password" placeholder="Password">
            <button id="logButton" style="background-color: #84dcc6;padding: 7px 15px;margin: 0px 15px;
			border: 1px solid #fff;color: #222; border-radius: 15px; cursor: pointer;">
                Log In
            </button>
        </form>
    </div>
</div>

<%@ include file ="layouts/footer.jsp"%>
