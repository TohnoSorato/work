<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import="model.Health" %>
<%
// リクエストスコープに保存されたHealthを取得
Health health = (Health) request.getAttribute("health");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康診断の結果</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f8ff;
    color: #333;
    margin: 0;
    padding: 0;
    text-align: center;
  }
  h1 {
    background-color: #4CAF50;
    color: white;
    padding: 20px;
    margin: 0;
  }
  .result {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 30px;
    display: inline-block;
  }
  .result p {
    font-size: 18px;
  }
  .back-button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 20px;
  }
  .back-button:hover {
    background-color: #45a049;
  }
</style>
</head>
<body>
<h1>健康診断の結果</h1>

<div class="result">
  <p>身長：<%= health.getHeight() %> cm</p>
  <p>体重：<%= health.getWeight() %> kg</p>
  <p>BMI：<%= health.getBmi() %></p>
  <p>体格：<%= health.getBodyType() %></p>
  <button class="back-button" onclick="location.href='HealthCheck'">戻る</button>
</div>

</body>
</html>
