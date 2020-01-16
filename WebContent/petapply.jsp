<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>펫시터지원</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
 #header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
} 
#apply_main {
	background: rgba(204, 204, 204, 0.25);
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 50%;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.result {
	border-left: none;
	border-top: none;
	border-right: none;
	width: 90%;
	height: 50px;
	margin-left: 10px;
}

.questions {
	all: unset;
	width: 90%;
	margin-bottom: 10px;
	margin-left: 10px;
}

.btn {
	all: unset;
	width: 150px;
	height: 50px;
	padding: 10px 20px;
	margin-right: 20px;
	background-color: #36e9ce;
	color: white;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	border-radius: 20px;
	cursor: pointer;
}

.btn_pos {
	text-align: center;
}

.profile_q {
	margin-bottom: 10px;
	margin-left: 10px;
}

.profile_r {
	border-left: none;
	border-top: none;
	border-right: none;
	margin-left: 10px;
	width: 90%;
	height: 50px;
}
/* #div_main{
	position: absolute;
	top:70px;
} */
</style>
</head>
<body>

	<header>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
	</header>
	
	
	<h1 style="text-align: center; margin-top:70px; color: #36e9ce">펫시터 지원 신청서</h1>
	<div id='apply_main'></div>




	<script>
		var json = ${jsontest};
		var str = "";

		str += "<form method='post'>";
		str += "<div class='profile_q'>메인 제목을 입력해주세요.(프로필)</div>";
		str += "<input type='text' id='title' name='title' class='profile_r'/><br />";
		str += "<div class='profile_q' >자신의 소개를 간략하게 입력해주세요.(프로필)</div>";
		str += "<input type='text' id='main' name='cont' class='profile_r'/><br />";
		str += "<div class='profile_q'>희망 단가(프로필, 기본 1박/20,000원)</div>";
		str += "<input type='text' name='price' id='price' style='margin-left: 10px'/>원";
		str += "<select id='pirce_sel'>";
		str += "<option>20000</option>";
		str += "<option>30000</option>";
		str += "<option>40000</option>";
		str += "</select>";
		str += "<div class='profile_q'>이미지 업로도(프로필)</div>";
		str += "<input type='file' id='imgf' name='imgFile' class='profile_r'/><br /><br /><br /><br /><br /><br />";
		str += "<div class='profile_q'>펫시터 설문</div><br /><br /><br /><br /><br /><br />";

		for (var i = 0; i < json.length; i++) {
			str += "<input type='text' value='"+json[i]+"' readOnly class='questions'/><br />";
			str += "<input class='result' id='qus" + (i + 1)
					+ "' name='questions" + (i + 1) + "' type='text' /><br />";
			console.log(json[i]);
		}

		str += "<div>본 지원자는 상기 답변 내용에 거짓이 없음을 확인 후 설문을 완료합니다."
				+ "사실과 다른 기재로 인한 불미스어운 모든 상황에 대해 당사는 책임이 없음을 안내드립니다.</div>";
		str += "<input type='radio' name='yes' value='예' class='check' /> 예 <br />";
		str += "<div class='btn_pos'>";
		str += "<input type='submit' value='제출' formaction='insetpetapply' class='btn' id='hag'/>";
		str += "<input type='submit' value='취소' formaction='home' class='btn'/>";
		str += "</div>";
		str += "</form>";
		$("#apply_main").append(str);
		console.log("str=" + str);

		$(document).ready(function() {
			$("#price").attr("readOnly", true);
		});

		$("#pirce_sel").change(function() {
			$("#pirce_sel option:selected").each(function() {
				if ($(this).val() == '1') {
					$("#price").val('');
					$("#price").attr("readOnly", true);
				} else {
					$("#price").val($(this).text()); //선택값 입력 
					$("#price").attr("readOnly", true); //비활성화
				}
			});
		});

		$("#hag")
				.click(
						function() {
							if ($("#title").val() == "") {
								alert("프로필제목을 작성해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#main").val() == "") {
								alert("프로필메인을 작성해주세요.");
								$("#hag").prop("type", "button");
							}

							else if ($("#price").val() == "") {
								alert("금액을 설정해주세요!");
								$("#hag").prop("type", "button");
							}

							else if ($("#imgf").val() == "") {
								alert("사진을 골라주세요.");
								$("#hag").prop("type", "button");
							}

							else if ($("#qus1").val() == "") {
								alert("질문1을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus2").val() == "") {
								alert("질문2을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus3").val() == "") {
								alert("질문3을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus4").val() == "") {
								alert("질문4을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus5").val() == "") {
								alert("질문5을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus6").val() == "") {
								alert("질문6을 확인해주세요.");
								$("#hag").prop("type", "button");
							} else if ($("#qus7").val() == "") {
								alert("질문7을 확인해주세요.");
								$("#hag").prop("type", "button");
							}

							else if ($("input:radio[name='yes']").is(":checked") == false) {
								alert("체크를 해주세요.");
								$("#hag").prop("type", "button");
							}
							else{
								alert("요청에 성공하셧습니다.");
								$("#hag").prop("type","submit");
								
							}

						
						});
	</script>

</body>
</html>