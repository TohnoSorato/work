package model;

public class Mutter {
    private int id;            // 各つぶやきのID
    private String userName;   // 投稿者の名前
    private String text;       // 投稿内容
    private String imagePath;  // 画像パス
    private String videoPath;  // 動画パス
    private int likes;         // いいね数

    private static int idCounter = 0; // 自動的にIDを割り振るためのカウンタ

    public Mutter(String userName, String text, String imagePath, String videoPath) {
        this.id = ++idCounter;  // 自動的にユニークなIDを割り振る
        this.userName = userName;
        this.text = text;
        this.imagePath = imagePath;
        this.videoPath = videoPath;
        this.likes = 0;         // 初期値は0
    }

    public Mutter(int id2, String userName2, String text2) {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getText() {
        return text;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public int getLikes() {
        return likes;
    }

    public void addLike() {
        this.likes++; // いいね数を加算
    }
}
