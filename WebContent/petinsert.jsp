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
					<td><input type="text" class="res" name="pet_name" /></td>
				</tr>
				<tr>
					<td>견 종</td>
					<td><input type="text" class="res" name="pet_type" /></td>
				</tr>
				<tr>
					<td>성 별</td>
					<td><input type="radio" class="res" name="pet_gender" value="수컷" checked />수컷</td>
					<td><input type="radio" class="res" name="pet_gender" value="암컷" />암컷</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td>반려견 요청사항</td>
					<td><input type="text" style='height:80px; width:300px;' class="res" name="pet_request"  /></td>
				</tr>
				<tr>
					<td><input type="submit" value='등록' class="btn" formaction="petinsert"/></td>
					<td><input type="submit" value='취소' class="btn" formaction="home" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>