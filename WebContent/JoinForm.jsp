<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		<h3>회원가입</h3>
		<form action="joinfrm" method="post">
			<div id="join_background">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" maxlength="20"></td>
						<td><input id="id_check" type="button" value="중복확인"></td>
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
						<td>연락처</td>
						<td><input type="text" name="phone_num" maxlength="11"></td>
					</tr>

					<tr>
<<<<<<< HEAD
						<td>����</td>
<<<<<<< HEAD
						<td><input type="radio" value="��" name="gender"
							class="gender" checked></td>
=======
						<td><input type="radio" value="��" name="gender" class="gender" checked></td>
>>>>>>> 990d0b05af65943b81f7af247786e4515e2168ad
						<td>����</td>
						<td><input class="" type="radio" value="��" name="gender"
=======
						<td>남자</td>
						<td><input type="radio" value="남" name="gender" class="gender" checked></td>
						<td>여자</td>
						<td><input class="" type="radio" value="여" name="gender"
>>>>>>> e0bdf8de5c87ee7beb80f627540432307c58f260
							class="gender"></td>
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
						<td>우편주소</td>
						<td><select id="url2">
								<option>서울광역시</option>
								<option>인천광역시</option>
								<option>경기도</option>
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