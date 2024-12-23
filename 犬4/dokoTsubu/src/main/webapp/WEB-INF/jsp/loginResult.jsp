<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%
User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬つぶログイン</title>
<style>
    body {
        font-family: 'Comic Sans MS', cursive, sans-serif;
        background-color: #faf3e0;
        /* オリジナル肉球模様の背景 */
        background-image: 
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 0 0, 
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 50px 50px,
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 0 100px, 
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 50px 150px,
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 100px 0, 
            radial-gradient(circle, #8e7a65 15%, transparent 15%) 150px 50px;
        background-size: 200px 200px; /* 背景模様のサイズ */
        background-position: 0 0, 100px 100px, 200px 0, 300px 100px, 400px 0, 500px 100px;
        background-repeat: repeat; /* 背景を繰り返し表示 */
        margin: 0;
        padding: 0;
        color: #5d4037;
        height: 100vh; /* 背景が画面全体に広がる */
    }
    header {
        background-color: #a1887f;
        color: #ffffff;
        padding: 20px;
        text-align: center;
        border-bottom: 4px solid #ffcc80;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 2.5em;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.3);
        letter-spacing: 2px;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 80vh;
    }
    .content {
        background-color: rgba(255, 248, 225, 0.9);
        padding: 40px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        border: 3px solid #ffb74d;
    }
    .content p {
        font-size: 1.3em;
        margin: 15px 0;
        color: #6d4c41;
    }
    .content a {
        text-decoration: none;
        font-size: 1.1em;
        color: #ffffff;
        background-color: #ffab40;
        padding: 12px 30px;
        border-radius: 30px;
        margin-top: 20px;
        display: inline-block;
        transition: background-color 0.3s;
    }
    .content a:hover {
        background-color: #ff8a00;
    }
    .msg {
        font-size: 1.5em;
        margin: 20px 0;
        padding: 15px;
        border-radius: 10px;
        font-weight: bold;
    }
    .success-msg {
        background-color: #dcedc8;
        color: #33691e;
    }
    .error-msg {
        background-color: #ffccbc;
        color: #b71c1c;
    }
</style>
</head>
<body>
<header>
    <h1>犬つぶログイン</h1>
</header>

<div class="container">
    <div class="content">
        <% if (loginUser != null) { %>
        <img src="images/dog4.jpg" alt="喜んでいる犬" style="width:100%; border-radius:15px; margin-top:20px;">
            <div class="msg success-msg">
                ワンワン！ログイン成功だよ！<br>
                <%= loginUser.getName() %>さん、ようこそ！
            </div>
            <a href="Main">つぶやき投稿・閲覧へワン！</a>
        <% } else { %>
                    <img src="images/dog6.jpg" alt="悲しんでいる犬" style="width:100%; border-radius:15px; margin-top:20px;">
            <div class="msg error-msg">
                ワンワン！ログイン失敗だよ...<br>
            </div>
           
            <a href="index.jsp">TOPに戻るワン！</a>
        <% } %>
    </div>
</div>

</body>
</html>
