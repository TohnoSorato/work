<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User,model.Mutter,java.util.List" %>
<%
User loginUser = (User) session.getAttribute("loginUser");
List<Mutter> mutterList = (List<Mutter>) request.getAttribute("mutterList");
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>わんダフルタイム</title>
<style>
    body {
        font-family: 'Comic Sans MS', cursive, sans-serif;
        background-color: #fff8dc;
        margin: 0;
        padding: 0;
        color: #5d4037;
    }
    header {
        background-color: #a1887f;
        color: white;
        padding: 20px 10px;
        text-align: center;
        border-bottom: 5px solid #ffcc80;
    }
    header h1 {
        margin: 0;
        font-size: 2.5rem;
        letter-spacing: 2px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }
    .content {
        margin: 20px auto;
        max-width: 800px;
        padding: 20px;
        background-color: #fff3e0;
        border-radius: 15px;
        box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
    }
    .content p {
        font-size: 1.1rem;
        margin-bottom: 10px;
    }
    .content a {
        color: #ff7043;
        text-decoration: none;
        margin-right: 10px;
        font-weight: bold;
    }
    .content a:hover {
        text-decoration: underline;
    }
    .content form {
        margin-bottom: 30px;
        text-align: center;
    }
    .content input[type="text"],
    .content input[type="file"] {
        display: block;
        width: 90%;
        max-width: 400px;
        margin: 10px auto;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1rem;
    }
    .content input[type="submit"] {
        padding: 10px 20px;
        background-color: #ff7043;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1.2rem;
        cursor: pointer;
    }
    .content input[type="submit"]:hover {
        background-color: #d84315;
    }
    .mutter {
        background-color: #fff8e1;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        position: relative;
    }
    .mutter .user-name {
        font-weight: bold;
        color: #3e2723;
        font-size: 1.1rem;
        margin-bottom: 5px;
    }
    .mutter .text {
        color: #5d4037;
        font-size: 1rem;
        margin-bottom: 10px;
    }
    .mutter .timestamp {
        font-size: 0.9rem;
        color: #757575;
    }
    .mutter img {
        max-width: 100%;
        height: auto;
        margin-top: 10px;
        border-radius: 5px;
    }
    .mutter video {
        width: 100%;
        margin-top: 10px;
        border-radius: 5px;
    }
    .mutter .actions {
        margin-top: 10px;
        display: flex;
        align-items: center;
    }
    .mutter .like-count {
        font-size: 0.9rem;
        color: #5d4037;
        margin-right: 10px;
    }
    .mutter .like-button {
        padding: 5px 10px;
        background-color: #ff7043;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 0.9rem;
        cursor: pointer;
    }
    .mutter .like-button:hover {
        background-color: #e64a19;
    }
    .error-msg {
        background-color: #e74c3c;
        color: white;
        padding: 10px;
        border-radius: 5px;
        margin-top: 20px;
        text-align: center;
        font-size: 1rem;
    }
    .paw-icon {
        width: 40px;
        height: 40px;
        background-image: url('paw-icon.png');
        background-size: cover;
        position: absolute;
        top: 10px;
        right: 10px;
    }
    @media (max-width: 600px) {
        header h1 {
            font-size: 2rem;
        }
        .content {
            padding: 15px;
        }
        .content input[type="text"],
        .content input[type="file"] {
            width: 100%;
        }
    }
</style>
</head>
<body>
<header>
    <h1>わんダフルタイム</h1>
</header>

<div class="content">
    <p><%= loginUser.getName() %>さん、ログイン中</p>
    <a href="Logout">ログアウト</a>
    <a href="Main">更新</a>

    <form action="Main" method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="つぶやく内容を入力" required>
        <input type="file" name="image" accept="image/*, video/*"> <!-- 動画も選択できるように変更 -->
        <input type="submit" value="つぶやく">
    </form>

    <% if (errorMsg != null) { %>
    <div class="error-msg">
        <%= errorMsg %>
    </div>
    <% } %>

    <% if (mutterList != null && !mutterList.isEmpty()) { %>
        <% for (Mutter mutter : mutterList) { %>
            <div class="mutter">
                <div class="paw-icon"></div>
                <p class="user-name"><%= mutter.getUserName() %>：</p>
                <p class="text"><%= mutter.getText() %></p>
                <% if (mutter.getImagePath() != null) { %>
                    <% if (mutter.getImagePath().endsWith(".mp4") || mutter.getImagePath().endsWith(".mov")) { %>
                        <video controls>
                            <source src="<%= request.getContextPath() + mutter.getImagePath() %>" type="video/mp4">
                            動画を再生できません。
                        </video>
                    <% } else { %>
                        <img src="<%= request.getContextPath() + mutter.getImagePath() %>" alt="投稿画像">
                    <% } %>
                <% } %>
                <p class="timestamp">投稿日時: 2024/12/19</p>
                <div class="actions">
                    <span class="like-count">いいね: <%= mutter.getLikes() %></span>
                    <form action="Like" method="post" style="display: inline;">
                        <input type="hidden" name="mutterId" value="<%= mutter.getId() %>">
                        <button type="submit" class="like-button">いいね</button>
                    </form>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <p>つぶやきはありません。</p>
    <% } %>
</div>
</body>
</html>
