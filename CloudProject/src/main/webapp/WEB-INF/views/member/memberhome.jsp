<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>클라우드</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Blueprint: A basic template for a responsive multi-level menu" />
<meta name="keywords" content="blueprint, template, html, css, menu, responsive, mobile-friendly" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="favicon.ico">
<!-- food icons -->
<link rel="stylesheet" type="text/css" href="css/organicfoodicons.css" />
<!-- demo styles -->
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!-- menu styles -->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr-custom.js"></script>
</head>
<body>
<%@ include file= "../up.jsp"%>
	사원들의 홈 페이지 입니다.<P>
	${memberVO.name } 님 로그인 되었습니다.<p>
	
	<a href="/logout">로그아웃 하기</a><p>
	<a href="/adminhome">관리자 홈페이지로 이동</a><p>

	<a href="/board/boardList">공지사항 보기</a>
	<a href="/send">전송하기</a><p>
	<a href="/upload">파일 올리기</a><p>
	<%@ include file= "../down.jsp"%>
</body>
</html>