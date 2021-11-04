<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta charset="UTF-8">
<html>
<head>
<%@ include file= "../headBack.jsp"%>
</head>
<body>
<%@ include file= "../up.jsp"%>
		<c:url var="actionURL" value="/upload/movetoshare"/>
		<form action="${actionURL}" method="post" enctype="multipart/form-data" class="form-horizontal">
		<table border="1">
			<tr>
				<th>파일코드</th>
				<th>파일이름</th>
				<th>업데이트 날짜</th>
				<th>파일 설명</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="personalFile" items="${personalFile}">
			<tr>
				<td><input type="checkbox" name="fileCode" value="${personalFile.fileCode}">${personalFile.fileCode}</td>
				<td><a href="<c:url value='/download/${personalFile.fileCode }'/>">${personalFile.fileName}</a></td>
				<td>${personalFile.updateDate}</td>
				<td>${personalFile.fileExplanation}</td>
				<td><a href="<c:url value='/upload/delete/${personalFile.fileCode}'/>" class = "delete">삭제</a>
			</tr>
			</c:forEach>
		</table>
			<input type="submit" value="공유하기" class="share_check">
		</form>
		<form action="/upload/upload" method="post" enctype="multipart/form-data">
			<input type="file" name="file"><p>
			 파일 설명 : <input type="text" name="text1">
			<input type="submit" value="파일업로드" class="upload_check">
		</form>
		<form action="/upload">
			<input type="submit" value="돌아가기">
		</form>
		<%@ include file= "../downback.jsp"%>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$(".share_check").click(function(){
		alert("공유 완료했습니다.");
	})
});

/* $(document).ready(function(){
	$(".upload_check").click(function(){
		alert("파일을 올려주세요.");
	})
}); */
</script>
</html>
