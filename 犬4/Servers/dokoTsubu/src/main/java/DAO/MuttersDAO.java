// ファイル: dao/MutterDAO.java
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
    private final String jdbcUrl = "jdbc:h2:~/desktop/dokotsubu"; // DB URL
    private final String dbUser = "sa"; // DBユーザー名
    private final String dbPassword = ""; // DBパスワード

    public List<Mutter> findAll() {
        List<Mutter> mutters = new ArrayList<>();
        String sql = "SELECT * FROM mutters ORDER BY created_at DESC";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Mutter mutter = new Mutter(
                    rs.getString("username"),
                    rs.getString("text"),
                    rs.getString("image_path"),
                    rs.getString("video_path")
                );
                mutters.add(mutter);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mutters;
    }

    public boolean insert(Mutter mutter) {
        String sql = "INSERT INTO mutters (username, text, image_path, video_path, created_at) VALUES (?, ?, ?, ?, NOW())";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, mutter.getUserName());
            pstmt.setString(2, mutter.getText());
            pstmt.setString(3, mutter.getImagePath());
            pstmt.setString(4, mutter.getVideoPath());

            pstmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
