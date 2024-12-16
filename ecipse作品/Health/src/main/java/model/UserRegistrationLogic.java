package model;

import java.util.HashMap;
import java.util.Map;

public class UserRegistrationLogic {
    private static Map<String, User> userDatabase = new HashMap<>();

    public boolean registerUser(User user) {
        // ユーザーがすでに存在するかチェック
        if (userDatabase.containsKey(user.getUsername())) {
            return false; // ユーザー名がすでに存在
        }

        // パスワードをハッシュ化して保存する
        // 本番環境では、安全なハッシュ化手法を使用すること（例えばBcryptなど）
        String hashedPassword = hashPassword(user.getPassword());
        user.setPassword(hashedPassword);

        // ユーザー情報をデータベースに保存（簡易的な方法としてMapを使用）
        userDatabase.put(user.getUsername(), user);
        return true;
    }

    // パスワードのハッシュ化（ここでは簡易的に文字列を返しています）
    private String hashPassword(String password) {
        // 本番では適切なハッシュ化アルゴリズムを使ってください
        return password + "_hashed"; // 仮のハッシュ化
    }

    // ユーザーの認証
    public boolean authenticateUser(String username, String password) {
        User user = userDatabase.get(username);
        if (user != null && user.getPassword().equals(hashPassword(password))) {
            return true;
        }
        return false;
    }
}
