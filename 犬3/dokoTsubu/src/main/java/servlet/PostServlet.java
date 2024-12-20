package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
    
    // POSTリクエスト処理メソッド
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームから送信されたデータを取得
        String message = request.getParameter("message");
        String imageUrl = request.getParameter("imageUrl");

        // H2データベースに接続してデータを保存
        try (Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "password")) {
            String query = "INSERT INTO posts (message, image_url) VALUES (?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, message);
                ps.setString(2, imageUrl);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリング（必要に応じて追加）
        }

        // データ保存後、表示用のページにリダイレクト
        response.sendRedirect("index.jsp");
    }
}
