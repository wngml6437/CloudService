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
<h1>
로그인  
</h1>
	<form action="/login" method="post">
		사원번호를 입력하세요 : <input name="memberNum"/><br>
		패스워드를 입력하세요 : <input type="password" name="pwd"/>
		<input type="submit" value="로그인"/>
		<input type="reset" value="취소"/>
	</form>
	<%@ include file= "../down.jsp"%>
</body>
</html>