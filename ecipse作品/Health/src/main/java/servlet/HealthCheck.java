package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Health;
import model.HealthCheckLogic;

@WebServlet("/HealthCheck")
public class HealthCheck extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // フォワード: 健康診断入力フォームページへ
    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/healthCheck.jsp");
    dispatcher.forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // リクエストパラメータを取得
    String weight = request.getParameter("weight"); // 体重
    String height = request.getParameter("height"); // 身長

    // 入力値をプロパティに設定
    Health health = new Health();
    try {
      health.setHeight(Double.parseDouble(height));
      health.setWeight(Double.parseDouble(weight));
    } catch (NumberFormatException e) {
      // 無効な入力の場合にエラーメッセージを表示
      request.setAttribute("errorMessage", "身長と体重は正しい数値を入力してください。");
      RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/healthCheck.jsp");
      dispatcher.forward(request, response);
      return;
    }

    // 健康診断を実行し結果を設定
    HealthCheckLogic healthCheckLogic = new HealthCheckLogic();
    try {
      healthCheckLogic.execute(health);
    } catch (IllegalArgumentException e) {
      request.setAttribute("errorMessage", e.getMessage());
      RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/healthCheck.jsp");
      dispatcher.forward(request, response);
      return;
    }

    // リクエストスコープに保存
    request.setAttribute("health", health);

    // フォワード: 結果ページへ
    RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/healthCheckResult.jsp");
    dispatcher.forward(request, response);
  }
}
