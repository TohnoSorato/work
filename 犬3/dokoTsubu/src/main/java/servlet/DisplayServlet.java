package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Post;

@WebServlet("/display")
public class DisplayServlet extends HttpServlet {
    
    // GETリクエスト処理メソッド
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = new ArrayList<>();
        
        // H2データベースに接続してデータを取得
        try (Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "password")) {
            String query = "SELECT message, image_url, created_at FROM posts ORDER BY created_at DESC";
            try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String message = rs.getString("message");
                    String imageUrl = rs.getString("image_url");
                    String createdAt = rs.getString("created_at");
                    posts.add(new Post(message, imageUrl, createdAt));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリング（必要に応じて追加）
        }
        
        // JSPにデータを渡す
        request.setAttribute("posts", posts);
        
        // JSPにフォワード
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
