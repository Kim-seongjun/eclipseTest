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

/* input[type="radio"]{
	display: none;
}  */

/* input[type="radio"] + label span{
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
input[type="checkbox"]:checked + label span{
 background-position: 0 0;
} */
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

	<h1 style="text-align: center; color: #36e9ce">리뷰쓰기</h1>
	<form action="reviewinsert">
	<div id='rev_div'>

		<div class="starRev">
			<input id="s1" class='test' type="radio" name='rev_poient' value='1' checked/>
			<label for="s1"><span class="starR on"></span></label>
			
			<input id="s2" class='test' type="radio" name='rev_poient' value='2'/>
			<label for="s2"><span class="starR"></span> </label>
			
			<input id="s3" class='test' type="radio" name='rev_poient' value='3'/>
			<label for="s3"><span class="starR"></span></label>
			 
			<input id="s4" class='test' type="radio" name='rev_poient' value='4'/>
			<label for="s4"><span class="starR"></span> </label>
			
			<input id="s5" class='test' type="radio" name='rev_poient' value='5'/>
			<label for="s5"><span class="starR"></span> </label>
			
			<input id="s6" class='test' type="radio" name='rev_poient' value='6'/>
			<label for="s6"><span class="starR"></span> </label>
			
			<input id="s7" class='test' type="radio" name='rev_poient' value='7'/>
			<label for="s7"><span class="starR"></span> </label>
			
			<input id="s8" class='test' type="radio" name='rev_poient' value='8'/>
			<label for="s8"><span class="starR"></span> </label>
			
			<input id="s9" class='test' type="radio" name='rev_poient' value='9'/>
			<label for="s9"><span class="starR"></span> </label>
			
			<input id="s10" class='test' type="radio" name='rev_poient' value='10'/>
			<label for="s10"><span class="starR"></span></label>
			
		</div>

		<div id="text_chang1">
			<input type="text" id="title" class="boxmaker" name='rev_title'  placeholder='제목' />
		</div>
		<div id="text_chang2">
			<input type="text" id="main" class="boxmaker" name='rev_cont' placeholder='내용' />
		</div>

	<div class="button1">
		<div>
			<input type="submit" class="button" id="button_check" value="확인">
		
			<input type="submit" class="button" id="button_cancel" value="취소"
				formaction="home">
		</div>
	</div>
</div>
</form>




	<script>
	
	/*  	$('.starRev span').click(function() {
			//cosole.log("this="+this);
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});  */
	</script>
</body>
</html>