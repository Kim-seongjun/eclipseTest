<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	left:600px;
	
}
#hed{
	font-size: 60px;
	font-weight: bold;
	margin-bottom:50px;
}
.btn{
	all:unset;
	margin-right: 100px;
	background-color: #00c8b7;
	padding:10px 20px;
	font-size: 20px;
	color:white;
	font-weight:bold;
	border-radius: 8px;
	width:100px;
	height: 35px;
	text-align: center;
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
<input type="submit" class='btn' value='예약 확인' formaction='rescheck' />
<input type="submit" class='btn' value='리뷰 쓰기' formaction='reviewinsert'/>
<input type="submit" class='btn' value='홈' formaction='home' />

</form>
</div>


</div>
</body>
</html>