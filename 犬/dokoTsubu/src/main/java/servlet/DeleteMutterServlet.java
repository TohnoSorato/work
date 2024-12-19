package servlet;
  // 適切なパッケージ名に変更

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMutter")
public class DeleteMutterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mutterId = Integer.parseInt(request.getParameter("mutterId"));
        
        // mutterDao.deleteMutter(mutterId); // DBからつぶやきを削除する処理（DAOクラスを作成しておく必要があります）
        
        response.sendRedirect("Main"); // 削除後にメイン画面へリダイレクト
    }
}