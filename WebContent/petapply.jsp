<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫시터지원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#apply_main{
	border:1px solid black;
	
	display:flex;
	flex-direction:column;
	align-items:center;
	width:50%;

}
body{
	
	display:flex;
	flex-direction:column;
	align-items:center;
}
.result{
	border-left: none;
	border-top: none;
	border-right: none;
	width:80%;
	height: 50px;

}
</style>
</head>
<body>

<h1 style="text-align: center">펫시터 지원 신청서</h1>
<div id="apply_main">


</div>

<script>
var json=${jsontest};
var str="";


/* $.each(json,function(key,value){
	
}); */ 

str+="<form method='post'>";
 for(var i=0;i<json.length;i++){
	str+="<input type='text' value='"+json[i]+"' readOnly/>";
	str+="<input class='result' type='text' />";
	console.log(json[i]);
} 
	str+="<div>본 지원자는 상기 답변 내용에 거짓이 없음을 확인 후 설문을 완료합니다."+
	"사실과 다른 기재로 인한 불미스어운 모든 상황에 대해 당사는 책임이 없음을 안내드립니다.</div>";
	str+="<input type='radio' value='예' /> 예 <br />";
	str+="<input type='submit' value='제출' formaction=''/>";
	str+="<input type='submit' value='취소' formaction='home'/>";
	str+="</form>";
	$("#apply_main").append(str);
	console.log("str="+str);
</script>

</body>
</html>