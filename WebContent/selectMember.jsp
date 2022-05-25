<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<section>
	<form name=form>
		<br><h3 style="text-align:center;font-size:2em;">회원목록 조회/수정</h3><br>
		<table border=1 id=selectmember>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		<%@ include file="DBConn.jsp" %>
		<%
			
			
			try{
				String sql="select * from member0525";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				String custno=null;
				String custname=null;
				String phone=null;
				String address=null;
				Date date=null;
				String grade=null;
				String city=null;
				while(rs.next()){
					custno=rs.getString(1);
					custname=rs.getString(2);
					phone=rs.getString(3);
					address=rs.getString(4);
					date=rs.getDate(5);
					String g=rs.getString(6);
					if("A".equals(g)){
						grade="VIP";
					}else if("B".equals(g)){
						grade="일반";
					}else if("C".equals(g)){
						grade="직원";
					}
					city=rs.getString(7);
		%>
			<tr>
				<td><a href="updateMember.jsp?custno=<%=custno%>" style="color:white; text-decoration:none;" id=kk><%=custno %></a></td>
				<td><%=custname %></td>
				<td><%=phone %></td>
				<td><%=address %></td>
				<td><%=date %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
			</tr>
		<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		</table>
	</form>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>