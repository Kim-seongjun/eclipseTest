<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 50%;
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
}
</style>
</head>
<body>
	
<!-- 	<div id="header"> -->
<%-- 		<jsp:include page="header.jsp" /> --%>
<!-- 	</div> -->
	
	<h1>예약상세페이지</h1>
	<div id='main'>
	
		<div id='show_petsitter'></div>

		<div id='pay'>
			<form action="reservation" method='post'>
			<input type="text" class='date' placeholder='예약시작일' /> <input
				type="text" class='date1' placeholder='예약종료일' /> <input
				type="submit" value='최종 예약' />
				</form>
		</div>
	</div>
	<div id="review" style="width: 1129px; height: 400px; border: 1px solid black; margin: 10, 10, 10, 10;">
	<h3>후기</h3>
	<div style="border: 1px solid black;"></div>
	</div>

	<script>
// 	var jb = jQuery.noConflict();
		/*  	$(function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']); //datepicker 한국어로 사용하기 위한 언어설정
				$('.date').datepicker({dateFormat: 'yy년 mm월 dd일',
										minDate: 0});
			});  */
	
			var start=new Date();
			console.log(start);
			console.log(start.getDate()+1);
			
			$('.date').datepicker({
				dateFormat : 'yy년 mm월 dd일',
				minDate : 0,
				onClose : function(a) {
					console.log("시작일  "+ a+49);//시작일
					$('.date1').datepicker({
						dateFormat : 'yy년 mm월 dd일',
						minDate : a,
						
					});

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
		str += "<div id='name' style='font-size: 20px'>" + json.US_NAME + " (" + json.SITTER_ID
				+ ")&nbsp;&nbsp;</div>";
		str += "<div id='addr' style='font-size: 20px'><div> ◎" + json.US_ADDRESS + "</div></div>";
		str += "</div>"
		str += "<div id='contents' style='font-size: 20px'>" + json.SITTER_BODY + "</div>";
		$("#show_petsitter").append(str);

		pay += "<input type='text' readOnly value='"+json.SITTER_PRICE+"'/>";
		$("#pay").append(pay);
	</script>
	<script>
		var json = ${json_review};
		var srt = "";
		console.log(json);
		console.log(json.res_no);
		
		$(.review).append(str);
	</script>
</body>
</html>