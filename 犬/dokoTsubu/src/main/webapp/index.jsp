<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬っぽい つぶやき</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        color: #2c3e50;
        overflow: hidden; /* スクロールを防ぐ */
    }
    header {
        background-color: rgba(255, 165, 0, 0.8); /* 犬に関連するオレンジ色 */
        color: white;
        padding: 20px;
        text-align: center;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        z-index: 2;
        position: relative;
    }
    header h1 {
        margin: 0;
        font-size: 3em;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 犬らしい楽しいフォント */
        color: #f9a825;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* 影をつけて強調 */
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
        z-index: 2;
        position: relative;
    }
    .form-container {
        background-color: #fff8e1; /* 犬の骨のような色合い */
        padding: 40px;
        width: 400px;
        border-radius: 10px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .form-container h2 {
        font-size: 2.5em;
        margin-bottom: 20px;
        color: #e67e22;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 犬らしい楽しいフォント */
        text-transform: uppercase; /* 大文字にして活気を出す */
    }
    .form-container input[type="text"],
    .form-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #bdc3c7;
        border-radius: 5px;
        font-size: 1.1em;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* フォーム入力に犬らしいフォント */
        background-color: #fff;
    }
    .form-container input[type="submit"] {
        background-color: #e67e22; /* 犬のリードに似た色 */
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
        background-color: #d35400;
    }
    .form-container a {
        display: inline-block;
        margin-top: 15px;
        font-size: 1em;
        color: #2980b9;
        text-decoration: none;
        font-family: 'Comic Sans MS', cursive, sans-serif;
    }
    .form-container a:hover {
        text-decoration: underline;
    }
    /* 動画のスタイル */
    video.background-video {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1; /* 背景として表示 */
    }
    .dog-message {
        font-size: 1.5em;
        color: #e67e22;
        margin-top: 20px;
        font-weight: bold;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 犬らしいフォント */
        text-transform: uppercase;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5); /* 影で強調 */
    }
    .dog-image {
        width: 120px;
        margin-top: 20px;
    }
    /* 犬の骨のパターンを背景に */
    .form-container {
        background-image: url('../images/dog-bone-pattern.png');
        background-repeat: repeat;
    }
</style>
</head>
<body>

<video class="background-video" autoplay muted loop>
    <source src="../videos/dog-video.mp4" type="video/mp4"> <!-- 犬の動画ファイルのパス -->
    お使いのブラウザは動画タグに対応していません。
</video>

<header>
    <h1>犬っぽい つぶやき</h1>
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
        <img src="../images/dog-icon.png" alt="犬のアイコン" class="dog-image"> <!-- 犬のアイコン -->
    </div>
</div>

</body>
</html>
