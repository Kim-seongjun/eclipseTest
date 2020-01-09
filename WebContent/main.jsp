<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}

#pet_search {
	all: unset;
	width: 300px;
	height: 150px;
	background-color: #36e9ce;
	font-size: 30px;
	color: #FFFFFF;
	font-weight: bold;
	text-align: center;
	border-radius: 30px;
	cursor: pointer;
	position: relative;
	top: 400px;
}
#aaaa{

margin-left:200px;
margin-top:250px;
text-align: center;
}

#bbbb{

margin-left:270px;
margin-top:250px;
text-align: center;
}


#cccc{

margin-left:200px;
margin-top:250px;
text-align: center;
}

.jpg{
opacity:70%;
}

#under_g{
	display: flex; 
	flex-direction: column; 
	align-items: center;
}

/* 아이템 타이틀  */
.span_j{
color:navy; 
font-size:2.0em; 
font-weight:bold;
}

.item_a{

    color: rgba(0, 0, 0, 0.65);
    font-size: 15px;
    font-variant: tabular-nums; 
    line-height: 1.5;
    background-color: #fff;
    -webkit-font-feature-settings: 'tnum';
    font-feature-settings: 'tnum';
    margin-right:100px;
    
    }

#jione{
left:300px;
text-align-last:center;
position: relative; 
text-align:center;
 
 }



</style>
</head>

<body>
	<header>

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<section
			style="width: 100%; height: 870px; display: flex; justify-content: center">

			<div
				style="width: 100%; height: 870px; overflow: hidden; position: absolute; left: 0; z-index: -1">
				<div
					style="display: flex; flex-direction: column; align-items: center">
					<div
						style="display: flex; flex-direction: column; align-items: center; margin-top: 200px; z-index: 1">
						<div
							style="display: flex; text-align: center; font-size: 55px; font-weight: 800; color: #383C48; line-height: 79px">엄선된
							펫시터</div>
						<div
							style="display: flex; text-align: center; font-size: 55px; font-weight: 800; color: #383C48; line-height: 79px">
							오직 <span style="color: #71A7FF">펫어시스턴트</span>에서만
						</div>
					</div>
					<img src="img/background.jpg"
						style="opacity: 30%; position: absolute; margin: auto; width: 100%; height: 870px; left: 0; right: 0; top: 0; bottom: 0"
						alt="펫어씨스턴트 펫시터가 제공하는 강아지 돌봄 서비스">
				</div>
			</div>
			<form action="petsittersearch" method="post">
				<input type="submit" id="pet_search" value="펫시터 검색하기" />
			</form>
		</section>
	</header>

	<section
		style="width: 100%; height: 870px; display: flex; margin:auto; text-align: left">
		
		<div id=aaaa>
		<div>
			<img class="jpg" width="260" height="300" src="img/dog1.jpg" alt="메인강아지1">
		<h3>장기간 집을 비울때 마음 한편에선 <br>불안하지않으세요?</h3>
		</div>
		</div>
	<div id=bbbb>
	<div>
	<img class="jpg" width="260" height="300"  src="img/rolling1_3.jpg" alt="메인강아지2">
	<h3>혼자있는 강아지 위험한행동은 안하겠지란 <br>생각에 불안하지않으세요?</h3>
	</div>
	</div>


<div id=cccc>
	<div>
	<img class="jpg" width="260" height="300"  src="img/rolling2_2.jpg" alt="메인강아지2">
	<h3>맡기더라도 믿음이 가시지않으시지않으신가요?</h3>
	</div>
	</div>
	
	</section>
	<div id="under_g" style="display: flex; text-align: center; font-size: 55px; font-weight: 800;  line-height: 79px"
	>
<h4>저희가 도와드리겠습니다!!</h4>
</div>


<div id="jione">
<section style="width: 100%; height: 300px; display: flex; margin:auto; text-align: left">
		
	
		<div class="item_a">
		<div>
		<h3 ><span class="span_j">검사비 지원</span></h3><br>
		<div>
		최대1회,20만원까지 지원<br>
		</div>
		저희 사이트에서 사용중 상해 사고시 검사비 지원<br>
		(하지만 유독물질을 일시에 흡입, <br>
		흡수 또는 섭취한 결과 발생한 중독증상에 대한<br>
		 초음파,CT,MRI,알레르기에 대한 검사 제외)
		</div>
		</div>
		
		
		<div class="item_a">
		<div>
		<h3 ><span class="span_j">치료비 지원</span></h3><br>
		<div>
		최대 2회, 총 40만원까지 지원<br>
		</div>
		펫시팅 기간 내 발생된 반려동물의 부상에 대한<br>
		치료비를 해당 금액 만큼 지원(진료비,야간진료비,<br>
		토통원치료비,주사비용,약제비,응급실 포함)
		</div>
		</div>
		
		
		<div class="item_a">
		<div>
		<h3 ><span class="span_j">입원비 지원</span></h3><br>
		<div>
		최대1회, 10만원까지 지원<br>
		</div>
		진료가 필요한 경우 자택에서 치료가 곤란하여<br>
		대상 반려동물을 동물병원에 입원시켜<br>
		항시 수의사의 관리하에 치료에 전념토록함
		</div>
		</div>
		
		</section>
	
		
		<section style="width: 100%; height: 300px; display: flex; margin:auto; text-align: left">
		
		
		<div class="item_a">
		<div>
		<h3 ><span class="span_j">입원비 지원</span></h3><br>
		<div>
		최대1회, 10만원까지 지원<br>
		</div>
		진료가 필요한 경우 자택에서 치료가 곤란하여<br>
		대상 반려동물을 동물병원에 입원시켜<br>
		항시 수의사의 관리하에 치료에 전념토록함
		</div>
		</div>
		
		
		<div class="item_a">
		<div>
		<h3 ><span class="span_j">변호사 자문 지원</span></h3><br>
		<div>
		최대2회, 40만원까지 지원<br>
		</div>
		사건/사고 발생의 책임자 판단을 위한<br>
		수의사의 검진과 자문을 포함하여<br>
		반려동물 전문 변호사의 자문을 무상으로 지원
		</div>
		</div>
		


		<div class="item_a" >
		<div>
		<h3 ><span class="span_j">펫시터 보험 지원</span></h3><br>
		<div>
		최대1회, 10만원까지 지원<br>
		</div>
		펫시팅도중 고객의 발려동물로 인해<br>
		본인 또는 본인의 반려동물이 상해를 입은 경우<br>
		치료비및 검사비를 지원합니다.
		</div>
		</div>
		</section>
		</div>
		

	<footer>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</footer>
</body>
</html>