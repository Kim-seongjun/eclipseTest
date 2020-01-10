<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 검색</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#div_outsearchmain{
		text-align: center;
		border: 1px;
		padding: 20px;
		margin: 15px;
	}
	#div_insearchmain{
		display: inline-block;
		width: 50%;
		border: 1px solid #fbbe53;
		
	}
	.searchli{
		float: left;
		list-style: none;
		font-size: 30px;
		
	}
	#ul_outsearch{
		text-align: center;
		border: 1px;
		padding: 20px;
		margin: 15px;
		border: 1px;
/* 		background-color: #cccccc; */
	}
	#li_insearch{
		display: inline-block;
		width: 50%;
		border: 1px solid black;
	}
	
	.searchimg{
		width: 250px;
		height: 250px;
	}
	
</style>
<style type="text/css">
A:link{text-decoration; color: black;}
A:active{text-decoration; color: orange;}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<div id="div_outsearchmain">
		<div id="div_insearchmain" style="background-color: #cccccc; border-radius: 20px">
			<ul>
				<li class="searchli">
					<a href="#" style="text-decoration: none; text-shadow: 0 0 24px " >전체&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="#" style="text-decoration: none; text-shadow: 0 0 24px">서울&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="#" style="text-decoration: none; text-shadow: 0 0 24px">경기&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="#" style="text-decoration: none; text-shadow: 0 0 24px">인천&nbsp;<span>쿼리문</span></a>
				</li>
			</ul>
		</div>
	</div>
	
	
	<ul id="ul_outsearch">
<!-- 		<a href="#"> -->
<!-- 		<li id="li_insearch"> -->
<!-- 			<div> -->
<!-- 				<div style="float: left; border: 1px solid red; width: 250px; height: 250px;">이미지 넣는곳</div> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<div style="font-size: 30px;">제목:엄마 아빠 걱정은 하지말고 편하게 놀다가렴<br></div> -->
<!-- 				<div style="font-size: 25px;">이름:bbb<br></div> -->
<!-- 				<div style="font-size: 25px;">내용:ccc<br></div> -->
<!-- 				<div style="font-size: 25px; color: #FF8000">단가:30000</div> -->
				
<!-- 			</div> -->

<!-- 		</li> -->
<!-- 		</a> -->
	</ul>
	
	
	
	<script>
	var json=${json_search}
	console.log(json);
	var str = "";
	str+="<form action= 'petsittersearch' method='post'>";
	$.each(json,function(key,value){
		str+="<a href='#'>";
		str+="<li id='li_insearch'>";
		
		str+="<div>";
// 		str+=json[key].SITTER_PHOTO;
		str+="<div style='float: left; border: 1px solid red; width: 250px; height: 250px;'><img class='searchimg'src ='img/"+json[key].SITTER_PHOTO+"' alt='펫시터사진입니다.'></div>";
		str+="</div>";
		str+="<div>";
		str+="<div>";
		str+="<div style='font-size: 30px;'>제목:"+json[key].SITTER_TITLE+"<br></div>";
		str+="<div style='font-size: 25px;''>이름:"+json[key].SITTER_ID+"<br></div>";
		str+="<input type='hidden' name='sitter_id' value='"+json[key].SITTER_ID+"'>";
		str+="<div style='font-size: 25px;''>내용:"+json[key].SITTER_BODY+"<br></div>";
		str+="<div style='font-size: 25px; color: #FF8000'>단가:"+json[key].SITTER_PRICE+"</div>"
// 		str+="이름:"+json[key].SITTER_ID+"<br>";
// 		str+="제목:"+json[key].SITTER_TITLE+"<br>";
// 		str+="내용:"+json[key].SITTER_BODY+"<br>";
// 		str+="가격:"+json[key].SITTER_PRICE+"<br>";
		str+="</div>";
		str+="</div>";
		
		str+="</li>";
		str+="</a>";
	});
	str+="</from>";
	$("#ul_outsearch").append(str);
	
	</script>
</body>
</html>