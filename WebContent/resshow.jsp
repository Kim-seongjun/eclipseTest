<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

</head>
<body>
<header>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		</header>
<h1 style="text-align: center; color: #36e9ce">예약상세</h1>

<script>
var json = ${json_ulist};
console.log(json);
console.log("--------------");
var str = "";
str += "<form action='reservation' method='post'>";
















</script>
</body>
</html>