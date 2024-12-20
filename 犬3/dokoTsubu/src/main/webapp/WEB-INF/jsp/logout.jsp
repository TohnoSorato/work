<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬つぶログアウト</title>
<style>
    body {
        font-family: 'Comic Sans MS', cursive, sans-serif;
        background-color: #faf3e0; /* 温かみのあるクリーム色 */
        margin: 0;
        padding: 0;
        color: #5d4037; /* 優しい濃い茶色 */
    }
    header {
        background-color: #a1887f; /* 落ち着いた茶色 */
        color: #ffffff;
        padding: 20px;
        text-align: center;
        border-bottom: 4px solid #ffcc80; /* 明るいアクセントカラー */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    }
    header h1 {
        margin: 0;
        font-size: 2.5em;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        letter-spacing: 2px;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
    .content {
       background-color: #fff8e1; /* 柔らかな黄色 */
        padding: 20px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        border: 3px solid #ffb74d; /* アクセントカカラー */
    }
    .content p {
        font-size: 1.3em;
        margin: 15px 0;
        color: #6d4c41; /* 温かい茶色 */
    }
    .content a {
        text-decoration: none;
        font-size: 1.1em;
        color: #ffffff;
        background-color: #ffab40; /* 明るいオレンジ */
        padding: 12px 30px;
        border-radius: 30px;
        margin-top: 20px;
        display: inline-block;
        transition: background-color 0.3s ease;
    }
    .content a:hover {
        background-color: #ff8a00; /* ホバー時に濃いオレンジ */
    }
    .icon {
        width: 60px;
        height: 0px;
        margin: 15px auto;
        background-size: cover;
    }
    .paw-icon {
        background-image: url('images/paw-icon.png'); /* 犬の足跡 */
    }
    .dog-tail {
        background-image: url('images/dog-tail.png'); /* 犬のしっぽ */
    }
    .bone-icon {
        background-image: url('images/dog-bone.png'); /* 犬の骨 */
    }
    /* 写真を追加するスタイル */
    .dog-photo {
        width: 100%;
        max-width: 300px;
        height: auto;
        margin-top: 20px;
        border-radius: 10px;
    }
</style>
</head>
<body>
<header>
    <h1>犬つぶログアウト</h1>
</header>

<div class="container">
    <div class="content">
        <!-- 犬の足跡アイコン -->
        <div class="icon paw-icon"></div>
        <!-- 犬のしっぽアイコン -->
        <div class="icon dog-tail"></div>
        <!-- 犬の骨アイコン -->
        <div class="icon bone-icon"></div>
        
        <!-- 犬の写真 -->
        <img src="images/dog5.jpg" alt="犬の写真" class="dog-photo">
        
        <p>ワンワン！お疲れ様！ログアウトしたよ！</p>
        <p>また遊びに来てね！</p>
        <a href="index.jsp">トップへ戻るワン！</a>
    </div>
</div>

</body>
</html>
