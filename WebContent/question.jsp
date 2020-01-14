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
<div id="div_question" style="border: 1px solid black; margin-bottom: 20px; height: 500px;">
<div>QUESTION1<input type="button" class="btn" value="수정"></div>
<div>QUESTION2<input type="button" class="btn" value="수정"></div>
<div>QUESTION3<input type="button" class="btn" value="수정"></div>
<div>QUESTION4<input type="button" class="btn" value="수정"></div>
<div>QUESTION5<input type="button" class="btn" value="수정"></div>
<div>QUESTION6<input type="button" class="btn" value="수정"></div>
<div>QUESTION7<input type="button" class="btn" value="수정"></div>

</div>
<div id="div_question_re" style="border: 1px solid black; height: 500px;">

</div>
<script>
console.log(jsontest);
var json=${jsontest};
var str="";

for(var i=0;i<json.length;i++){
	str+="<input type='text' value='"+json[i]+"' readOnly class='questions'/><br />";
	str+="<input class='result'name='questions"+(i+1)+"' type='text' /><br />";
	console.log(json[i]);
}

$("#div_question").append(str);
console.log("str="+str);

	$('#btn').on(click,function(){
		
	});
</script>
</body>
</html>