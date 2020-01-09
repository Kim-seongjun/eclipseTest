<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	width: 800px;
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
		<form method="post">
			<div id="join_background">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" maxlength="20"></td>
						<td><input id="id_check" type="button" value="중복확인"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="pw" maxlength="30"></td>
					</tr>

					<tr>
						<td>PW Check</td>
						<td><input type="password" maxlength="30"></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" name="name" maxlength="30"></td>
					</tr>

					<tr>
						<td>전화번호</td>
						<td><input type="text" name="tel" maxlength="11"></td>
					</tr>

					<tr>

						<td>남자</td>
						<td><input type="radio" value="남" name="gender"
							class="gender" checked></td>
						<td>여자</td>
						<td><input class="" type="radio" value="여" name="gender" class="gender"></td>
					</tr>

					<tr>
						<td>생년월일</td>
						<td><input type="date" id="birth" name="birth"></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input type="text" name="mail1"></td>
						<td>@<input type="text" id="mail2" name="mail2" readOnly style="margin-bottom: 10px;" value="" /></td>
						<td><select id="url1">

								<option value="1">직접입력</option>
								<option value="@naver.com">naver.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@google.com">google.com</option>
						</select></td>

					</tr>


					<tr>
						<td>지역선택 :</td>
						<td><select id="url2">
								<option>서울</option>
								<option>인천</option>
								<option>경기</option>
						</select></td>
					</tr>

					<tr>
						<td rowspan="2">주소</td>
						<td><input type="text" id="addr1" name="addr1" readOnly /></td>
						<td><input type="text" name="addr2" style="width: 350px;"></td>
					</tr>

				</table>

				<input class="btn" type="submit" value="확인" formaction="memberjoin">
				<input class="btn" type="submit" value="취소" formaction="home">
			</div>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#mail2").attr("readOnly", false);
	});
	//이메일 선택
	$("#url1").change(function() {
		$("#url1 option:selected").each(function() {
			if ($(this).val() == '1') {
				$("#mail2").show();
				$("#mail2").val('');
				$("#mail2").attr("readOnly", false);
			} else {
				$("#mail2").show();
				$("#mail2").val($(this).text()); //선택값 입력 
				$("#mail2").attr("readOnly", true); //비활성화
			}
		});
	});

	//주소 선택 
	$("#url2").change(function() {
		$("#url2 option:selected").each(function() {
			if ($(this).val() == '1') {
				$("#addr1").show();
				$("#addr1").val('');
				$("#addr1").attr("readOnly", false);
			} else {
				$("#addr1").show();
				$("#addr1").val($(this).text()); //선택값 입력 
				$("#addr1").attr("readOnly", true); //비활성화
			}
		});
	});
</script>
</html>