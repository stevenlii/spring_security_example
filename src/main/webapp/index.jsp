<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录首页</title>
</head>
<body>
<div>username : <sec:authentication property="name"/></div>
<span color="red">登录成功!</span>
<a href="<%=path %>/welcome">welcome</a>
</body>
</html>