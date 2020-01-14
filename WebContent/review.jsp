<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���侲��</title>
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

#button_check{
margin-left: 120px;

}

#button_cancel{
margin-left: 125px;

}
 
.starRev{
margin-left:120px;
}

#rev_div{
	position: relative;
	left:650px;
	top:100px;
	
}




</style>
<body>

	<h1 style="text-align: center; color: #36e9ce">���侲��</h1>
	<div id='rev_div'>

		<div class="starRev">
			<span class="starR on">��1</span> <span class="starR">��2</span> 
			<span class="starR">��3</span> <span class="starR">��4</span> 
			<span class="starR">��5</span> <span class="starR">��6</span> 
			<span class="starR">��7</span> <span class="starR">��8</span> 
			<span class="starR">��9</span> <span class="starR">��10</span>
		</div>

		<div id="text_chang1">
			<input type="text" id="title" class="boxmaker" placeholder='����' />
		</div>
		<div id="text_chang2">
			<input type="text" id="main" class="boxmaker" placeholder='����' />
		</div>

	<div class="button1">
		<div>
			<input type="submit" class="button" id="button_check" value="Ȯ��">
		
			<input type="submit" class="button" id="button_cancel" value="���"
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
</body>
</html>