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
<title>犬っぽい つぶやき</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #ffeb3b; /* 犬っぽい温かみのある黄色 */
        margin: 0;
        padding: 0;
        color: #3e2723; /* 濃い茶色 */
    }
    header {
        background-color: #8d6e63; /* 犬の毛色を意識した茶色 */
        color: white;
        padding: 20px 10px;
        text-align: center;
        border-bottom: 5px solid #ffcc00; /* 犬の黄色っぽい色 */
    }
    header h1 {
        margin: 0;
        font-size: 2.5rem;
        letter-spacing: 2px;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 可愛らしいフォント */
    }
    .content {
        margin: 20px auto;
        max-width: 800px;
        padding: 20px;
        background-color: #fff8e1; /* 犬の毛色に近い色 */
        border-radius: 15px;
        box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
    }
    .content p {
        font-size: 1.1rem;
        margin-bottom: 10px;
    }
    .content a {
        color: #3498db;
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
        background-color: #e67e22; /* オレンジ色 */
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1.2rem;
        cursor: pointer;
    }
    .content input[type="submit"]:hover {
        background-color: #d35400;
    }
    .mutter {
        background-color: #fff8e1; /* 犬の毛色に近い色 */
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        position: relative;
    }
    .mutter .user-name {
        font-weight: bold;
        color: #2c3e50;
        font-size: 1.1rem;
        margin-bottom: 5px;
    }
    .mutter .text {
        color: #555;
        font-size: 1rem;
        margin-bottom: 10px;
    }
    .mutter .timestamp {
        font-size: 0.9rem;
        color: #aaa;
    }
    .mutter img {
        max-width: 100%;
        height: auto;
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
        color: #555;
        margin-right: 10px;
    }
    .mutter .like-button {
        padding: 5px 10px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 0.9rem;
        cursor: pointer;
    }
    .mutter .like-button:hover {
        background-color: #2980b9;
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
        background-image: url('paw-icon.png'); /* 犬の足跡アイコン */
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
    <h1>犬っぽい つぶやき</h1>
</header>

<div class="content">
    <p><%= loginUser.getName() %>さん、ログイン中</p>
    <a href="Logout">ログアウト</a>
    <a href="Main">更新</a>

    <form action="Main" method="post" enctype="multipart/form-data">
        <input type="text" name="text" placeholder="つぶやく内容を入力" required>
        <input type="file" name="image" accept="image/*">
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
                <!-- 犬の足跡アイコン -->
                <div class="paw-icon"></div>
                <p class="user-name"><%= mutter.getUserName() %>：</p>
                <p class="text"><%= mutter.getText() %></p>
                <% if (mutter.getImagePath() != null) { %>
                    <img src="<%= request.getContextPath() + mutter.getImagePath() %>" alt="投稿画像">
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
