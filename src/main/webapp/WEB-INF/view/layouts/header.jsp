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
		<div style="width: 100%;height: 50px;display: none;justify-content: flex-end;position: absolute;">
		<form action="login" id="logForm" method="post" style="background-color: #95a3b3;padding: 10px;display: flex;
		align-items: center;">
			<input id="login" name="login" type="text" placeholder="Login">
			<input id="password" name="password" type="password" placeholder="Password">
			<button id="logButton" style="background-color: #84dcc6;padding: 7px 15px;margin: 0px 15px;
			border: 1px solid #fff;color: #222; border-radius: 15px; cursor: pointer;">
				Log In
			</button>
		</form>
	</div>
		<div style="font-size: 2.5em;color: #84dcc6;margin: 0px 15px;">CENAT DANCE</div>		
		<button id="logButtonFake" onclick="changeOpacity('#logForm',0,1)" style="background-color: #84dcc6;
		padding: 7px 15px;margin: 0px 15px;border: 1px solid #fff;color: #222; border-radius: 15px; cursor: pointer;">
			Log In
		</button>
	</div>
	<div class="menu">
		<div class="menuIntem" style="cursor: pointer;">
			About US
		</div>
	</div>
	<script>
		function sleep(ms) {
  		return new Promise(resolve => setTimeout(resolve, ms));
		}
		async function changeOpacity(q, low, high)
		{
				var menu = document.querySelector(q);
				menu.style.opacity = 0;
				menu.parentElement.style.display = 'flex';
				
				var value = 0.01;
					while(value<high)
					{
						value += 0.03;
						await sleep(2);
						menu.style.opacity = value;
					}
					menu.style.opacity = high;
		}
		</script>