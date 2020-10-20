<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=pageTitle%></title>
</head>
<script>
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    async function toggle(q)
    {
        var obj = document.querySelector(q);
        if(obj.style.display == "none"){
            obj.style.opacity = 0;
            obj.style.display = 'flex';
            var value = 0.01;
            while(value<1)
            {
                value += 0.05;
                await sleep(2);
                obj.style.opacity = value;
            }
            obj.style.opacity = 1;
        }
        else{
            obj.style.opacity = 1;

            var value = 1;
            while(value>0)
            {
                value -= 0.05;
                await sleep(2);
                obj.style.opacity = value;
            }
            obj.style.opacity = 0;
            obj.style.display = 'none';
        }
    }

    var chGroup = 0;
    function showUserList(group) {
        if(chGroup!=0){
            document.querySelector("#group"+chGroup).classList.remove("chGroupOpt");
            document.querySelector("#userListFor"+chGroup).style.display = "none";

        }
        else{
            document.querySelector("#msgToChoose").style.display = "none";
        }
        chGroup = group;
        document.querySelector("#group"+chGroup).classList.add("chGroupOpt");
        document.querySelector("#userListFor"+chGroup).style.display = "initial";
    }
</script>
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
    <div class="menuIntem" onclick="window.location = '/IIC2_war/admin/students'" style="cursor: pointer;">
        Students
    </div>
    <div class="menuIntem" onclick="window.location = '/IIC2_war/admin/timetable'" style="cursor: pointer;">
        Timetable
    </div>
</div>
