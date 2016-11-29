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
    <h1>user login</h1> 
    <form action="j_spring_security_check" method="post"> 
        用户名<input type="text" name="j_username"/><br/> 
        密码<input type="password" name="j_password"/><br/> 
        <input type="submit" value="submit"/> 
    </form>
    <div>
    <img alt="nonononononon" src="<%=path %>/img/123.png">

    </div>
</body>
</html>