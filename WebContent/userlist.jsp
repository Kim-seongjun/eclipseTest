<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전체회원리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
div.table {
	border: 3px solid;
	border-collapse: collapse;
	width:1900px;
}

div.td {
	border: 1px solid;
	width: 200px;
	height: 50px;
	float: left;
	box-sizing: border-box;
	line-height: 50px;
	text-align: center;
}

div.boxmaker {
	clear: both;
}
#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}

 #asd{
	position: relative;
	top:50px;
	
} 
 #asd2{
	position: relative;
	top:50px;
	
} 

</style>
</head>
<body>
<header>

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		</header>
		
	<h1>전체회원리스트</h1>
	
	<div id='asd'></div>
	<div id='asd2'></div>



	<script>
		var json = ${json_ulist};
		console.log(json);
		console.log("--------------");
		window.onload=pageAll(json,1);
 			var index;
		
		
		function pageAll(json,num) {
			var str = "";
			index=num;
			
			str += "<div class='table'>";
			str += "<div class='td' style='width:100px'>회원 아이디</div>";
			str += "<div class='td' style='width:100px'>이름</div>";
			str += "<div class='td' style='width:100px'>성별</div>";
			str += "<div class='td'>생년월일</div>";
			str += "<div class='td'>전화번호</div>";
			str += "<div class='td'>이메일</div>";
			str += "<div class='td' style='width:500px'>주소</div>";
			str += "<div class='td'>블랙리스트 여부</div>";
			str += "<div class='td' style='width:100px'>회원구분</div>";
			str += "<div class='td' style='width:150px'>블랙버튼</div>";
			str += "<div class='boxmaker'></div>";

			for(var i=(num-1)*10;i<(num*10);i++) {

								str += "<form action='black' method='post'>";
							
								str += "<div class='td' style='width:100px'>" + json[i].id + "</div>";
								str += "<div class='td' style='width:100px'>" + json[i].name + "</div>";
								str += "<div class='td' style='width:100px'>"+json[i].gender+ "</div>";
								str += "<div class='td'>"+json[i].birth+"</div>";
								str += "<div class='td'>"+json[i].tel+"</div>";
								str += "<div class='td'>"+json[i].mail+"</div>";
								str += "<div class='td' style='width:500px'>"+json[i].addr+"</div>";
								str += "<div class='td' >"+json[i].blacklist+"</div>";
								str += "<div class='td'  style='width:100px'>"+json[i].type+"</div>";
								str += "<div class='td' style='width:150px'><input type='submit'  id='mid' value='블랙'/></div>";
								str += "<div><input type='hidden' name='sit_id' value='"+json[i].id+"'/></div>";
								str += "<div class='boxmaker'></div>";
								str += "</form>";

							};
			str += "</table>";
			$("#asd").html(str);	
			 pageNum(json);
		}//END 
		 
		
		
		
		 var index;
		function pageNum(json) { // 페이지 넘버 보여주는 함수
		      var totalpage;

		      totalPage = json.length / 10;
		      if (json.length / 10 > 0) {
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