<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/print_package.css" />
<title>Insert title here</title>
</head>
<body>
<% 
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   ResultSet rs1 = null;
   String sql="",sql1;
   int count=3;
   String url1,url2,url3;
   String name=request.getParameter("name");
   String nick=request.getParameter("nick");
   String map = "";
   try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      sql = "select * from nations where name='"+name+"'";
      sql1 = "select * from member where nick='"+nick+"'";
      rs1 = stmt.executeQuery(sql1);
      rs1.beforeFirst();
   }
   catch(Exception e){ 
      out.println("DB 연동 오류입니다.:" + e.getMessage());
   }
%>
<%
   while(rs1.next()){
     count = rs1.getInt("count");
   }
   rs = stmt.executeQuery(sql);
   rs.beforeFirst();
%>
<div id = "container">
<ul class="h">
<li style="width:450px"><%=request.getParameter("nick") %>님 반갑습니다.</li> 
<li style="width:100px"><a href="correct.jsp?nick=<%=request.getParameter("nick")%>">메인으로</a></li>
<li style="width:100px"><a href="login.jsp">로그아웃</a></li>
<li style="width:50px"><a href="MyPage.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\menu.jpg" alt = "메뉴" class="img_button"></img></a></li>
</ul>
<hr style="border: solid 0.5px black;">
<%
   if(name.equals("china")){
      map = "image/china.jpg";
%>
<div class="nation"><center>중국 여행 패키지</center></div>
<%}
   else if(name.equals("japan")){
      map = "image/japan.jpg";
%>
<div class="nation"><center>일본 여행 패키지</center></div>
<%}
   else if(name.equals("philippines")){
      map = "image/philippines.jpg";
%>
<div class="nation"><center>필리핀 여행 패키지</center></div>
<%}
   else if(name.equals("brazil")){
      map = "image/brazil.jpg";
%>
<div class="nation"><center>브라질 여행 패키지</center></div>
<%}
   else if(name.equals("argentina")){
      map = "image/argentina.jpg";
%>
<div class="nation"><center>아르헨티나 여행 패키지</center></div>
<%}
   else if(name.equals("colombia")){
      map = "image/colombia.jpg";
%>
<div class="nation"><center>콜롬비아 여행 패키지</center></div>
<%}
   else if(name.equals("UK")){
      map = "image/UK.jpg";
%>
<div class="nation"><center>영국 여행 패키지</center></div>
<%}
   else if(name.equals("france")){
      map = "image/france.jpg";
%>
<div class="nation"><center>프랑스 여행 패키지</center></div>
<%}
   else if(name.equals("germany")){
      map = "image/germany.jpg";
%>
<div class="nation"><center>독일 여행 패키지</center></div>
<%} %>
<div id="map"><img src=<%=map %> alt="지도"></div>
<div id="pack">
<%while(rs.next()){
   if(count < 3){
%>
<ul id = "package_list">
<%for(int i=2;i<5;i++){%>         
   <li id = "package"><a href="<%=rs.getString(i) %>" target="_blank">패키지<%=i-1%></a><button onclick="location.href='overlap_db.jsp?name=<%=name%>&nick=<%=nick%>&num=<%=i%>&count=<%=count%>'"><img src="image/plus.png"></button></li>
<%}%>
</ul>
<%
}
   else{
      %>
      <script>alert("찜한 패키지의 수가 많아서 추가할 수 없습니다. 추가를 원할 시에 찜한 패키지를 삭제해주세요.")</script> 
      <ul id = "package_list">
<%for(int i=2;i<5;i++){%> 
   <li id = "package"><a href="<%=rs.getString(i) %>" target="_blank">패키지<%=i-1%></a></li>
<%}%>
</ul>  
<% }
} %>
</div>
</div>
</body>
</html>