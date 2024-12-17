package com.jobtracker.data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DataManager {

    private static final String FILE_PATH = "applications.csv";

    // 応募情報をCSVファイルから読み込む
    public static List<String[]> loadApplications() {
        List<String[]> applications = new ArrayList<>();
        File file = new File(FILE_PATH);

        // ファイルが存在しない場合は新しく作成
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                System.out.println("ファイルの作成に失敗しました: " + e.getMessage());
                return applications;
            }
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                // 空行をスキップ
                if (line.trim().isEmpty()) continue;

                // 行をカンマで分割し、アプリケーション情報として追加
                applications.add(line.split(","));
            }
        } catch (IOException e) {
            System.out.println("ファイルの読み込みに失敗しました: " + e.getMessage());
        }
        return applications;
    }

    // 応募情報をCSVファイルに保存する
    public static void saveApplications(List<String[]> applications) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (String[] application : applications) {
                // 配列をカンマ区切りで書き込み
                writer.write(String.join(",", application));
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("ファイルの書き込みに失敗しました: " + e.getMessage());
        }
    }

    // 応募情報をCSVファイルに追加する
    public static void addApplication(String company, String industry, String date, String status) {
        List<String[]> applications = loadApplications();
        String[] newApplication = {company, industry, date, status};
        applications.add(newApplication);

        // 既存のデータに新しいデータを追加して保存
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(String.join(",", newApplication));
            writer.newLine();
        } catch (IOException e) {
            System.out.println("応募情報の追加に失敗しました: " + e.getMessage());
        }
    }

    // 応募情報をCSVファイル内で編集する
    public static void editApplication(int index, String company, String industry, String date, String status) {
        List<String[]> applications = loadApplications();
        
        // 編集対象の行を更新
        if (index >= 0 && index < applications.size()) {
            applications.get(index)[0] = company;
            applications.get(index)[1] = industry;
            applications.get(index)[2] = date;
            applications.get(index)[3] = status;

            // 更新されたリストをCSVファイルに保存
            saveApplications(applications);
        }
    }

    // 応募情報をCSVファイルから削除する
    public static void deleteApplication(int index) {
        List<String[]> applications = loadApplications();
        
        // 削除対象の行を削除
        if (index >= 0 && index < applications.size()) {
            applications.remove(index);

            // 更新されたリストをCSVファイルに保存
            saveApplications(applications);
        }
    }
}
