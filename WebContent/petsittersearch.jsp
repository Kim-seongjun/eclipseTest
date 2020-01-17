<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script><style>
	#div_outsearchmain{
		text-align: center;
		border: 1px;
		padding: 20px;
		margin: 15px;
		margin-top: 70px;
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
		margin-bottom: 20px;
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
.span_avg{
	color:#ff8000;
}
#asd {
	position: relative;
	top: 50px;
 	margin-left: 32%; 
}

#asd2 {
	position: relative;
	top: 50px;
}

#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
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

	<div id="asd"></div>
	<div id="asd2"></div>
	
	
	<script>
	
	var json_avg=${json_avg};
	console.log(json_avg);
	//console.log("id="+${id});
	
	var json=${json_search};
	console.log(json);
	console.log(json.length);
	
	window.onload = pageAll(json, 1);
	var index;
	function pageAll(json, num) {
		var str = "";

		index = num;
		
		for(var i=(num-1)*3;i<(num*3);i++) {
			if(i<json.length){
	str+="<form id='frm' action= 'petsitterdetail' method='post' onsubmit='return check()'>";
		str+="<li id='li_insearch'>";
		
		str+="<div>";
		str+="<div style='float: left; border: 1px solid black; width: 250px; height: 250px;'><img class='searchimg'src ='img/"+json[i].SITTER_PHOTO+"' alt='펫시터사진입니다.'></div>";
		str+="</div>";
		str+="<div>";
		str+="<div>";
		str+="<div style='font-size: 30px;color:#696969;'>"+json[i].SITTER_TITLE+"<br></div>";
		str+="<div class='sub'>이름:"+json[i].SITTER_NAME+"<span class='span_avg'>(평점 : "+json_avg[i].AVG_POINT+")</span><br></div>";
		str+="<input type='hidden' name='petsitter_id' value='"+json[i].SITTER_ID+"'/>";

		str+="<div class='sub'>주소:"+json[i].US_ADDRESS+"<br></div>";
		str+="<div style='font-size: 25px; color: #FF8000'>단가:"+json[i].SITTER_PRICE+"</div>"
		str+="</div>";
		str+="<div class='btn_'><input type='submit'  value='예약'  class='btn'/></div>";
		str+="</div>";
		
		str+="</li>";
		//str+="</a>";
	str+="</form>";
			}
			else{
				str += "<form action='black' method='post'>";
				str += "</form>";
			}
				
	};
	
	//$("#ul_outsearch").html(str);
	
	   $("#asd").html(str);
		pageNum(json);
	}
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
	
 	
 
	   
	   
		
		
	
	var index;
	function pageNum(json) { // 페이지 넘버 보여주는 함수
		var totalpage;

		totalPage = json.length / 3;
		if (json.length / 3 > 0) {
			totalPage++;
		}
		maxindex = Math.floor(totalPage);
		var str2 = "";
		str2 += "<ul class='pagination justify-content-center'>";
		str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
				+ 0 + ")'>Previous</a></li>";

		for (var k = 1; k < totalPage; k++) {
			str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
					+ k + ")'>" + k + "</a></li>";

			str2 += "<input type='hidden' class='page' value='" + k + "'>";
		}
		str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
				+ -1 + ")'>Next</a></li></ul>";
		str2 += "</ul>";
		$("#asd2").html(str2);
	}

	
	function newpage(num) { // 페이지 이전, 다음 버튼 누를시 이동 제어하는 함수
		if (num === 0) {
			if (index == 1) {
				pageAll(json, 1);
			} else {
				pageAll(json, index - 1);
			}
		} else if (num === -1) {
			console.log(maxindex);
			if (index == maxindex) {
				pageAll(json, maxindex);
			} else {
				pageAll(json, index + 1);
			}
		} else {
			pageAll(json, num);
		}
	}
	
	
	</script>
</body>
</html>