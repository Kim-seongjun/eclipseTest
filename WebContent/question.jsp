<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}
#div_question{
/* 	border: 1px solid black;   */
	margin-bottom: 30px; 
	margin-left : 20%;
/* 	margin-top : 100px; */
	width : auto;
	height: auto;
}
h1{
	margin-top: 100px;
}
</style>
</head>
<body>
<div id="header">
		<jsp:include page="header.jsp" />
	</div>
<h1 style="text-align: center; color: #36e9ce">질문 수정</h1>
<div id="div_question">

</div>

<script>
var json=${json_question};
console.log(json);
var str="";

for(var i=0;i<json.length;i++){
	str+="<form method='post'>";
	str+="<input style='font-size: 15px;width: 1200px; height: 35px; margin-bottom: 5px; background-color: #A4A4A4;' type='text' value='"+json[i]+"' readOnly class='questions'/><br />";
	str+="<input type='hidden' name='questions_no' value='question"+(i+1)+"'>";
	str+="<input style='font-size: 15px;width: 1200px; height: 35px; margin-bottom: 30px; background-color: #D8D8D8;' class='qu_result' name='questions' type='text' /><input style='height: 40px;' type='submit' value='수정' formaction='pqmodify'><br />";
	str+="</form>";
	console.log(json[i]);
}

$("#div_question").append(str);
console.log("str="+str);	


</script>
</body>
</html>