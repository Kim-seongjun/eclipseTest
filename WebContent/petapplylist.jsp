<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫시터지원자 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.img_file{
	width:300px;
	height: 200px;
}

</style>
</head>
<body>
<h1>펫시터지원자리스트 페이지</h1>

<c:if test="${json_plist==null}">
<div>지원자가 존재하지 않습니다.</div>
</c:if>

	<div id='test'>
<c:if test="${json_plist!=null}">

</c:if>
	</div>
	
<script>
var json=${json_plist};
console.log(json.length);
console.log("--------------");
var str="";

$.each(json,function(key,value){
str+="<form action='petsitterappr' method='post'>";
	
	console.log(json[key]);

	str+="<div>";
	str+=json[key].id
	str+="<input type='hidden' name='sit_id' value='"+json[key].id+"' />";
	str+="</div>";
	str+="<div>";
	str+=json[key].title
	str+="</div>";
	str+="<div>";
	str+=json[key].cont
	str+="</div>";
	str+="<div>";
	str+=json[key].price
	str+="</div>";
	str+="<div>";
	str+="<img class='img_file' src='img/"+json[key].imgFile+"' alt='펫시터프로필사진' />";
	str+="</div>";
	str+="<div>";
	str+=json[key].questions1
	str+="</div>";
	str+="<div>";
	str+=json[key].questions2
	str+="</div>";
	str+="<div>";
	str+=json[key].questions3
	str+="</div>";
	str+="<div>";
	str+=json[key].questions4
	str+="</div>";
	str+="<div>";
	str+=json[key].questions5
	str+="</div>";
	str+="<div>";
	str+=json[key].questions6
	str+="</div>";
	str+="<div>";
	str+=json[key].questions7
	str+="</div>";
	str+="<input type='submit' value='승인' />";
	str+="<input type='submit' value='거절' formaction='deleteapply' />";
str+="</form>";
});

$("#test").append(str);

</script>
</body>
</html>