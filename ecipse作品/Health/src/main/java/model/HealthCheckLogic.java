package model;

public class HealthCheckLogic {
  public void execute(Health health) {
    // 身長と体重を取得
    double weight = health.getWeight();
    double height = health.getHeight();

    // 入力値のバリデーション: 身長と体重が正の値であることを確認
    if (weight <= 0 || height <= 0) {
      throw new IllegalArgumentException("身長と体重は正の値である必要があります。");
    }

    // BMIを計算（小数点以下2桁に丸める）
    double bmi = weight / (height / 100.0 * height / 100.0);
    health.setBmi(Math.round(bmi * 100.0) / 100.0); // BMIを小数点2桁に丸める

    // BMIに基づく体型の判定
    String bodyType;
    if (bmi < 18.5) {
      bodyType = "痩せ型"; // BMI < 18.5: 痩せ型
    } else if (bmi < 22.0) {
      bodyType = "普通（低い範囲）"; // 18.5 <= BMI < 22: 普通（低い範囲）
    } else if (bmi < 25.0) {
      bodyType = "普通（高い範囲）"; // 22 <= BMI < 25: 普通（高い範囲）
    } else if (bmi < 30.0) {
      bodyType = "軽度肥満"; // 25 <= BMI < 30: 軽度肥満
    } else {
      bodyType = "高度肥満"; // BMI >= 30: 高度肥満
    }
    health.setBodyType(bodyType);
  }
}
