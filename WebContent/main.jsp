<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
#header{
	position:fixed;

	    width:100%;

	    top:0;

	    left:0;

	background-color:#FFFFFF;
}
</style>
</head>

<body>
<header>

<div id="header"> 
<jsp:include page="header.jsp"/>
</div>
<section style="width:100%;height:870px;display:flex;justify-content:center">


<div style="width:100%;height:870px;overflow:hidden;position:absolute;left:0;z-index:-1">
<img src="img/background.jpg" style="opacity:20%;position:absolute;margin:auto;width:100%;height:870px;left:0;right:0;top:0;bottom:0" alt="펫어씨스턴트 펫시터가 제공하는 강아지 돌봄 서비스">
</div>
</section>

</header>
</body>


</html>