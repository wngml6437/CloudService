<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= "../headBack2.jsp"%>
</head>
<body>
<%@ include file= "../up.jsp"%>
${board.boardTitle}<br>
${board.boardContent}<br>
${board.boardDate}<br>

<a href='<c:url value="/board/boardUpdate/${board.contentNum }"/>'>수정하기</a> 
<a href='<c:url value="/board/boardDelete?contentNum=${board.contentNum }"/>'>삭제하기</a>
<br>
-----댓글------<br>
<table>
<c:forEach var="comment" items="${commentList}">
<tr>
<td>${comment.commentContent }</td>
<td>${comment.memberNum }</td>
<td>${comment.commentDate }</td>
<td><a href='<c:url value="/board/boardCommentDelete?commentNum=${comment.commentNum }&contentNum=${comment.contentNum }"/>'>삭제</a></td>
</tr>
</c:forEach>
</table>
<c:url var= "actionURL" value='/board/boardReply' />
<form action ="${actionURL}" method="post">
	<textArea rows="5" cols="30" name="comment"> </textArea>
	<input type="hidden" name="contentNum" value="${board.contentNum}">
	<input type="submit" value="입력" >

</form>
<%@ include file= "../downback2.jsp"%>
</body>
</html>