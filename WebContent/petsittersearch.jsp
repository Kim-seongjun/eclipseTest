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
					<a href="" style="text-decoration: none; text-shadow: 0 0 24px " >전체&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="" style="text-decoration: none; text-shadow: 0 0 24px">서울&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="" style="text-decoration: none; text-shadow: 0 0 24px">경기&nbsp;<span>쿼리문</span></a>&nbsp;&nbsp;
				</li>
				<li class="searchli">
					<a href="" style="text-decoration: none; text-shadow: 0 0 24px">인천&nbsp;<span>쿼리문</span></a>
				</li>
			</ul>
		</div>
	</div>
	
	
	<ul id="ul_outsearch">
		<li id="li_insearch">
			<div>
				<div style="float: left; border: 1px solid red; width: 250px; height: 250px;">이미지 넣는곳</div>
			</div>
			<div>
				<div>프로필 넣는곳</div>
			</div>
		</li>
		<li id="li_insearch">
			<div>
				<div style="float: left; border: 1px solid red; width: 250px; height: 250px;">이미지 넣는곳</div>
			</div>
			<div>
				<div>프로필 넣는곳</div>
			</div>
		</li>
		<li id="li_insearch">
			<div>
				<div style="float: left; border: 1px solid red; width: 250px; height: 250px;">이미지 넣는곳</div>
			</div>
			<div>
				<div>프로필 넣는곳</div>
			</div>
		</li>
		<li id="li_insearch">
			<div>
				<div style="float: left; border: 1px solid red; width: 250px; height: 250px;">이미지 넣는곳</div>
			</div>
			<div>
				<div>프로필 넣는곳</div>
			</div>
		</li>
	</ul>
</body>
</html>