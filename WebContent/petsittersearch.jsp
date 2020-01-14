<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		display:inline-block;
		width: 100%;
		border: 1px solid #fbbe53 ;
		
	}
	.searchli{
		float: left;
		list-style: none;
		font-size: 30px;
		border-right:1px solid #fbbe53;
		
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
		text-align: left;
		width: 700PX;
		border: 1px solid black;
	}
	.searchli:hover{
		background: #696969;
	}
	
	.searchimg{
		width: 250px;
		height: 250px;
	}
	.sub{
		font-size: 20px;
		color:#7d7d7d;
	}
	.btn_{
		float:right;
		margin-right: 10px;
	}
	.btn{
		all:unset;
		color:#FF8000;	
		cursor:pointer;
		border:1px solid #FF8000;
		border-radius: 15px;
		padding:10px 20px;
		margin-top: 20px;
	}
.reg{
	all:unset;
	color:#FF8000;
	padding-right: 15px;
	margin-bottom:15px;
	cursor:pointer;
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
	
	
	<form action="petsittersearch" method="post">
	<div id="div_outsearchmain">
		<div id="div_insearchmain" style="background-color: #f5f5f5; border-radius: 10px">
			<ul id='hover'>
				<li class="searchli">
					<input type="submit" name='region' class='reg'  value='전체'/>
				</li>
				<li class="searchli">
					<input type="submit" name='region' class='reg'  value='서울'/>
				</li>
				<li class="searchli">
					<input type="submit" name='region' class='reg'  value='경기'/>
				</li>
				<li class="searchli">
					<input type="submit" name='region' class='reg'  value='인천'/>
				</li>
			</ul>
		</div>
	</div>
	</form>
	
	<ul id="ul_outsearch">

	</ul>
	
	<script>
	
	//console.log("id="+${id});
	var json=${json_search}
	console.log(json);
	var str = "";
	$.each(json,function(key,value){
	str+="<form id='frm' action= 'petsitterdetail' method='post' onsubmit='return check()'>";
		//str+="<a href='#' onclick='actfrm()'>";
		str+="<li id='li_insearch'>";
		
		str+="<div>";
// 		str+=json[key].SITTER_PHOTO;
		str+="<div style='float: left; border: 1px solid black; width: 250px; height: 250px;'><img class='searchimg'src ='img/"+json[key].SITTER_PHOTO+"' alt='펫시터사진입니다.'></div>";
		str+="</div>";
		str+="<div>";
		str+="<div>";
		str+="<div style='font-size: 30px;color:#696969;'>"+json[key].SITTER_TITLE+"<br></div>";
		str+="<div class='sub'>이름:"+json[key].SITTER_NAME+"<br></div>";
		str+="<input type='hidden' name='petsitter_id' value='"+json[key].SITTER_ID+"'/>";

		str+="<div class='sub'>주소:"+json[key].US_ADDRESS+"<br></div>";
		str+="<div style='font-size: 25px; color: #FF8000'>단가:"+json[key].SITTER_PRICE+"</div>"
// 		str+="이름:"+json[key].SITTER_ID+"<br>";
// 		str+="제목:"+json[key].SITTER_TITLE+"<br>";
// 		str+="내용:"+json[key].SITTER_BODY+"<br>";
// 		str+="가격:"+json[key].SITTER_PRICE+"<br>";
		str+="</div>";
		str+="<div class='btn_'><input type='submit'  value='예약'  class='btn'/></div>";
		str+="</div>";
		
		str+="</li>";
		//str+="</a>";
	str+="</form>";
	});
	function check(){
		<%
    	
    	if(session.getAttribute("id")==null){
    	%>
    	alert("로그인 후 사용가능합니다.");
    	return false;
    	<%}else {%>
		return 'petsitterdetail';
		<%}%>
	}
	$("#ul_outsearch").append(str);
	
 	
 	    $(".btn").click(function(){
	    	
	    	/*if($(".btn").prop("button")){
			   
	    		alert("로그인 후 사용가능합니다.");
			   
	    	}*/
	   }); 
			    
	
	
	
/*  	function actfrm() {

		$("#frm").submit();
		
	} */
 	

	
	</script>
</body>
</html>