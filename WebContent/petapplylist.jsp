<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫시터지원자 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
#petsitter {
	border: 1px solid black;
	margin-bottom: 20px;
	width: 1400px;
	display: flex;
	margin-left:10%;
}

#p_text {
	display: block;
	font-weight: bolder;
}

.img_file {
	height: 475px;
	width: 475px;
}

#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}



#asd {
	position: relative;
	top: 50px;
	
/* 	margin-left: 5%; */
}

#asd2 {
	position: relative;
	top: 50px;
}

h1 {
	margin-top: 100px;
}
</style>
</head>

<body>
	<header>

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
	</header>
	
	<h1 style="text-align: center; color: #36e9ce">펫시터지원자리스트 페이지</h1>

	<c:if test="${json_plist==null}">
		<div>지원자가 존재하지 않습니다.</div>
	</c:if>

	<div id="asd"></div>
	<div id="asd2"></div>
	

	<script>
		var json = ${json_plist	};
		console.log(json.length);
		console.log("--------------");

		window.onload = pageAll(json, 1);
		var index;
		function pageAll(json, num) {
			var str = "";

			index = num;

			for(var key=(num-1)*3;key<(num*3);key++) {
				if(key<json.length){
								str += "<form action='petsitterappr' method='post'>";

								console.log(json[key]);
								str += "<div id='petsitter'>";
								str += "<div id='img_div'>";
								str += "<div>";
								str += "<img class='img_file' src='img/"+json[key].imgFile+"' alt='펫시터프로필사진' />";
								str += "</div>";
								str += "</div>";

								//텍스트만
								str += "<div id='p_text'>";
								str += "<div>"
										+ "ID : "
										+ json[key].id
										+ "<input type='hidden' name='sit_id' value='"+json[key].id+"' />";
								str += "</div>";
								str += "<div>" + "제목 : " + json[key].title
										+ "</div>";
								str += "<div>" + "내용 : " + json[key].cont
										+ "</div>";
								str += "<div>" + "가격: " + json[key].price
										+ "</div>";

										str += "<div>" + json[key].questions1 + "</div>";
										str += "<div>"+json[key].answer1+"</div>";

										str += "<div>" + json[key].questions2 + "</div>";
										str += "<div>"+json[key].answer2+"</div>";

										str += "<div>" + json[key].questions3 + "</div>";
										str += "<div>"+json[key].answer3+"</div>";

										str += "<div>" + json[key].questions4 + "</div>";
										str += "<div>"+json[key].answer4+"</div>";

										str += "<div>" + json[key].questions5 + "</div>";
										str += "<div>"+json[key].answer5+"</div>";

										str += "<div>" + json[key].questions6 + "</div>";
										str += "<div>"+json[key].answer6+"</div>";

										str += "<div>" + json[key].questions7 + "</div>";
										str += "<div>"+json[key].answer7+"</div>";
			
								//버튼
								str += "<input type='submit' value='승인' />";
								str += "<input type='submit' value='거절' formaction='deleteapply' />";
								str += "</div>";
								str += "</div>";
								str += "</form>";
				}
				else{
					str += "<form action='black' method='post'>";
					str += "</form>";
				}

							};

			
			$("#asd").html(str);
			pageNum(json);
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