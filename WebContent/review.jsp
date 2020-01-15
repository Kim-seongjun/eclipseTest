<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>리뷰쓰기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
</head>

<style>
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
	margin-bottom: 20px;
}

.starR.on {
	background-position: 0 0;
}

#title {
	width: 600px;
	height: 50px;
}

#main {
	width: 600px;
	height: 200px;
}

.boxmaker {
	clear: both;
}

#text_chang1 {
	margin-bottom: 10px;
}

#text_chang2 {
	margin-bottom: 50px;
}

.button {
	width: 100px;
	height: 40px;
}

#button_check {
	margin-left: 120px;
}

#button_cancel {
	margin-left: 125px;
}

.starRev {
	margin-left: 120px;
}

#rev_div {
	position: relative;
	left: 650px;
	top: 100px;
}
</style>
<body>

	<h1 style="text-align: center; color: #36e9ce">리뷰쓰기</h1>
	<div id='rev_div'>

		<div class="starRev">
			<span class="starR on">별1</span> <span class="starR">별2</span> <span
				class="starR">별3</span> <span class="starR">별4</span> <span
				class="starR">별5</span> <span class="starR">별6</span> <span
				class="starR">별7</span> <span class="starR">별8</span> <span
				class="starR">별9</span> <span class="starR">별10</span>
		</div>

		<div id="text_chang1">
			<input type="text" id="title" class="boxmaker" placeholder='제목' />
		</div>
		<div id="text_chang2">
			<input type="text" id="main" class="boxmaker" placeholder='내용' />
		</div>

		<div class="button1">
			<div>
				<input type="submit" class="button" id="button_check" value="확인">

				<input type="submit" class="button" id="button_cancel" value="취소"
					formaction="home">
			</div>
		</div>
	</div>




	<script>
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	</script>
	<script type="text/javascript">

	</script>



	<div id="pagingNav" class="pagination"></div>

</body>
</html>