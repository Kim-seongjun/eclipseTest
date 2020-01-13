<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전체회원리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding-left: 10px;
	padding-right: 10px;
}
</style>
</head>
<body>
	<h1>전체회원리스트</h1>
	<div id='asd'></div>




	<script>
		var json = ${json_ulist};
		console.log(json);
		console.log("--------------");
		var str = "";
		str += "<form action='black' method='post'>";
		str += "<table>";
		str += "<tr>";
		str += "<td>회원 아이디</td>";
		str += "<td>이름</td>";
		str += "<td>성별</td>";
		str += "<td>생년월일</td>";
		str += "<td>전화번호</td>";
		str += "<td>이메일</td>";
		str += "<td>주소</td>";
		str += "<td>블랙리스트 여부</td>";
		str += "<td>회원구분</td>";
		str += "</tr>";

		$
				.each(
						json,
						function(key, value) {

							str += "<form action='black' method='post'>";
							str += "<tr>";
							str += "<td>" + json[key].id + "</td>";
							str += "<td>" + json[key].name + "</td>";
							str += "<td>";
							str += json[key].gender;
							str += "</td>";
							str += "<td>";
							str += json[key].birth;
							str += "</td>";
							str += "<td>";
							str += json[key].tel;
							str += "</td>";
							str += "<td>";
							str += json[key].mail;
							str += "</td>";
							str += "<td>";
							str += json[key].addr;
							str += "</td>";
							str += "<td>";
							str += json[key].blacklist;
							str += "</td>";
							str += "<td>";
							str += json[key].type;
							str += "</td>";

							str += "<td><input type='submit' value='블랙'/></td>";
							str += "<td><input type='hidden' name='sit_id' value='"+json[key].id+"'/></td>";
							str += "</tr>";
							str += "</form>";

						});
		str += "</table>";
							

		$("#asd").append(str);
	</script>
</body>
</html>