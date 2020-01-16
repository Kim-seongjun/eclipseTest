<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예약상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
/*  div.table { */
/* 	border: 3px solid; */
/* 	position: absolute; */
/* 	width: 1700px; */
/* }  */

div.td {
	border: 1px solid;
	width: 200px;
	height: 50px;
	float: left;
	box-sizing: border-box;
	/* line-height: 50px;  */
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
h1{
	margin-top: 100px;
}
#asd {
	position: relative;
	top: 50px;
	margin-left: 150px;
}

#asd2 {
	position: relative;
	margin-top: 100px;
}

.hid {
	display: none;
}


</style>
</head>
<body>
	<header>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
	</header>
	<h1 style="text-align: center; color: #36e9ce">예약상세</h1>
	<div id='asd'></div>
	<div id='asd2'></div>









	<script>
		var json = ${json_res};
		console.log(json);
		console.log(json.length);
		console.log("--------------");
		
		window.onload=pageAll(json,1);
			var index;
	
	function pageAll(json,num) {
		var str = "";
		index=num;
		str += "<div class='table'>";
		str += "<div class='td'>예약번호</div>"
		str += "<div class='td'>아이디</div>"
		str += "<div class='td'>펫시터아이디</div>"
		str += "<div class='td'>반려견이름</div>"
		str += "<div class='td'>예약시작일</div>"
		str += "<div class='td'>예약종료일</div>"
		str += "<div class='td'>총금액</div>"
		str += "<div class='td' style='width:100px'>리뷰쓰기</div>"
		str += "<div class='td' style='width:100px'>예약취소버튼</div>"
		str += "<div class='boxmaker'></div>";
		
		
		for(var i=(num-1)*10;i<(num*10);i++) {
			if(i<json.length){
	
							str += "<form action='black' method='post'>";
					
							str += "<div class='td'>" + json[i].RES_NO+ "</div>";
							str += "<div class='td'>" + json[i].US_ID+ "</div>";
							str += "<div class='td'>" + json[i].SITTER_ID+ "</div>";
							str += "<div class='td'>" + json[i].PET_NAME+ "</div>";
							str += "<div class='td'>" + json[i].RES_DATE_FR+ "</div>";
							str += "<div class='td'>" + json[i].RES_DATE_TO+ "</div>";
							str += "<div class='td'>" + json[i].RES_PRICE+ "</div>";
							str += "<input type='hidden' name ='res_no' value='"+json[i].RES_NO+"' />";
							str += "<div class='td' style='width:100px'><input type='submit'  value='리뷰쓰기' formaction='goreview'/></div>";
							str += "<div class='td' style='width:100px'><input type='submit'  value='예약취소' formaction='rescancel'/></div>";
							str += "<div class='boxmaker'></div>";
								
							str += "</form>";
			}else{
				str += "<form action='black' method='post'>";
				
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<div class='td'></div>";
				str += "<input type='hidden' name ='res_no' value='' />";
				str += "<div class='td' style='width:100px'></div>";
				str += "<div class='td' style='width:100px'></div>";
				str += "<div class='boxmaker'></div>";
					
				str += "</form>";
			}};
		
		str += "</div>";
	
$("#asd").html(str);
		
		$(".hid").hide();
		
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