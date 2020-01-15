<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약 완료</title>
<style>
	#btn_div{
		position:relative;
		justify-content:center;
		align-items:center; 
	}
	#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}
#inbody{
	position:relative;
	top:300px;
	text-align:center;
	
}
#hed{
	font-size: 60px;
	font-weight: bold;
	margin-bottom:50px;
}
.btn{
	all:unset;
	margin-right: 60px;
	margin-left:50px;
	background-color: #00c8b7;
	padding:10px 20px;
	font-size: 20px;
	color:white;
	font-weight:bold;
	border-radius: 8px;
	width:100px;
	height: 35px;
	text-align: center;
	cursor:pointer;
}

#homebtn{
margin-left: 100px;
}
</style>
</head>
<body>
<div id="header">
			<jsp:include page="header.jsp" />
		</div>


<div id='inbody'>
<div id='hed'>예약이 완료되었습니다.</div>

<div id='btn_div'>

	<form  method='post'>
	<input type="submit" class='btn' value='예약 확인' formaction='resshow' />
	<input type="submit" class='btn' id="homebtn" value='홈' formaction='home' />

	</form>
</div>


</div>
</body>
</html>