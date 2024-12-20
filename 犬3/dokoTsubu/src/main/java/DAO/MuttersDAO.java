package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Mutter;

public class MuttersDAO {
    private final String JDBC_URL = "jdbc:h2:~/desktop/dokotsubu";  // JDBC URL (変更の必要がある場合があります)
    private final String DB_USER = "sa";  // DBユーザー名
    private final String DB_PASS = "";  // DBパスワード

    // つぶやき一覧を取得するメソッド
    public List<Mutter> findAll() {
        List<Mutter> mutterList = new ArrayList<Mutter>();

        try {
            // JDBCドライバのロード
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBCドライバを読み込めませんでした", e);
        }

        // データベース接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT ID, NAME, TEXT FROM MUTTERS ORDER BY ID DESC";  // データ取得のSQL
            PreparedStatement pStmt = conn.prepareStatement(sql);
            ResultSet rs = pStmt.executeQuery();

            // 結果セットからデータを取得
            while (rs.next()) {
                int id = rs.getInt("ID");
                String userName = rs.getString("NAME");
                String text = rs.getString("TEXT");
                Mutter mutter = new Mutter(userName, text, text, text);  // Mutterオブジェクトを作成
                mutterList.add(mutter);  // リストに追加
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;  // エラー時にはnullを返す
        }

        return mutterList;  // つぶやきのリストを返す
    }

    // つぶやきをデータベースに追加するメソッド
    public boolean create(Mutter mutter) {
        try {
            // JDBCドライバのロード
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBCドライバを読み込めませんでした", e);
        }

        // データベース接続
        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
            String sql = "INSERT INTO MUTTERS(NAME, TEXT) VALUES(?, ?)";  // つぶやきの挿入SQL
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, mutter.getUserName());  // ユーザー名
            pStmt.setString(2, mutter.getText());  // つぶやき内容

            // 実行
            int result = pStmt.executeUpdate();
            if (result != 1) {
                return false;  // 挿入に失敗した場合
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // エラー時にはfalseを返す
        }

        return true;  // 成功時にはtrueを返す
    }
}