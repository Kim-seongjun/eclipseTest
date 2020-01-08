<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<style>
#div {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

input {
	border-left: none;
	border-right: none;
	border-top: none;
	height: 40px;
	font-size: 100%;
}

#url1 {
	height: 23px;
	width: 160px;
}

#url2 {
	height: 23px;
	width: 160px;
}

.btn {
	background: #00c8b7;
	border-radius: 0.5em;
	padding: 5px 20px;
	color: white;
	cursor: pointer;
}

#join_background {
	background: rgba(204, 204, 204, 0.25);
}

#id_check {
	all: unset;
	background-color: white;
	color: #00c8b7;
	border: solid 1px #00c8b7;
	cursor: pointer;
	padding: 5px;
}

#birth {
	font-size: 160%;
}
</style>
</head>
<body>
	<div id="div">
		<h3>정보를 입력해주세요</h3>
		<form action="joinfrm" method="post">
			<div id="join_background">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" maxlength="20"></td>
						<td><input id="id_check" type="button" value="以�蹂듯����"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="text" name="pw" maxlength="30"></td>
					</tr>

					<tr>
						<td>PW Check</td>
						<td><input type="text" name="pw" maxlength="30"></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" name="name" maxlength="30"></td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone_num" maxlength="11"></td>
					</tr>

					<tr>

						<td>남자</td>
						<td><input type="radio" value="남" name="gender" class="gender" checked></td>
						<td>여자</td>
						<td><input class="" type="radio" value="여" name="gender" class="gender"></td>
					</tr>

					<tr>
						<td>생년월일</td>
						<td><input type="date" id="birth" name="birth"></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="text" id="email" name="email"> @
						<td><select id="url1">
								<option>Naver.com</option>
								<option>Daum.net</option>
								<option>Google.com</option>
						</select></td>

					</tr>
					<tr>
						<td>주소</td>
						<td><select id="url2">
								<option>서울</option>
								<option>인천</option>
								<option>경기</option>
						</select></td>
						<td><input type="text" id="house_num" name="house_num"></td>
					</tr>

				</table>

				<input class="btn" type="submit" value="확인"> 
				<input class="btn" type="submit" value="취소" formaction="home">
			</div>
		</form>
	</div>
</body>
<script>



</script>
</html>