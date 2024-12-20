<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬つぶやき</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #fdf5e6; /* 柔らかなベージュ */
        margin: 0;
        padding: 0;
        color: #5d4037; /* 犬の毛のような茶色 */
        overflow: hidden; /* スクロールを防ぐ */
    }
    header {
        background-color: #f9a825; /* 明るい犬の元気なオレンジ */
        color: #ffffff;
        padding: 20px;
        text-align: center;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 3em;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 犬らしい楽しいフォント */
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* 影をつけて強調 */
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
    .form-container {
        background-color: #fff3e0; /* 柔らかいクリーム色 */
        padding: 40px;
        width: 400px;
        border-radius: 10px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .form-container h2 {
        font-size: 2.5em;
        margin-bottom: 20px;
        color: #ff7043; /* 少し鮮やかなオレンジ */
        font-family: 'Comic Sans MS', cursive, sans-serif;
        text-transform: uppercase; /* 大文字にして活気を出す */
    }
    .form-container input[type="text"],
    .form-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #d7ccc8; /* 優しいベージュ系のボーダー */
        border-radius: 5px;
        font-size: 1.1em;
        background-color: #ffffff;
    }
    .form-container input[type="submit"] {
        background-color: #ff7043; /* 犬の首輪のような明るいオレンジ */
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 5px;
        font-size: 1.2em;
        cursor: pointer;
        width: 100%;
        margin-top: 20px;
        font-family: 'Comic Sans MS', cursive, sans-serif;
    }
    .form-container input[type="submit"]:hover {
        background-color: #e64a19;
    }
    .form-container a {
        display: inline-block;
        margin-top: 15px;
        font-size: 1em;
        color: #ff7043; /* オレンジでリンクを統一 */
        text-decoration: none;
    }
    .form-container a:hover {
        text-decoration: underline;
    }
    video.background-video {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1;
    }
    .dog-message {
        font-size: 1.5em;
        color: #ff7043;
        margin-top: 20px;
        font-weight: bold;
        font-family: 'Comic Sans MS', cursive, sans-serif;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
    }
    .dog-image {
        width: 120px;
        margin-top: 20px;
    }
    .form-container {
        background-image: url('../images/dog-bone-pattern.png');
        background-repeat: repeat;
        background-color: #fff8e1; /* 画像が見えない場合でもベースを優しい色に */
    }
</style>
</head>
<body>


<video class="background-video" autoplay muted loop>
   <video src="../../videos/dog-video.mp4" controls></video>

    お使いのブラウザは動画タグに対応していません。
</video>

<header>
    <h1>犬つぶ</h1>
</header>

<div class="container">
    <div class="form-container">
        <h2>ワンちゃんと一緒にログインしよう！</h2>
        <form action="Login" method="post">
            <label for="name">ユーザー名：</label>
            <input type="text" id="name" name="name" required><br>
            <label for="pass">パスワード：</label>
            <input type="password" id="pass" name="pass" required><br>
            <input type="submit" value="ワン！ログイン">
        </form>
        <a href="#">パスワードを忘れたワン？</a>
        <p class="dog-message">ワンちゃんも元気にお待ちしてます！🐾</p>
   

    </div>
</div>

</body>
</html>
