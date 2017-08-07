<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%">
		<img src="resources/images/catchmovieLogo-iloveimg-resized.png" height="80px" style="float: left;">
		<p>서울 마포구 백범로 23 구프라자3층</p>
		<p>대표이사 : 자바조 사업자등록번호 : 100-12-123456	통신판매업신고번호 : 2017-서울마포-0662</p>
		<p>개인정보보호 책임자 : 조장 고이삭	대표이메일 : roid486@naver.com	고객센터 :02)707-1480</p>
	</div>
	<!-- Modal -->
  <div class="modal fade" id="logindial"  role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:20px 25px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="glyphicon glyphicon-lock"></span><strong>로그인</strong></h3>
        </div>
        <div class="modal-body" style="padding:30px 40px;">
          <form action="login.com" method="post" role="form">
            <div class="form-group">
              <label for="usrname" style="color: black;"><span class="glyphicon glyphicon-user"></span>아이디</label>
              <input type="text" class="form-control" name="c_id"  id="usrname" placeholder="아이디를 입력해주세요." required>
            </div>
            <div class="form-group">
              <label for="psw" style="color: black;"><span class="glyphicon glyphicon-eye-open"></span>비밀번호</label>
              <input type="password" class="form-control" name="c_pw" id="psw" placeholder="비밀번호를 입력해주세요." required>
            </div>
         
              <button type="submit" id="logbtn" class="btn btn-info btn-block"><span class="glyphicon glyphicon-off"></span>로그인</button>
          </form>
          <p style="color: black;"><span id="scid">아이디</span>&nbsp;/&nbsp;<span id="scpw">비밀번호</span> 찾기</p>
          <button id="naverBtn"><img src="resources/images/naver_Green.PNG"  width="230px" height="45px" onclick="window.open('naverLogin.com','네이버 : 로그인','width=550, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no');return false;"></button>
    
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>취소</button>
          <p style="color: black;">회원이 아니십니까? <a href="signup.com">회원가입 하기</a></p>
          
        </div>
      </div>
      
    </div>
  </div> 
  
  <!--아이디 찾기  Modal -->
  <div class="modal fade" id="sciddial"  role="dialog">
    <div class="modal-dialog">
    
      <!--아이디 찾기 Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="glyphicon glyphicon-search"></span><strong>아이디 찾기</strong></h3>
        </div>
        <div class="modal-body" style="padding:20px 30px;">
          <form action="scid.com" method="post" role="form">
            <div class="form-group">
              <label for="usrname" style="color: black;"><span class="glyphicon glyphicon-user"></span>이름</label>
              <input type="text" class="form-control"  name="name" id="usrname" placeholder="이름를 입력해주세요." required>
            </div>
            <div class="form-group">
              <label for="email" style="color: black;"><span class="glyphicon glyphicon-envelope"></span>이메일</label>
              <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요." required>
            </div>
         
              <button type="submit" id="logbtn" class="btn btn-info btn-block"><span class="glyphicon glyphicon-off"></span>찾기</button>
          </form>

        </div>
      
      </div>
      
    </div>
  </div> 
  
  <!--비밀번호 찾기  Modal -->
  <div class="modal fade" id="scpwdial"  role="dialog">
    <div class="modal-dialog">
    
      <!--비밀번호 찾기 Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3><span class="	glyphicon glyphicon-search"></span>&nbsp;<strong>비밀번호 찾기</strong></h3>
        </div>
        <div class="modal-body" style="padding:20px 30px;">
          <form action="scpw.com" method="post" role="form">
          
          <div class="form-group">
              <label for="id" style="color: black;"><span class="glyphicon glyphicon-heart"></span>ID</label>
              <input type="text" class="form-control"  name="id" id="id" placeholder="아이디를 입력해주세요." required>
            </div>
          
            <div class="form-group">
              <label for="usrname" style="color: black;"><span class="glyphicon glyphicon-user"></span>이름</label>
              <input type="text" class="form-control"  name="name" id="usrname" placeholder="이름를 입력해주세요." required>
            </div>
            <div class="form-group">
              <label for="email" style="color: black;"><span class="glyphicon glyphicon-envelope"></span>이메일</label>
              <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요." required>
            </div>
         
              <button type="submit" id="pwbtn" class="btn btn-info btn-block"><span class="glyphicon glyphicon-off"></span>찾기</button>
          </form>

        </div>
      
      </div>
      
    </div>
  </div> 
  
   <!--오류 메시지1 Modal -->
  <div class="modal fade" id="errordial" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title glyphicon glyphicon-exclamation-sign" style="background: skyblue;"><strong>알림</strong></h4>
        </div>
        <div class="modal-body">
          <center><p style="color: black;">존재하지 않는 아이디/비밀번호 입니다.</p></center>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>

<!--오류 메시지2 Modal -->
  <div class="modal fade" id="emsgdial" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title glyphicon glyphicon-exclamation-sign" style="background: skyblue;"><strong>알림</strong></h4>
        </div>
        <div class="modal-body">
          <center><p id="emsg" style="color: black;">${emsg }</p></center>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>