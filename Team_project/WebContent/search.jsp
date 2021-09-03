<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="antiquewhite">
<h2>여행하고 싶은 나라 입력 </h2>
<form action="search2.jsp" method="post">
<input  type="hidden" name="nick" value="<%=request.getParameter("nick")%>">
<input type="text" name="nation">
<input type="submit" value="검색">
</form>
<a href="correct.jsp?nick=<%=request.getParameter("nick")%>">메인으로</a>
</body>
</html>