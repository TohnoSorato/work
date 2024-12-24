package model;

public class Post {
    private String message;
    private String imageUrl;
    private String createdAt;

    // コンストラクタ
    public Post(String message, String imageUrl, String createdAt) {
        this.message = message;
        this.imageUrl = imageUrl;
        this.createdAt = createdAt;
    }

    // ゲッターとセッター
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
