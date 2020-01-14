<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div id="header">
		<jsp:include page="header.jsp" />
	</div>
<h1>질문 수정</h1>
<div id="div_question" style="border: 1px solid black; margin-bottom: 20px; height: 640px;">

</div>

<script>
var json=${json_question};
console.log(json);
var str="";

for(var i=0;i<json.length;i++){
	str+="<form method='post'>";
	str+="<input style='width: 50%; height: 35px;' type='text' value='"+json[i]+"' readOnly class='questions'/><br />";
	str+="<input type='hidden' name='questions_no' value='question"+(i+1)+"'>";
	str+="<input style='width: 50%; height: 35px;' class='qu_result' name='questions' type='text' /><input style='height: 40px;' type='submit' value='수정' formaction='pqmodify'><br />";
	str+="</form>";
	console.log(json[i]);
}

$("#div_question").append(str);
console.log("str="+str);	

// 	$('#btn').on(click,function(){
		
// 	});
</script>
</body>
</html>