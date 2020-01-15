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
<<<<<<< HEAD

} 
=======
}
>>>>>>> 8b2f2023dfb4c92556836c2262123a0c04fd2a91

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
	<form action="reviewinsert">
	<div id='rev_div'>

		<div class="starRev">
<<<<<<< HEAD
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
			
=======
			<span class="starR on">별1</span> <span class="starR">별2</span> <span
				class="starR">별3</span> <span class="starR">별4</span> <span
				class="starR">별5</span> <span class="starR">별6</span> <span
				class="starR">별7</span> <span class="starR">별8</span> <span
				class="starR">별9</span> <span class="starR">별10</span>
>>>>>>> 8b2f2023dfb4c92556836c2262123a0c04fd2a91
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
<<<<<<< HEAD
</div>
</form>
=======
>>>>>>> 8b2f2023dfb4c92556836c2262123a0c04fd2a91




	<script>
	
	/*  	$('.starRev span').click(function() {
			//cosole.log("this="+this);
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});  */
	</script>
	<script type="text/javascript">

	$(document).ready(function(){



	

		var loc = location.href; // 페이지주소받아오기위한 변수

		var page = loc.match(/PageNo\=[0-9]+/g); // 숫자만 찾는 정규식(/PageNo <--이부분은 .html?다음에들어가는부분이다)

		

		if(page) 

		{

			page = page[0].replace('PageNo=','');

		}

		if(!page)

		{

			page= 1;

		}

		

		var opts ={

			'total_record' : {{pages|getAttr:'TotalContent'}} , //총페이지수

			'current_page' : page, //현재페이지

			'block_size'   : 10 , // 페이징에 나타날 숫자 

			'items_per_page' : 10 , // 한페이지에 나타낼 수

			'link_to' : 'notice.html?PageNo=__id__' // 링크. 즉 주소다.. 물론 상대적경로

		}

		//$(".pagination").paging(opts); // DIV의 클래스명



	});

	

     (function($){ 

	

	$.extend($.fn, { 	



		paging : function(opts)

		{

			var options = $.extend($.fn.paging.defaults, opts);

			var current_page = options.current_page;

			var total_record = options.total_record;

			var total_page   = Math.ceil(options.total_record / options.items_per_page);

			var start_number;

			var last_start_page;



			if((current_page%options.block_size) == 0) {

				start_number   = Math.floor((parseInt(current_page)-1)/options.block_size) * options.block_size + 1;

			}else {

				start_number   = Math.floor((parseInt(current_page))/options.block_size) * options.block_size + 1;

			}

			

			if((total_page%options.block_size) == 0) {

				last_start_page = Math.floor((parseInt(total_page) - 1) / options.block_size) * options.block_size + 1;

			}else { 

				last_start_page = Math.floor((parseInt(total_page)) / options.block_size) * options.block_size + 1;

			}

			

			return this.each(function(){

				var $container = $(this);

				$container.empty();



				var interval = getInterval();



				var appendItem = function(page_id, appendopts)

				{

					appendopts = $.extend({text:page_id, classes:""}, appendopts||{});

					if(page_id == current_page) {

						var lnk = $("<span class='cur_num'>"+(appendopts.text)+"</span>");

					}else {

						var lnk = $("<a class='num_box'>"+(appendopts.text)+"</a>").attr('href', options.link_to.replace(/__id__/,page_id));

					}

					if(appendopts.classes){lnk.addClass(appendopts.classes);}

					$container.append(lnk);

				}

		

				if(options.prev_text && options.prev_show_always){

					if(start_number > 1 ) { 

						appendItem(parseInt(interval[0])-1,{text:options.prev_text, classes:"num_prev"});

					}

				}



				for(var i=interval[0]; i<=interval[1]; i++) {

					appendItem(i);

				}

			

				if(options.next_text && options.next_show_always){

					if (current_page < last_start_page){

						appendItem(parseInt(interval[1])+1,{text:options.next_text, classes:"num_next"});

					}

				}



			});



			function getInterval()

			{

				var start = start_number;

				if(current_page > last_start_page )  start = last_start_page;

				var end   = Math.min(start_number+options.block_size-1,total_page);

				if(current_page < 0 ) {

					start = 1;

					end  = 10;

				}

				return [start,end];

			}

		}



	});

	

	$.fn.paging.defaults = {

		'total_record' : 0 , 

		'current_page' : 1 ,

		'items_per_page':10,

		'block_size':10 ,

		'prev_text'    : "이전페이지",

		'next_text'    : "다음페이지",

		'link_to'   : "#",

		'prev_show_always' :true,

		'next_show_always' :true

	};



})(jQuery);



	</script>



	<div id="pagingNav" class="pagination"></div>

</body>
</html>