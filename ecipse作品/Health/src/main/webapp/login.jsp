<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<style>
  body { font-family: Arial, sans-serif; background-color: #f0f8ff; color: #333; text-align: center; }
  h1 { background-color: #4CAF50; color: white; padding: 20px; margin: 0; }
  form { margin-top: 30px; background-color: #ffffff; border-radius: 8px; padding: 20px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); display: inline-block; }
  input[type="text"], input[type="password"] { padding: 10px; margin: 10px; border: 1px solid #ccc; border-radius: 4px; width: 200px; font-size: 16px; }
  input[type="submit"] { padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
  input[type="submit"]:hover { background-color: #45a049; }
</style>
</head>
<body>
<h1>ログイン</h1>

<% if (request.getAttribute("errorMessage") != null) { %>
  <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>

<form action="Login" method="post">
  ユーザー名：<input type="text" name="username" required><br>
  パスワード：<input type="password" name="password" required><br>
  <input type="submit" value="ログイン">
</form>

</body>
</html>
