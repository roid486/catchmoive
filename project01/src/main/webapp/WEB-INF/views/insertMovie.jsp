<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ĳġ����>>������>>��ȭ ���� �߰�</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>��ȭ ���</h2>
		<form class="form-horizontal" action="insertMovie.com" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_name">��ȭ ����:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_name"
						placeholder="��ȭ ������ ���ּ���." name="m_name" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_director">����
					�̸�:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_director"
						name="m_director" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_actor">�ֿ� ���:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_actor" name="m_actor"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_nation">���� ����:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_nation"
						name="m_nation" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_runningtime">��
					�ð�:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_runningtime"
						placeholder="����Ÿ�� �ۼ���)140" name="m_runningtime"
						required="required">
				</div>
			</div>
			<!-- <div class="form-group">
				<label class="control-label col-sm-2" for="m_grade">���� ���� ���:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_grade"
						name="m_grade" required="required">
				</div>
			</div> -->
		
			<div class="form-group">
            <span class="col-sm-2 control-label">
			<label for="m_grade">��ȭ ���� ���:</label></span>
            <div class="col-sm-2">
			<select class="form-control" id="m_grade" name="m_grade">
				<option>��ü ������</option>
				<option>12�� ������</option>
				<option>15�� ������</option>
				<option>18�� ������</option>
			</select>
            </div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_genre">��ȭ �帣:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_genre" name="m_genre"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_opendate">������:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_opendate"
						placeholder="�ۼ���) yyyy/mm/dd" name="m_opendate"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_synop">�ٰŸ�:</label>
				<div class="col-sm-8">
					<textarea class="form-control" placeholder="�ٰŸ��� �Է��� �ּ���!" rows="9"
						id="m_synop" name="m_synop" required="required"></textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image">������ �̹���:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image" name="m_image"
						required="required">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_trailer">������ url:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_trailer"
						name="m_trailer" required="required">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_score">����:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_score"
						placeholder="�����ڴ� ���� 0���� �־��ּ���." name="m_score"
						required="required">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image1">��ƿ�̹���1:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image1"
						name="m_image1" required="required">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image2">��ƿ�̹���2:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image2"
						name="m_image2" required="required">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image3">��ƿ�̹���3:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image3"
						name="m_image3" required="required">
				</div>
			</div>

			<div class="form-group">
            	<div class="col-sm-2 control-label">
				<label for="m_isshowing">��ȭ �� ����:</label> </div>
                <div class="col-sm-2">
			<select class="form-control" id="m_isshowing" name="m_isshowing">
				<option value="1">����</option>
				<option value="2">�� ����</option>
				<option value="0">�� ����</option>
			</select>
            </div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_boxoffice">������:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_boxoffice"
						placeholder="Default�� 0���� �Է� �ٶ�" name="m_boxoffice"
						required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">��ȭ ���</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>