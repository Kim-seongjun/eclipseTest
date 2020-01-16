<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>반려견 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#main {
	background: rgba(204, 204, 204, 0.25);
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 50%;
}


.res{
	border-left: none;
	border-right: none;
	border-top: none;
}
.btn {
	all: unset;
	width: 100px;
	height: 40px;
	padding: 10px 20px;
	margin-right: 20px;
	background-color: #36e9ce;
	color: white;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	border-radius: 20px;
	cursor: pointer;
    margin-top: 20px;
}


</style>

</head>


<body>
	<h1>반려견 등록 페이지</h1>

	<form action="" method="post">

		<div id='main'>

			<img src="" alt="" />
			<table>
				<tr>
					<td>반려견 이름</td>
					<td><input type="text" class="res" name="pet_name" id="name" /></td>
				</tr>
				<tr>
					<td>견 종</td>
					<td><input type="text" class="res" name="pet_type" id="type"/></td>
				</tr>
				<tr>
					<td>성 별</td>
					<td><input type="radio" class="res" name="pet_gender" value="수컷" id="man" />수컷</td>
					<td><input type="radio" class="res" name="pet_gender" value="암컷" id="female"/>암컷</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td>반려견 요청사항</td>
					<td><input type="text" style='height:80px; width:300px;' class="res" name="pet_request" id="requests" /></td>
				</tr>
				<tr>
					<td><input type="submit" value='등록' class="btn" id='hag' formaction="petinsert"/></td>
					<td><input type="submit" value='취소' class="btn" formaction="home" /></td>
				</tr>
			</table>
		</div>
	</form>
	<script>
	$("#hag")
	.click(
			function() {
				if ($("#name").val() == "") {
					alert("이름을 작성해주세요.");
					$("#hag").prop("type", "button");
				}

				else if ($("#type").val() == "") {
					alert("견종선택해주세요.");
					$("#hag").prop("type", "button");
				}
				
				else if ($("input:radio[name='pet_gender']").is(":checked") == false) {
					alert("체크를 해주세요.");
					$("#hag").prop("type", "button");
				}
				
				else if ($("#requests").val() == "") {
					alert("요청사황을 적어주세요.");
					$("#hag").prop("type", "button");
				}
				else{
					alert("요청에 성공하셧습니다.");
					$("#hag").prop("type","submit");
					
				}
			
			});
				
	</script>
</body>
</html>