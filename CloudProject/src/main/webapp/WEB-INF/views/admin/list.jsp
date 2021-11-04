<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file= "../head.jsp"%>
</head>
<body>
<%@ include file= "../up.jsp"%>
			<h1>사원 목록</h1>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>직급</th>
			<th>부서</th>
		</tr>
		<c:forEach var="member" items="${memberList}"> <!-- var와 items 변경시 컨트롤+F 로 변경 -->
		<tr>
							<!-- @PathVariable -->
			<td><a href="/info/${member.memberNum}">${member.memberNum}</a></td>
			<td>${member.name}</td>
			<td>${member.phone}</td>
			<td>${member.position}</td>
			<td>${member.department}</td>
		</tr>
		</c:forEach>
	</table>
	<%@ include file= "../down.jsp"%>
</body>
</html>