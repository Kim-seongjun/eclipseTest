<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전체회원리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
div.table {
	border: 3px solid;
	border-collapse: collapse;
	width:1700px;
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
#mid{
	margin-top:13px;
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




	<script>
		var json = ${json_ulist};
		console.log(json);
		console.log("--------------");
		var str = "";
		str += "<form action='black' method='post'>";

		str += "<div class='table'>";
		str += "<div class='td' style='width:100px'>회원 아이디</div>";
		str += "<div class='td' style='width:100px'>이름</div>";
		str += "<div class='td' style='width:100px'>성별</div>";
		str += "<div class='td'>생년월일</div>";
		str += "<div class='td'>전화번호</div>";
		str += "<div class='td'>이메일</div>";
		str += "<div class='td' style='width:400px'>주소</div>";
		str += "<div class='td'>블랙리스트 여부</div>";
		str += "<div class='td' style='width:100px'>회원구분</div>";
		str += "<div class='td' style='width:100px'>블랙버튼</div>";
		str += "<div class='boxmaker'></div>";

		$.each(json,function(key, value) {

							str += "<form action='black' method='post'>";
						
							str += "<div class='td' style='width:100px'>" + json[key].id + "</div>";
							str += "<div class='td' style='width:100px'>" + json[key].name + "</div>";
							str += "<div class='td' style='width:100px'>"+json[key].gender+ "</div>";
							str += "<div class='td'>"+json[key].birth+"</div>";
							str += "<div class='td'>"+json[key].tel+"</div>";
							str += "<div class='td'>"+json[key].mail+"</div>";
							str += "<div class='td' style='width:400px'>"+json[key].addr+"</div>";
							str += "<div class='td' >"+json[key].blacklist+"</div>";
							str += "<div class='td'  style='width:100px'>"+json[key].type+"</div>";

							str += "<div class='td' style='width:100px'><input type='submit' id='mid' value='블랙'/></div>";
							str += "<div><input type='hidden' name='sit_id' value='"+json[key].id+"'/></div>";
							str += "<div class='boxmaker'></div>";
							str += "</form>";

						});
		str += "</table>";
							

		$("#asd").append(str);
		
		
		function noveldetaillist() { //처음 시작시 DB에 갔다와 게시물 보여주는 메소드
		      $.ajax({
		         url : "noveldetaillist",
		         type : "post",
		         data : {"novelNum" : $("#novelNum").val()},
		         dataType : 'json',
		         success : function(data) {
		            json = data;
		            paidCheck();
		            novelDetailListShow(json, 1, paid);
		            pageNum(json);

		         },
		         error : function(error) {
		            alert(error);
		            console.log(error);
		         }
		      }); // ajax End
		   }
		
		function pageNum(json) { // 페이지 넘버 보여주는 함수
		      var totalpage;

		      totalPages = json.length / 15;
		      if (json.length / 15 > 0) {
		         totalPages++;
		      }
		      maxindex = Math.floor(totalPages);
		      var str2 = "";
		      str2 += "<ul class='pagination justify-content-center'>";
		      str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
		            + 0 + ")'>Previous</a></li>";

		      for (var k = 1; k < totalPages; k++) {
		         str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
		               + k + ")'>" + k + "</a></li>";
		         str2 += "<input type='hidden' class='page' value='" + k + "'>";
		      }
		      str2 += "<li class='page-item'><a class='page-link' onclick='newpage("
		            + -1 + ")'>Next</a></li></ul>";
		      str2 += "</ul>";

		      $("#paging").html(str2);

		   }
		
		function newpage(num) { // 페이지 이전, 다음 버튼 누를시 이동 제어하는 함수

		      if (num === 0) {
		         if (index == 1) {
		            novelDetailListShow(json, 1, paid);
		         } else {
		            novelDetailListShow(json, index - 1, paid);
		         }
		      } else if (num === -1) {
		         console.log(maxindex);
		         if (index == maxindex) {
		            novelDetailListShow(json, maxindex, paid);
		         } else {
		            novelDetailListShow(json, index + 1, paid);
		         }
		      } else {
		         novelDetailListShow(json, num, paid);
		      }
		   }
		 
	</script>
	
</body>
</html>