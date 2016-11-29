<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>

<div class="error  ${param.error == true ? '' : 'hide'}">
  ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
</div>
<form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
  <fieldset>
    <legend>登陆</legend>
    用户： <input type="text" name="j_username" style="width:150px;" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}"/><br />
    密码： <input type="password" name="j_password" style="width:150px;" /><br />
    <input type="checkbox" name="_spring_security_remember_me" />两周之内不必登陆<br />
    <input type="submit" value="登陆"/>
    <input type="reset" value="重置"/>
  </fieldset>
</form>
</body>
</html>