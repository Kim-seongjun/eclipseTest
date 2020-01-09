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

<section
		style="width: 100%; height: 870px; display: flex; margin:auto; text-align: left">
		
		</section>


	<footer>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</footer>


</body>


</html>