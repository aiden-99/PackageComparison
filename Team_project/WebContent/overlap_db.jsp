<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   String sql;
   String name=request.getParameter("name");
   String nick=request.getParameter("nick");
   int num = Integer.parseInt(request.getParameter("num"));
   int count = Integer.parseInt(request.getParameter("count"));
   boolean flag=true;
   String pack="";
   String [] pack_list = new String[3];
   pack_list[0] = "pack1";
   pack_list[1] = "pack2";
   pack_list[2] = "pack3";
   try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      sql = "select * from nations where name='"+name+"'";
      rs = stmt.executeQuery(sql);
      rs.beforeFirst();
   }
   catch(Exception e){ 
      out.println("DB 연동 오류입니다.:" + e.getMessage());
   }
%>
<%   while(rs.next()){
      pack = rs.getString(num);
   }
   sql = "select * from member where nick='"+nick+"'";
   rs = stmt.executeQuery(sql);
   rs.beforeFirst();
   while(rs.next()){
      for(int i=6; i<6 + count; i++){
         if(pack.equals(rs.getString(i))){
            flag = false;
            break;
         }
      }   
   }
   if(flag){
	 //중복되는 것이 없는 경우
	 	count++;
	   sql = "update member set "+pack_list[count-1]+" = '"+pack+"',count = "+count+" where nick='"+nick+"'";
	   try{
	      stmt.executeUpdate(sql);
	   }
	   catch(Exception e){
	      out.println("DB 연동 오류입니다.:" + e.getMessage());
	   }
	   %><script>alert('패키지가 추가되었습니다'); location.href="correct.jsp?nick=<%=nick%>"</script> <%
   }
   else{
	   %><script>alert('중복된 패키지를 고르셨습니다'); history.back();</script><% 
   }
%>
</body>
</html>