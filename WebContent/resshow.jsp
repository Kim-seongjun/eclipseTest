<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<style>
div.table {
	border: 3px solid;
	border-collapse: collapse;
	width: 1500px;
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

#header {
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
}

#mid {
	margin-top: 13px;
}
</style>
</head>
<body>
	<header>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
	</header>
	<h1 style="text-align: center; color: #36e9ce">�����</h1>
	<div id='asd'></div>

	<script>
		var json = ${json_res};
		console.log(json);
		console.log(json.length);
		console.log("--------------");
		var str = "";

		str += "<div class='table'>";
		str += "<div class='td'>�����ȣ</div>"
		str += "<div class='td'>���̵�</div>"
		str += "<div class='td'>����;��̵�</div>"
		str += "<div class='td'>�������ȣ</div>"
		str += "<div class='td'>���������</div>"
		str += "<div class='td'>����������</div>"
		str += "<div class='td'>�ѱݾ�</div>"
		str += "<div class='td' style='width:100px'>������ҹ�ư</div>"
		str += "<div class='boxmaker'></div>";

		$.each(json,function(key, value) {

							str += "<form action='black' method='post'>";
					
							str += "<div class='td'>" + json[key].RES_NO+ "</div>";
							str += "<div class='td'>" + json[key].US_ID+ "</div>";
							str += "<div class='td'>" + json[key].SITTER_ID+ "</div>";
							str += "<div class='td'>" + json[key].PET_NO+ "</div>";
							str += "<div class='td'>" + json[key].RES_DATE_FR+ "</div>";
							str += "<div class='td'>" + json[key].RES_DATE_TO+ "</div>";
							str += "<div class='td'>" + json[key].RES_PRICE+ "</div>";

							str += "<div class='td' style='width:100px'><input type='button' id='mid' value='�������'/></div>";

							str += "</form>";
						});
		
		str += "</div>";
		str +="</table>";
		$("#asd").append(str);
	</script>
</body>
</html>