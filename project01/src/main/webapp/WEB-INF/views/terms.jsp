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
[�ʼ��Է����� �������Ǽ�]
1. ���������� ���� �� �̿� ���� 
�� ������ ����Ȯ��, ����Ʈ ���� �� ���� ����
�� �����ǻ� Ȯ��, ���� ���� ���� �̿�
�� ����, �Ҹ�ó�� �� ��Ȱ�� �ǻ���� ��� Ȯ��
�� �پ��ϰ� ���� ���ͳ� ���� ����
�� �̺�Ʈ ��ǰ ��÷�� �ȳ� �� ��ǰ ��ۿ� ���� ��Ȯ�� ����� Ȯ��
�� ������ ���õ� ����ڷ� �ۼ� �� ���� ���� ��
�� �ҷ�ȸ���� ���� �̿� ������ ���ΰ� ������
2. �����ϴ� ���������� �׸� 
����, ID(E-Mail), E-Mail, �ּ�, ����ó, �޴�����ȣ, �������ŵ��ǿ���(E-Mail, SMS), ����, �������, �������� ��ȿ�Ⱓ(L.POINT), ����Ȯ�α���� ���� �޴� �����(CI)
3. ���������� ���� �� �̿�Ⱓ 
���������� �������̿뿡 ���� �����Ϸκ��� �޸���� �� Ż�� �ñ��� �� �̿� �������� �̿�˴ϴ�.
�ٸ�, ��������� ���� ������ �ʿ䰡 �ִ� ��쿡�� ������ ���� ���� �˴ϴ�.
�� �������� �� �̺�Ʈ ���� ������ ������ ��� : ���� ��������, �̺�Ʈ ���� �� 3���� �̳�(��÷�� Ȯ�� �� ��ǰ ���� Ȯ�� ����)
�� �Һ����� �Ҹ� �Ǵ� ����ó���� ���� ��� : 3��
�� ��ݰ��� �� ��ȭ ���� ���޿� ���� ��� : 5��
4. ���Ǹ� �ź��� �Ǹ� �� ���Ǹ� �ź��� ����� ������ 
�� ���������� ���� ������ ���� �ּ����� �ʼ����� �������̿� �����̸� �ź��� �� �ֽ��ϴ�. �ٸ�, ������ �������� ���� ��� ���� �̿��� ���ѵ˴ϴ�.
					</textarea><br> <input type="checkbox" id="term1" name="term"><span>�����մϴ�.</span>
				</td>
				<td><textarea rows="20" cols="50" readonly="readonly">
[�����Է����� �������Ǽ�]
1. ������ ���� �� �̿� ����
�ű� ���� �� �ֽ����� �ȳ� �� ���θ��㼭�� ������ ���� �ڷ�
��Ÿ ��Ȱ�� ������ ���� ����
2. �����ϴ� ���������� �׸�
�� �Ϲ�ȸ������ �����ϴ� ��� : �����ּ�, ����ó, �������ŵ��ǿ���(E-Mail, SMS), MY ��ȭ��
�� ���ø����̼� ���� �׸�: �ܺ� SNS ���� ������ ���� �߰� �Է»���
3. ���������� ���� �� �̿�Ⱓ
���������� �������̿뿡 ���� �����Ϸκ��� �޸���� �� Ż�� �ñ��� �� �̿� �������� �̿�˴ϴ�. �ٸ�, ��������� ���� ������ �ʿ䰡 �ִ� ��쿡�� ������ ���� ���� �˴ϴ�. 
�� �������� �� �̺�Ʈ ���� ������ ������ ��� : ���� ��������, �̺�Ʈ ���� �� 3���� �̳�(��÷�� Ȯ�� �� ��ǰ ���� Ȯ�� ����)
�� �Һ����� �Ҹ� �Ǵ� ����ó���� ���� ��� : 3��
�� ��ݰ��� �� ��ȭ ���� ���޿� ���� ��� : 5��
4. ���Ǹ� �ź��� �Ǹ� �� ���Ǹ� �ź��� ����� ������
�� ���������� ���� ������ ���� �ּ����� �ʼ����� �������̿� �����̸� �ź��� �� �ֽ��ϴ�. �ٸ�, ������ �������� ���� ��� ���� �̿��� ���ѵ˴ϴ�.
					</textarea><br> <input type="checkbox" id="term2" name="term"><span>�����մϴ�.</span>
				</td>
			</tr>
		</table>
		<input type="checkbox" id="term3"><span>��ε���</span>
		<div>
			<button id="termsok">����</button>
		</div>
	</center>
	<div id="msgdialog">
		<center>
			<font color="red">����� ��� �������ּ���.</font>
		</center>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>