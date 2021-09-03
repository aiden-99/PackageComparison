<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="antiquewhite">
<link rel="stylesheet" type="text/css" href="css/login.css" />
<!-- 로그인화면 -->
<div style="border:1px solid black; width:630px;">
<form action="matching.jsp" method="post">
<label for="id">id</label>
<input type="text" name="id" id="id">
<label for="pwd">pwd</label>
<input type="password" name="pwd" id="pwd">
<input type= "submit" value="로그인">
<input type="reset" value="다시쓰기">
<input type="button" value="회원가입" onclick="location.href='joinUs.html'">
</form>
<br>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여행 패키지 비교<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;웹페이지
</h1>
</div>
</body>
</html>