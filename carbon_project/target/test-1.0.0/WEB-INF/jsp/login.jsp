<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="login/member.do">
      <input type="text" name="member_id" placeholder="username"/>
      <input type="password" name="member_pwd" placeholder="password"/>
      <button type= "submit">login</button>
    </form>
  </div>
</div>

</body>
</html>