<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>犬っぽい つぶやきログアウト</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #fff8e1; /* 犬っぽい温かみのある色 */
        margin: 0;
        padding: 0;
        color: #3e2723; /* 犬の毛色を意識した濃い茶色 */
    }
    header {
        background-color: #8d6e63; /* 犬の毛色を意識した温かい茶色 */
        color: white;
        padding: 20px;
        text-align: center;
        border-bottom: 5px solid #ffcc00; /* 犬の黄色っぽい色 */
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    header h1 {
        margin: 0;
        font-size: 3em;
        font-family: 'Comic Sans MS', cursive, sans-serif; /* 犬っぽいフォント */
        letter-spacing: 2px;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80vh;
    }
    .content {
        background-color: #ffeb3b; /* 犬の毛色に近い黄色 */
        padding: 40px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        border: 3px solid #ff9800; /* 明るいオレンジ色の枠線 */
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
        color: white;
        background-color: #ff9800; /* 犬の毛色に合うオレンジ色 */
        padding: 15px 30px;
        border-radius: 30px; /* 丸いボタン */
        margin-top: 20px;
        display: inline-block;
        transition: background-color 0.3s;
    }
    .content a:hover {
        background-color: #f57c00; /* ホバー時のオレンジ色 */
    }
    .paw-icon {
        width: 60px;
        height: 60px;
        background-image: url('paw-icon.png'); /* 犬の足跡アイコン */
        background-size: cover;
        margin: 20px auto;
    }
    .dog-tail {
        width: 60px;
        height: 60px;
        background-image: url('dog-tail.png'); /* 犬のしっぽのアイコン */
        background-size: cover;
        margin: 20px auto;
    }
    .bone-icon {
        width: 60px;
        height: 60px;
        background-image: url('dog-bone.png'); /* 犬の骨アイコン */
        background-size: cover;
        margin: 20px auto;
    }
</style>
</head>
<body>
<header>
    <h1>犬っぽい つぶやきログアウト</h1>
</header>

<div class="container">
    <div class="content">
        <!-- 犬の足跡アイコン -->
        <div class="paw-icon"></div>
        <!-- 犬のしっぽアイコン -->
        <div class="dog-tail"></div>
        <!-- 犬の骨アイコン -->
        <div class="bone-icon"></div>
        <p>ワンワン！お疲れ様！ログアウトしたよ！</p>
        <p>また遊びに来てね！</p>
        <a href="index.jsp">トップへ戻るワン！</a>
    </div>
</div>

</body>
</html>
