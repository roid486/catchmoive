<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#menu {
	position: relative;
	z-index: 999;
}

#bottom {
	position: relative;
	background-color: brown;
	color: white;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#term1").click(function () {
			t1 = $('input[id="term1"]').is(":checked");
		});
		$("#term2").click(function () {
			t2 = $('input[id="term2"]').is(":checked");
		});
		$("#term3").click(function () {
			$("input[name=term]:checkbox").prop("checked", true);
		});
		$("#msgdialog").dialog({
	         autoOpen:false,
	         modal:true
	      });
		$("#termsok").click(function () {
			if($("input[name=term]:checkbox:checked").length==2)
			{		
				location.href="serchcust.com";
			}
			else
			{
				$("#msgdialog").dialog("open");
			}
		});
	});
</script>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<center>
		<table>
			<tr>
				<td><textarea rows="20" cols="50" readonly="readonly">
[필수입력정보 수집동의서]
1. 개인정보의 수집 및 이용 목적 
① 고객에게 본인확인, 포인트 적립 및 결제 서비스
② 가입의사 확인, 연령 제한 서비스 이용
③ 공지, 불만처리 등 원활한 의사소통 경로 확보
④ 다양하고 편리한 인터넷 서비스 제공
⑤ 이벤트 경품 당첨자 안내 및 경품 배송에 대한 정확한 배송지 확보
⑥ 업무와 관련된 통계자료 작성 및 서비스 개발 등
⑦ 불량회원의 부정 이용 방지와 비인가 사용방지
2. 수집하는 개인정보의 항목 
성명, ID(E-Mail), E-Mail, 주소, 연락처, 휴대폰번호, 정보수신동의여부(E-Mail, SMS), 성별, 생년월일, 개인정보 유효기간(L.POINT), 본인확인기관을 통해 받는 결과값(CI)
3. 개인정보의 보유 및 이용기간 
개인정보는 수집ㆍ이용에 관한 동의일로부터 휴면계정 및 탈퇴 시까지 위 이용 목적으로 이용됩니다.
다만, 관계법률에 의해 보존할 필요가 있는 경우에는 다음과 같이 보관 됩니다.
① 설문조사 및 이벤트 등의 목적을 수집한 기록 : 당해 설문조사, 이벤트 종료 후 3개월 이내(당첨자 확인 및 경품 수령 확인 목적)
② 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
③ 대금결제 및 재화 등의 공급에 관한 기록 : 5년
4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익 
위 개인정보의 서비스 제공을 위한 최소한의 필수적인 수집·이용 정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.
					</textarea><br> <input type="checkbox" id="term1" name="term"><span>동의합니다.</span>
				</td>
				<td><textarea rows="20" cols="50" readonly="readonly">
[선택입력정보 수집동의서]
1. 정보의 수집 및 이용 목적
신규 서비스 등 최신정보 안내 및 개인맞춤서비스 제공을 위한 자료
기타 원활한 양질의 서비스 제공
2. 수집하는 개인정보의 항목
① 일반회원으로 가입하는 경우 : 직장주소, 연락처, 정보수신동의여부(E-Mail, SMS), MY 영화관
② 어플리케이션 선택 항목: 외부 SNS 서비스 연동을 위한 추가 입력사항
3. 개인정보의 보유 및 이용기간
개인정보는 수집ㆍ이용에 관한 동의일로부터 휴면계정 및 탈퇴 시까지 위 이용 목적으로 이용됩니다. 다만, 관계법률에 의해 보존할 필요가 있는 경우에는 다음과 같이 보관 됩니다. 
① 설문조사 및 이벤트 등의 목적을 수집한 기록 : 당해 설문조사, 이벤트 종료 후 3개월 이내(당첨자 확인 및 경품 수령 확인 목적)
② 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
③ 대금결제 및 재화 등의 공급에 관한 기록 : 5년
4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
위 개인정보의 서비스 제공을 위한 최소한의 필수적인 수집·이용 정보이며 거부할 수 있습니다. 다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.
					</textarea><br> <input type="checkbox" id="term2" name="term"><span>동의합니다.</span>
				</td>
			</tr>
		</table>
		<input type="checkbox" id="term3"><span>모두동의</span>
		<div>
			<button id="termsok">다음</button>
		</div>
	</center>
	<div id="msgdialog">
		<center>
			<font color="red">약관을 모두 동의해주세요.</font>
		</center>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>