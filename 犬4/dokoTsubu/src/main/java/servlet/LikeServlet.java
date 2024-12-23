package servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Mutter;

@WebServlet("/Like")
public class LikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int mutterId = Integer.parseInt(request.getParameter("mutterId"));

            // アプリケーションスコープからつぶやきリストを取得
            List<Mutter> mutterList = (List<Mutter>) getServletContext().getAttribute("mutterList");

            // 対象のつぶやきにいいねを加算
            for (Mutter mutter : mutterList) {
                if (mutter.getId() == mutterId) {
                    mutter.addLike();
                    break;
                }
            }

            response.sendRedirect("Main");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Main?error=like_failed");
        }
    }
}
