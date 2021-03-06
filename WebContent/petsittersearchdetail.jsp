<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- jQuery UI 국제화 대응을 위한 라이브러리 (다국어) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<style>
#main {
	display: flex;
}

#title {
	font-size: 30px;
	color: #696969;
	border-bottom: 1px solid black;
	width: 100%;
	padding-bottom: 20px;
	margin-bottom: 10px;
}

/* .detail_img { */
/* 	width: 500px; */
/* 	height: 300px; */
/* } */
#info {
	display: flex;
}

#addr {
	float: right;
	font-size: 13px;
	justify-content: center;
	align-items: center;
}

#show_petsitter {
	margin-right: 20px;
}

#pay {
	border: 1px solid black;
	padding: 10px;
	margin-left: 70px;
}

.date {
	margin-bottom: 10px;
	height: 25px;
}

.date1 {
	height: 25px;
}

.petname {
	height: 25px;
	margin-bottom: 10px;
}

#pet_choice {
	height: 30px;
}

#price_div {
	position: relative;
	right: 0;
}

.price {
	text-align: right;
	margin-bottom: 10px;
	height: 25px;
	border: none;
}
.review_re{
 	border-bottom: 1px solid #696969;
 	border-top: 1px solid #696969;
}
.right_x2un4 {
	float: right;
}
.header_button {
	all: unset;
	opacity: 60%;
	font-size: 20px;
	margin-top: 15px;
	cursor: pointer;
}
#logout_btn{
	all:unset;
	margin-left: 10px;
	margin-right: 10px;
	color:red;
	cursor:pointer;
}
.admin{
	all:unset;
	margin: 0 10px;
	color:red;
	cursor:pointer;
}
#apply{
 border: 2px solid #00c8b7;
 border-radius: 30px;
 color:#00c8b7;
 font-weight: bold;
 padding: 10px 20px;
 text-align: center;
 margin-right: 30px;
}

