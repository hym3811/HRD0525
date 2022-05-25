<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	pstmt=null;
	rs=null;
	String custno=request.getParameter("custno");
	String custname=request.getParameter("custname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String d=request.getParameter("joindate");
	String da=d.substring(0, 10);
	String[] date=da.split("-");
	String joindate=date[0]+date[1]+date[2];
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
	try{
		String sql="insert into member0525 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.executeUpdate();
%>
<script>
	alert("회원정보 등록 성공");
	location.href="index.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>