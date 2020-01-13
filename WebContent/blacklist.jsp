<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>블랙리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<style>
div.table {
	border: 3px solid;
	border-collapse: collapse;

}

div.td {
	border: 1px solid;
	width: 200px;
	height: 50px;
	float: left;
	box-sizing: border-box;
	line-height: 50px;
	text-align: center;
}

div.boxmaker {
	clear: both;
}
</style>
</head>
<body>
	<h1>블랙리스트페이지</h1>
	
	<div id="asd"></div>


	<script>
		var json = ${json_ublist};
		console.log(json);
		console.log("--------------");
		var str = "";

		str += "<div class='table'>";
		str += "<div class='td' style='width:100px'>회원 아이디</div>";
		str += "<div class='td' style='width:100px'>이름</div>";
		str += "<div class='td' style='width:100px'>성별</div>";

		str += "<div class='td'>생년월일</div>";
		str += "<div class='td'>전화번호</div>";
		str += "<div class='td'>이메일</div>";

		str += "<div class='td' style='width:400px' >주소</div>";
		str += "<div class='td' style='width:100px'>블랙리스트 </div>";
		str += "<div class='td' style='width:100px'>회원구분</div>";

		str += "<div class='boxmaker'></div>";
		

		$.each(json,function(key, value) {

							str += "<form action='black' method='post'>";
							

							str += "<div class='td' style='width:100px'>" + json[key].id + "</div>";

							str += "<div class='td' style='width:100px'>" + json[key].name + "</div>";

							str += "<div class='td' style='width:100px'>" + json[key].gender + "</div>";

							str += "<div class='td'>" + json[key].birth + "</div>";

							str += "<div class='td'>" + json[key].tel + "</div>";

							str += "<div class='td'>" + json[key].mail + "</div>";

							str += "<div class='td' style='width:400px'>" + json[key].addr + "</div>";

							str += "<div class='td' style='width:100px'>" + json[key].blacklist + "</div>";

							str += "<div class='td' style='width:100px'>" + json[key].type + "</div>";

							str += "<div><input type='submit' value='해제' formaction='white' /></div>";
							str += "<div><input type='hidden' name='sit_id' value='"+json[key].id+"'/></div>"; 
							str += "<div class='boxmaker'></div>";
							
							str += "</form>";

						});
		str += "</div>";
		$("#asd").append(str);
	</script>
</body>
</html>