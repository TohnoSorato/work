<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%
// セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬っぽいつぶやきログイン</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #fffaf0; /* 犬の毛色に近い温かみのあるベージュ */
        margin: 0;
        padding: 0;
        color: #3e2723; /* 犬の毛色に合う濃い茶色 */
    }
    header {
        background-color: #8d6e63; /* 犬の毛色を意識した温かい茶色 */
        color: white;
        padding: 20px;
        text-align: center;
        border-bottom: 5px solid #ffcc00; /* 明るい犬の黄色 */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 3em;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 可愛らしい犬っぽいフォント */
        letter-spacing: 2px;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
    .content {
        background-color: #fff3e0; /* 犬の毛色に近い温かいオレンジ色 */
        padding: 40px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        border: 3px solid #f57c00; /* オレンジ色の枠線 */
    }
    .content p {
        font-size: 1.5em;
        margin: 20px 0;
        font-family: 'Comic Sans MS', cursive, sans-serif;
        color: #3e2723; /* 濃い茶色 */
    }
    .content a {
        text-decoration: none;
        font-size: 1.2em;
        color: #fff;
        background-color: #ff9800; /* 犬の明るい毛色に合うオレンジ色 */
        padding: 15px 30px;
        border-radius: 30px; /* 丸いボタン */
        margin-top: 20px;
        display: inline-block;
        transition: background-color 0.3s;
    }
    .content a:hover {
        background-color: #f57c00; /* ホバー時のオレンジ色 */
    }
    .error-msg, .success-msg {
        padding: 15px;
        border-radius: 10px;
        font-size: 1.2em;
        margin-top: 20px;
        color: white;
    }
    .error-msg {
        background-color: #d32f2f; /* 犬の怖い顔の赤色 */
    }
    .success-msg {
        background-color: #388e3c; /* 犬の元気な緑色 */
    }
    /* 犬の足跡アイコン */
    .paw-icon {
        width: 50px;
        height: 50px;
        background-image: url('paw-icon.png'); /* 足跡のアイコンを設定 */
        background-size: cover;
        margin: 20px auto;
    }
    /* 犬の耳のアイコン */
    .ear-icon {
        width: 60px;
        height: 60px;
        background-image: url('dog-ears.png'); /* 犬の耳のアイコン */
        background-size: cover;
        margin: 20px auto;
    }
</style>
</head>
<body>
<header>
    <h1>犬っぽい つぶやきログイン</h1>
</header>

<div class="container">
    <div class="content">
        <!-- 犬の足跡アイコン -->
        <div class="paw-icon"></div>
        <!-- 犬の耳アイコン -->
        <div class="ear-icon"></div>
        <% if(loginUser != null) { %>
            <div class="success-msg">
                <p>ワンワン！ログイン成功だよ！</p>
                <p><%= loginUser.getName() %>さん、ようこそ！</p>
                <a href="Main">つぶやき投稿・閲覧へワン！</a>
            </div>
        <% } else { %>
            <div class="error-msg">
                <p>ワンワン！ログイン失敗だよ...</p>
                <a href="index.jsp">TOPに戻るワン！</a>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