#petinsert{
	border: 2px solid #ff757f;
 	border-radius: 30px;
 	color:#ff757f;
 	font-weight: bold;
 	padding: 10px 20px;
 	text-align: center;
 	margin-right: 30px;
}
.log_id{
	all:unset;
	color:#00c8b7;
	cursor:pointer;
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
	<div id='header'>
	<form name="loginfrm" method="post">
		<a href="home"><img src="img/logo.jpg" alt="로고사진" /></a>
		<div class="right_x2un4">
<c:if test="${id!=null}">
			<input class="header_button" id="apply" type="submit" value="펫시터지원" formaction="petapply" />&nbsp;&nbsp;
				<input class="header_button" id="petinsert" type="submit" value="반려견등록" formaction="petinsertshow" />&nbsp;&nbsp
			${admin}
			
			
			<span><span class='log_id'><input type="submit" name='my_id' class='log_id' value='${id }' formaction='resshow' /></span>님 환영합니다.</span>
			
			<input id="logout_btn" type="submit" value="로그아웃" formaction="logout" />
		
			</c:if>

	</div>
	</form>
	</div>
	<h1>예약상세페이지</h1>
	<div style="position: absolute; top: 10%; left: 25%">
	<form action="reservation" method='post' style="margin-bottom: 100px; ">
		<div id='main'>

			<div id='show_petsitter'></div>
			<div id='pay'>
				<input type="text" class='date' name='start_day' readOnly placeholder='예약시작일' /> 부터 
				<input type="text" class='date1' name='end_day' readOnly placeholder='예약종료일' /> <br /> 
				반려견 : <input type="text" class='petname' id='pet' name='pet' readOnly /> 
				<input type="hidden" id='pet_no' name='pet_no' />
			</div>
		</div>
	</form>
	<div id="review" style="width: 1129px; height: 400px; margin: 10, 10, 10, 10; border-top: 1px solid #696969; ">
		<h3>후기</h3>
		<div id="div_review" style="border-bottom: 1px solid #696969; border-top: 1px solid #696969;">
		</div>
	</div>
</div>





	<script>
		$(".date1").change(function() {
			
			console.log("시작일값은 : " + $(".date").val());
			var date1 = $(".date").val().split('-');
			var date2 = "";
			date2 += date1[0];
			date2 += date1[1];
			date2 += date1[2];
			console.log("dateee1=" + date1);
			console.log("시작일=" + date2);

			var date3 = $(".date1").val().split('-');
			var date4 = "";
			date4 += date3[0];
			date4 += date3[1];
			date4 += date3[2];
			console.log("종료일=" + date2);

			var date = date4 - date2;
			console.log("차=" + date);
			//var max = $("#f_pirce").val() * date;
			console.log("합=" + $("#1_price").val()*date);
			$("#f_pirce").val($("#1_price").val()*date);
			
		}); // end
	</script>

	<script>
		var json_pet = ${json_pet};
		console.log("json_pet =" + json_pet);
		console.log("-----------------------------");

		var str1 = "";
		str1 += "<select id='pet_choice'>";
		$.each(json_pet, function(key, val) {
			console.log("json_pet = " + json_pet[key].PET_NAME);
			console.log("json_pet = " + json_pet[key].PET_NO);
			str1 += "<option value="+json_pet[key].PET_NO+">"
					+ json_pet[key].PET_NAME + "</option>";

		});
		str1 += "</select> <br />";

		$("#pay").append(str1);

		$("#pet_choice").change(function() {
			$("#pet_choice option:selected").each(function() {
				$("#pet").val($(this).text()); //선택값 입력 
				$("#pet_no").val($(this).val()); //선택값 입력 
			});
		});

		$('.date').datepicker({
			dateFormat : 'yy-mm-dd',//날짜타입
			changeYear:true,		//년 선택
			changeMonth: true,		//월 선택
			minDate : 0,			//오늘날짜부터 선택가능
			onClose : function(selectedDate) {
				console.log("시작일  " + selectedDate);//시작일
				$(".date1").datepicker( "option", "minDate", selectedDate ); //시작일을 받은후 .dat1의 mindate에 시작일을 지정
			}
		});
		$('.date1').datepicker({
			dateFormat : 'yy-mm-dd',
			changeYear:true,
			changeMonth: true,
			onClose : function(selectedDate) {
				console.log("종료일  " + selectedDate);//시작일
			 $(".date").datepicker( "option", "maxDate", selectedDate );
			}
		});

		var json = ${json_detail};
		var str = "";
		var pay = "";
		console.log(json);
		console.log(json.SITTER_TITLE);
		str += "<div id='title'>" + json.SITTER_TITLE + "</div>";
		str += "<div><img style='width: 500px; height: 300px;' id='detail_img' src='img/"+json.SITTER_PHOTO+"' alt='펫시터 이미지입니다.' /></div>";
		str += "<div id='info'>"
		str += "<div id='name' style='font-size: 20px'>" + json.US_NAME + " ("+ json.SITTER_ID + ")&nbsp;&nbsp;</div>";
		str += "<div id='addr' style='font-size: 20px'><div> ◎"+ json.US_ADDRESS + "</div></div>";
		str += "</div>"
		str += "<div id='contents' style='font-size: 20px'>" + json.SITTER_BODY	+ "</div>";
		
		$("#show_petsitter").append(str);
		
		pay += "<div id='price_div'>";
		pay += "1박 : <input type='text' style='width:330px' id='1_price' class='price' readOnly value='"+json.SITTER_PRICE+"'/>원<br />";
		pay += "최종 금액 : <input type='text' style='width:285px'  id='f_pirce' class='price'  name='price' readOnly value='"+json.SITTER_PRICE+"'/>원";
		pay += "</div>";
		pay += "<input type='submit' value='최종 예약' class='hang'/>";
		pay += "<input type='hidden' name='sit_id' value='"+json.SITTER_ID+"' />";
		pay += "<input type='hidden' name='sit_addr' value='"+json.US_ADDRESS+"' />";

		$("#pay").append(pay);
	</script>

	<script>
 		var json = ${json_review};
 		
 		var rev = "";
 		
 		$.each(json,function(key, value){
 			console.log(json[key].RES_TITLE);
 			console.log(json[key].RES_CONT);
 			console.log(json[key].RES_POINT);
 			console.log(json[key].US_NAME);
 			
 			rev += "<div class ='review_re'>";
 	 		rev += "<b style='font-size: 20px;'>"+json[key].RES_TITLE+"</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+json[key].US_NAME+"<br>";
 	 		rev += "별점 : "+ json[key].RES_POINT+"<br>";
 	 		rev += "내용 : "+ json[key].RES_CONT+"<br>";
 	 		rev += "</div >"
 			
 		});
		
		
 		$('#div_review').append(rev);
 		
 		
 		$(".hang").click(
				function() {
					if ($(".date").val() == "") {
						alert("시작일을 설정해주세요.");
						$(".hang").prop("type", "button");
						
					} else if ($(".date1").val() == "") {
						alert("종료일을 설정해주세요.");
						$(".hang").prop("type", "button");
					}
					
					else if ($(".petname").val() == "") {
						var pet=confirm("반려견을 등록해주세요.");
						$(".hang").prop("type", "button");
						if(pet){
							location.href="petinsertshow";
						}
					}
					else{
						alert("요청에 성공하셧습니다.");
						$(".hang").prop("type","submit");
						
					}
					
				});
					
					
	</script>
</body>
</html>