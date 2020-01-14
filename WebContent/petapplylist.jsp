<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫시터지원자 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#petsitter {
	border: 1px solid black;
	margin-bottom: 20px;
	width: 1400px;
	display: flex;
}

#p_text {
	display: block;
	font-weight: bolder;
}

.img_file {
	height: 410px;
	width: 410px;
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
</head>

<body>
<header>

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		</header>
	<h1>펫시터지원자리스트 페이지</h1>

	<c:if test="${json_plist==null}">
		<div>지원자가 존재하지 않습니다.</div>
	</c:if>

	<div id='test'>
		<c:if test="${json_plist!=null}">

		</c:if>
	</div>

	<script>
		var json = ${json_plist};
		console.log(json.length);
		console.log("--------------");
		var str = "";

		$
				.each(
						json,
						function(key, value) {
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

							str += "<div>1. 반려견을 키워본 경험이 있나요?(얼마나 키웠는지,현재 키우고 있는지 상세하게 기제)</div>";
							str += "<div>" + json[key].questions1 + "</div>";

							str += "<div>2. 반려동물 관련 자격증을 소지하고 계신가요?</div>";
							str += "<div>" + json[key].questions2 + "</div>";

							str += "<div>3. 펫시터 경험이 있나요?(개인/타업체)</div>";
							str += "<div>" + json[key].questions3 + "</div>";

							str += "<div>4. 어느정도 크기의 강아지까지 돌봄이 가능하신가요?</div>";
							str += "<div>" + json[key].questions4 + "</div>";

							str += "<div>5. 펫시터 활동 중 강아지가 경계하거나 이빨을 보이며 공격하려 하는 경우 어떻게 대처하시겠습니까?</div>";
							str += "<div>" + json[key].questions5 + "</div>";

							str += "<div>6. 본인이 강아지와 산책할 떄 가장 중요하게 생각하는 부분에 대해 설명해주세요.</div>";
							str += "<div>" + json[key].questions6 + "</div>";

							str += "<div>7. 마지막으로 하고싶으신 말을 자유롭게 작성해주세요.</div>";
							str += "<div>" + json[key].questions7 + "</div>";

							//버튼
							str += "<input type='submit' value='승인' />";
							str += "<input type='submit' value='거절' formaction='deleteapply' />";
							str += "</div>";
							str += "</div>";
							str += "</form>";

						});

		$("#test").append(str);
	</script>
</body>
</html>