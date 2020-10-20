<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=pageTitle%></title>
</head>
<body>
<style><%@ include file = "../main.css"%></style>
<div class="header" >
    <div style="font-size: 2.5em;color: #84dcc6;margin: 0px 15px;">CENAT DANCE</div>
    <div style="color: #84dcc6">
        Hi, <%=session.getAttribute("name")+" "+session.getAttribute("surname")%>
    </div>
    <button onclick="window.location = '/IIC2_war/logout'" id="logPutButton" style="background-color: #222;
		padding: 7px 15px;margin: 0px 15px;border: 1px solid #fff;color: #fff; border-radius: 15px; cursor: pointer;">
        Log OUT
    </button>
</div>
<div class="menu">
    <div class="menuIntem" style="cursor: pointer;">
        About US
    </div>
    <div class="menuIntem" onclick="window.location = '/IIC2_war/user/timetable'" style="cursor: pointer;">
        Timetable
    </div>
</div>
