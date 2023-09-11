<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@ include file="layout/db_connect.jsp" %>
<%
String sql="select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') joindate, grade, city  from member_tbl_02 where custno=" +  request.getParameter("custno");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="./css/style.css?ver1.1.4">
	<script type="text/javascript">
		
		
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">회원정보조회</h2>
		<form name="data" method="post" action="join_p.jsp" onsubmit="return checkValue()">
		<table class="table_line">
		
		<% if(rs.next()) {  %>
		<tr>
			<th>회원번호</th>
			<td><%= rs.getString("custno") %></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><%= rs.getString("custname") %></td>
		</tr>
		<tr>
			<th>전화</th>
			<td><%= rs.getString("phone") %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%= rs.getString("address") %></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><%= rs.getString("joindate") %></td>
		</tr>
		<tr>
			<th>고객등급(A-VIP B-일반 C-직원)</th>
			<td><%= rs.getString("grade") %></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><%= rs.getString("city") %></td>
		</tr>
		<%}else { %>
			<tr>
				<th>회원번호</th>
				<td><%= request.getParameter("custno") %>의 번호가 존재하지 않습니다.</td>
			</tr>
		<% } %>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="다시조회" onclick="location.href='z_input.jsp'">
			<input type="button" value="회원목록조회/수정" onclick="location.href='member_list.jsp'">
			</td>
		</tr>
		</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>