<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��üȸ������Ʈ</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
div.table {
	border: 3px solid;
	border-collapse: collapse;
	width:1700px;
}

div.td {
	border: 1px solid;
	width: 200px;
	height: 50px;
	float: left;
	box-sizing: border-box;
/* 	line-height: 50px; */
	text-align: center;
}

div.boxmaker {
	clear: both;
}
#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}
#mid{
	margin-top:13px;
}
</style>
</head>
<body>
<header>

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		</header>
	<h1>��üȸ������Ʈ</h1>
	
	<div id='asd'></div>




	<script>
		var json = ${json_ulist};
		console.log(json);
		console.log("--------------");
		var str = "";
		str += "<form action='black' method='post'>";

		str += "<div class='table'>";
		str += "<div class='td' style='width:100px'>ȸ�� ���̵�</div>";
		str += "<div class='td' style='width:100px'>�̸�</div>";
		str += "<div class='td' style='width:100px'>����</div>";
		str += "<div class='td'>�������</div>";
		str += "<div class='td'>��ȭ��ȣ</div>";
		str += "<div class='td'>�̸���</div>";
		str += "<div class='td' style='width:400px'>�ּ�</div>";
		str += "<div class='td'>������Ʈ ����</div>";
		str += "<div class='td' style='width:100px'>ȸ������</div>";
		str += "<div class='td' style='width:100px'>����ư</div>";
		str += "<div class='boxmaker'></div>";

		$.each(json,function(key, value) {

							str += "<form action='black' method='post'>";
						
							str += "<div class='td' style='width:100px'>" + json[key].id + "</div>";
							str += "<div class='td' style='width:100px'>" + json[key].name + "</div>";
							str += "<div class='td' style='width:100px'>"+json[key].gender+ "</div>";
							str += "<div class='td'>"+json[key].birth+"</div>";
							str += "<div class='td'>"+json[key].tel+"</div>";
							str += "<div class='td'>"+json[key].mail+"</div>";
							str += "<div class='td' style='width:400px'>"+json[key].addr+"</div>";
							str += "<div class='td' >"+json[key].blacklist+"</div>";
							str += "<div class='td'  style='width:100px'>"+json[key].type+"</div>";

							str += "<div class='td' style='width:100px'><input type='submit' id='mid' value='��'/></div>";
							str += "<div><input type='hidden' name='sit_id' value='"+json[key].id+"'/></div>";
							str += "<div class='boxmaker'></div>";
							str += "</form>";

						});
		str += "</table>";
							

		$("#asd").append(str);
	</script>
</body>
</html>