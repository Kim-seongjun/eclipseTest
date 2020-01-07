<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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
		<h3>ȸ������</h3>
		<form action="joinfrm" method="post">
			<div id="join_background">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" maxlength="20"></td>
						<td><input id="id_check" type="button" value="�ߺ�Ȯ��"></td>
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
						<td>�̸�</td>
						<td><input type="text" name="name" maxlength="30"></td>
					</tr>

					<tr>
						<td>����ó</td>
						<td><input type="text" name="phone_num" maxlength="11"></td>
					</tr>

					<tr>
						<td>����</td>
						<td><input type="radio" value="��" name="gender"
							class="gender"></td>
						<td>����</td>
						<td><input class="" type="radio" value="��" name="gender"
							class="gender"></td>
					</tr>

					<tr>
						<td>�������</td>
						<td><input type="date" id="birth" name="birth"></td>
					</tr>

					<tr>
						<td>�̸���</td>
						<td><input type="text" id="email" name="email"> @
						<td><select id="url1">
								<option>Naver.com</option>
								<option>Daum.net</option>
								<option>Google.com</option>
						</select></td>

					</tr>
					<tr>
						<td>�����ּ�</td>
						<td><select id="url2">
								<option>���ﱤ����</option>
								<option>��õ������</option>
								<option>��⵵</option>
						</select></td>
						<td><input type="text" id="house_num" name="house_num"></td>
					</tr>

				</table>

				<input class="btn" type="submit" value="Ȯ��"> <input
					class="btn" type="submit" value="���" formaction="main">
			</div>
		</form>
	</div>
</body>
</html>