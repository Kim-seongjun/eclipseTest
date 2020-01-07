<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.right_x2un4 {
	float: right;
}

.header_button {
	all: unset;
	opacity: 80%;
	font-size: 20px;
	margin-top: 10px;
	cursor: pointer;
}
.modal{          
     position:fixed;
     width: 100%;
	height: 100%;
	
	/* 밑에부분 적용안되는중 */
	display:flex;
	justify-content:center;
	align-items:center;
}
.modal__overlay{
	background-color: rgba(0,0,0,0.6);
	width: 100%;
	height: 100%;
	position:absolute;
}
.modal__content{
	background-color:white;
	padding:20px;
	position:relative;
	width:320px;
	box-shadow:0 10px 20px;
}
#login_button{
	all: unset;
	width:304px;
	height: 50px;
	text-align:center;
 	background-color: #36e9ce;
 	color:white;
 	font-weight: bold;
}
.login_tag{
	border-left:none;
	border-right:none;
	border-top:none;
	width:300px;
	height: 50px;
	margin-bottom: 10px;
}
 .hidden{
	display: none;
} 
</style>
</head>
<body>

	<form action="" name="loginfrm" method="post">
		<a href="access"><img src="img/logo.jpg" alt="로고사진" /></a>
		<div class="right_x2un4">
			<input class="header_button" type="submit" value="펫시터지원" formaction="petjoin" />&nbsp;&nbsp;
			<input id="open" class="header_button" type="button" value="로그인" /> &nbsp; 
			<input class="header_button" type="submit" value="회원가입" formaction="joinfrm" />
		</div>
	</form>
	<!-- 	<div class="modal-wrapper">
      <div class="modal">
        <div class="modal-title">안녕하세요</div>
        <p>모달 내용은 어쩌고 저쩌고..</p>
        <div class="close-wrapper">
          <button>닫기</button>
        </div>
      </div>
    </div> -->
	<div class="modal hidden">
		<div class="modal__overlay">
			<div class="modal__content">
				<form action="access" method="get">
				<table>
				<tr>
				<td style="color:#36e9ce; font-weight:bold;">로그인 정보를 입력해주세요.</td>
				</tr>
					<tr>
						<td><input class="login_tag" type="text" name="id" value="" placeholder="아이디 " maxlength="30" /></td>
					</tr>
					<tr>
						<td><input class="login_tag" type="password" name="pw" value="" placeholder="비밀번호" maxlength="20" /></td>
					</tr>
					<tr>
					<td><input id="login_button" type="submit" value="로그인" /></td>
					</tr>
				</table>
				</form>
				<button id="close">X</button>
			</div>
		</div>
	</div>

<script>
//헤더부분의 로그인버튼 클릭시 모달창 오픈
 $("#open").click(function () {
	$(".hidden").show();
});
 
 //x버튼 클릭시 모달창 닫힘
 $("#close").click(function() {
	 $(".hidden").hide();
 });
 
 //모달창 백그라운드 클릭시 모달창 닫힘
/*  $(".modal__overlay").click(function() {
	 $(".hidden").hide();
}) */
</script>
asdasdsa
</body>
</html>