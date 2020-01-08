<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>펫시터지원</title>
<style>
#apply_main{
	border:1px solid black;
	
	display:flex;
	flex-direction:column;
	align-items:center;
	width:50%;

}
body{
	
	display:flex;
	flex-direction:column;
	align-items:center;
}
.result{
	border-left: none;
	border-top: none;
	border-right: none;
	width:80%;
	height: 50px;

}
</style>
</head>
<body>

<h1 style="text-align: center">펫시터 지원 신청서</h1>
<div id="apply_main">

<form method="post">
<div>반려견을 키워본 경험이 있나요?(얼마나 키웠는지,현재 키우고 있는지 상세하게 기제)</div>
<input class="result" type="text" />
<div>반려동물 관련 자격증을 소지하고 계신가요?</div>
<input class="result" type="text" />
<div>펫시터 경험이 있나요?(개인/타업체)</div>
<input class="result" type="text" />
<div>어느정도 크기의 강아지까지 돌봄이 가능하신가요?</div>
<input class="result" type="text" />
<div>펫시터 활동 중 강아지가 경계하거나 이빨을 보이며 공격하려 하는 경우 어떻게 대처하시겠습니까?</div>
<input class="result" type="text" />
<div>본인이 강아지와 산책할 떄 가장 중요하게 생각하는 부분에 대해 설명해주세요.</div>
<input class="result" type="text" />
<div>마지막으로 하고싶으신 말을 자유롭게 작성해주세요.</div>
<input class="result" type="text" />
<div>본 지원자는 상기 답변 내용에 거짓이 없음을 확인 후 설문을 완료합니다. 
사실과 다른 기재로 인한 불미스어운 모든 상황에 대해 당사는 책임이 없음을 안내드립니다.</div>
<input type="radio" value="예" /> 예 <br />

<input type="submit" value="제출" formaction=""/>
<input type="submit" value="취소" formaction="home"/>
</form>

</div>

<script>
var json=${jsontest};
var str="";


/* $.each(json,function(key,value){
	
}); */ 


for(var i=0;i<json.length;i++){
	
	console.log(json[i]);
}


</script>

</body>
</html>