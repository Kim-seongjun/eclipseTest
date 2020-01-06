<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.right_x2un4{ float:right; }
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
/* a:hover {text-decoration: underline; color: red;} */

input{
 all:unset;
 opacity:80%;
 font-size:20px;
 margin-top: 10px; 
}
</style>
</head>
<body>

	<form action="" name="loginfrm" method="post">
	<a href="access"><img src="img/logo.jpg" alt="로고사진" /></a>
	<div class="right_x2un4">
	 <input type="submit" value="펫시터지원" formaction="petjoin"/>&nbsp;&nbsp; 
	<input type="button" value="로그인"/> &nbsp;
	<input type="submit" value="회원가입" formaction="joinfrm"/>
	</div>
	</form>
	<div class="modal-wrapper">
      <div class="modal">
        <div class="modal-title">안녕하세요</div>
        <p>모달 내용은 어쩌고 저쩌고..</p>
        <div class="close-wrapper">
          <button>닫기</button>
        </div>
      </div>
    </div>

</body>
</html>