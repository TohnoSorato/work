package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.User;
import model.UserRegistrationLogic;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 新規登録フォームを表示
    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/register.jsp");
    dispatcher.forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // フォームから送信されたデータを取得
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // ユーザーオブジェクトの作成
    User user = new User();
    user.setUsername(username);
    user.setEmail(email);
    user.setPassword(password);

    // ユーザー登録処理
    UserRegistrationLogic logic = new UserRegistrationLogic();
    boolean success = logic.registerUser(user);

    if (success) {
      // 登録成功
      response.sendRedirect("login.jsp"); // ログインページにリダイレクト
    } else {
      // 既にユーザーが存在
      request.setAttribute("errorMessage", "このユーザー名はすでに使用されています。");
      RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/register.jsp");
      dispatcher.forward(request, response);
    }
  }
}
