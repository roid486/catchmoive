<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)
		대표이사 : 서정사업자등록번호 : 104-81-45690	통신판매업신고번호 : 2017-서울용산-0662
		개인정보보호 책임자 : 마케팅 담당 정종민	대표이메일 : cjcgvmaster@cj.netCGV	고객센터 : 1544-1122
	</div>
	<div id="logindial" title="로그인">
      <center>
         <form action="login.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="c_id" placeholder="ID"><br>
                     <input type="password" name="c_pw" placeholder="PASSWORD">
                  </td>
                  <td>
                     <input type="submit" value="로그인">
                  </td>
               </tr>
               <tr>
                  <td><span id="scid">아이디</span>/<span id="scpw">비밀번호</span> 찾기</td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="sciddial" title="아이디찾기">
      <center>
         <form action="scid.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="name" placeholder="이름"><br>
                     <input type="text" name="email" placeholder="Email">
                  </td>
                  <td>
                     <input type="submit" value="찾기">
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="scpwdial" title="비밀번호찾기">
      <center>
         <form action="scpw.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="id" placeholder="ID"><br>
                     <input type="text" name="name" placeholder="이름"><br>
                     <input type="text" name="email" placeholder="Email">
                  </td>
                  <td>
                     <input type="submit" value="찾기">
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="errordial" title="오류">
      <center><span>존재하지 않는 아이디/비밀번호 입니다.</span></center>
   </div>
   <div id="emsgdial" title="오류">
      <center><span>${emsg }</span></center>
   </div>
</body>
</html>