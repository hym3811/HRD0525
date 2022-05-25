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
		<br><h3 style="text-align:center;font-size:2em;">회원 매출 조회</h3><br>
		<table border=1 style="margin:0 auto;width:30%;" id=sales>
		<%@ include file="DBConn.jsp" %>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		<%
			try{
				String sql="select member0525.custno, custname, grade, sum(price) from member0525,money0525 where member0525.custno=money0525.custno group by member0525.custno, custname, grade order by sum(price) desc";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String custno=rs.getString(1);
					String custname=rs.getString(2);
					String g=rs.getString(3);
					String grade=null;
					if("A".equals(g)){
						grade="VIP";
					}else if("B".equals(g)){
						grade="일반";
					}else if("C".equals(g)){
						grade="직원";
					}
					Integer sum=rs.getInt(4);
		%>
			<tr>
				<td style="height:30px;"><%=custno %></td>
				<td><%=custname %></td>
				<td><%=grade %></td>
				<td><%=sum %></td>
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