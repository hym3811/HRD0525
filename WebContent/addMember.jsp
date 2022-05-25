<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function check(){
		var doc=document.form;
		if(doc.custname.value==""){
			alert("[회원성명]\n회원성명을 입력하세요.");
			doc.custname.focus();
		}else if(doc.custname.value.length>20){
			alert("[회원성명]\n20자 이하로 작성하세요.");
			doc.custname.focus();
		}else if(doc.phone.value==""){
			alert("[회원전화]\회원전화를 입력하세요.");
			doc.phone.focus()
		}else if(doc.phone.value.length>13){
			alert("[회원전화]\n13자 이하로 작성하세요.");
			doc.phone.focus()
		}else if(doc.address.value==""){
			alert("[주소]\n주소를 입력하세요.");
			doc.address.focus();
		}else if(doc.address.value.length>60){
			alert("[주소]\n60자 이하로 작성하세요.");
			doc.address.focus();
		}else if(doc.grade.value==""){
			alert("[고객등급]\n고객등급을 입력하세요.");
			doc.grade.focus();
		}else if(doc.grade.value!="A"&&doc.grade.value!="B"&&doc.grade.value!="C"){
			alert("[고객등급]\n고객등급은 A,B,C 만 입력가능합니다.");
			doc.grade.focus();
		}else if(doc.city.value==""){
			alert("[거주도시]\n2거주도시를 입력하세요.");
			doc.city.focus();
		}else if(doc.city.value.length>2){
			alert("[거주도시]\n2자 이하로 작성하세요.");
			doc.city.focus();
		}else{
			doc.action="addMemberProcess.jsp";
			doc.submit();
		}
	}
	function search(){
		location.href="selectMember.jsp";
	}
</script>

</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	
	<section>
	<br>
		<h2 style="text-align:center;font-size:2em;">홈쇼핑 회원 등록</h2><br>
		<form name=form >
			<table border=2 style="width:40%;height:30%; margin:0 auto;">
				<tr>
				<%@ include file="DBConn.jsp" %>
				<%
					pstmt=null;
					rs=null;
					Integer custno=null;
					Date date=null;
					try{
						String sql="select max(custno) from member0525";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						if(rs.next()){
							custno=(rs.getInt(1)+1);
						}
						
						sql="select sysdate from dual";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						if(rs.next()){
							date=rs.getDate(1);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
					<th style="width:35%; height:30px;">회원번호(자동발생)</th>
					<td style="width:65%;"><input type=number name=custno value="<%=custno %> "readonly style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">회원성명</th>
					<td><input type=text name=custname style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">회원전화</th>
					<td><input type=text name=phone style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">회원주소</th>
					<td><input type=text name=address style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">가입일자</th>
					<td><input type=text name=joindate value="<%=date%>" readonly style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">고객등급[A:VIP|B:일반|C:직원]</th>
					<td><input type=text name=grade style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<th style="width:35%; height:30px;">도시코드</th>
					<td><input type=text name=city style="width:99%; height:30px;"></td>
				</tr>
				<tr>
					<td colspan="2" style="height:30px;text-align:center;">
						<input type=button value="등록" onclick=check() style="width:120px;height:30px;margin-right:5%;">
						<input type=button value="조회" onclick=search() style="width:120px;height:30px;">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<%@ include file="footer.jsp" %>

</body>
</html>