package com.jobtracker.ui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import com.jobtracker.data.DataManager;

public class JobAppUI {
    private JTextField companyText;
    private JTextField industryText;
    private JTextField dateText;
    private JTextField statusText;
    private JTable table;
    private DefaultTableModel tableModel;

    public JobAppUI() {
        // フレーム作成
        JFrame frame = new JFrame("就活管理アプリ");
        frame.setSize(600, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // パネル作成
        JPanel panel = new JPanel();
        panel.setLayout(null);
        frame.add(panel);

        // コンポーネント配置
        placeComponents(panel);

        frame.setVisible(true);
    }

    private void placeComponents(JPanel panel) {
        panel.setLayout(null);

        // 会社名入力欄
        JLabel companyLabel = new JLabel("会社名:");
        companyLabel.setBounds(10, 20, 80, 25);
        panel.add(companyLabel);

        companyText = new JTextField(20);
        companyText.setBounds(100, 20, 165, 25);
        panel.add(companyText);

        // 業種入力欄
        JLabel industryLabel = new JLabel("業種:");
        industryLabel.setBounds(10, 50, 80, 25);
        panel.add(industryLabel);

        industryText = new JTextField(20);
        industryText.setBounds(100, 50, 165, 25);
        panel.add(industryText);

        // 応募日入力欄
        JLabel dateLabel = new JLabel("応募日:");
        dateLabel.setBounds(10, 80, 80, 25);
        panel.add(dateLabel);

        dateText = new JTextField(20);
        dateText.setBounds(100, 80, 165, 25);
        panel.add(dateText);

        // 選考状況入力欄
        JLabel statusLabel = new JLabel("選考状況:");
        statusLabel.setBounds(10, 110, 80, 25);
        panel.add(statusLabel);

        statusText = new JTextField(20);
        statusText.setBounds(100, 110, 165, 25);
        panel.add(statusText);

        // 登録ボタン
        JButton addButton = new JButton("登録");
        addButton.setBounds(10, 140, 100, 25);
        panel.add(addButton);

        // 編集ボタン
        JButton editButton = new JButton("編集");
        editButton.setBounds(120, 140, 100, 25);
        panel.add(editButton);

        // 削除ボタン
        JButton deleteButton = new JButton("削除");
        deleteButton.setBounds(230, 140, 100, 25);
        panel.add(deleteButton);

        // テーブル
        String[] columnNames = {"会社名", "業種", "応募日", "選考状況"};
        tableModel = new DefaultTableModel(columnNames, 0);
        table = new JTable(tableModel);
        JScrollPane tableScrollPane = new JScrollPane(table);
        tableScrollPane.setBounds(10, 180, 550, 150);
        panel.add(tableScrollPane);

        // テーブルにデータを読み込む
        loadTableData();

        // ボタンのアクションリスナー設定
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String company = companyText.getText();
                String industry = industryText.getText();
                String date = dateText.getText();
                String status = statusText.getText();

                // DataManagerにデータを追加
                DataManager.addApplication(company, industry, date, status);

                // テーブルにデータを追加
                tableModel.addRow(new Object[]{company, industry, date, status});

                // 入力フィールドをクリア
                companyText.setText("");
                industryText.setText("");
                dateText.setText("");
                statusText.setText("");
            }
        });

        // 編集ボタンのアクションリスナー設定
        editButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int selectedRow = table.getSelectedRow();
                if (selectedRow != -1) {
                    // テーブルから選択された行のデータを取り出し、編集欄にセット
                    companyText.setText(table.getValueAt(selectedRow, 0).toString());
                    industryText.setText(table.getValueAt(selectedRow, 1).toString());
                    dateText.setText(table.getValueAt(selectedRow, 2).toString());
                    statusText.setText(table.getValueAt(selectedRow, 3).toString());

                    // 編集されたデータをCSVに保存
                    DataManager.editApplication(selectedRow, companyText.getText(), industryText.getText(), dateText.getText(), statusText.getText());

                    // テーブルの値を更新
                    tableModel.setValueAt(companyText.getText(), selectedRow, 0);
                    tableModel.setValueAt(industryText.getText(), selectedRow, 1);
                    tableModel.setValueAt(dateText.getText(), selectedRow, 2);
                    tableModel.setValueAt(statusText.getText(), selectedRow, 3);
                }
            }
        });

        // 削除ボタンのアクションリスナー設定
        deleteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int selectedRow = table.getSelectedRow();
                if (selectedRow != -1) {
                    // テーブルから選択された行を削除
                    String company = table.getValueAt(selectedRow, 0).toString();
                    String industry = table.getValueAt(selectedRow, 1).toString();
                    String date = table.getValueAt(selectedRow, 2).toString();
                    String status = table.getValueAt(selectedRow, 3).toString();

                    // DataManagerでCSVから削除処理
                    DataManager.deleteApplication(selectedRow);

                    // テーブルから削除された行を更新
                    tableModel.removeRow(selectedRow);
                } else {
                    JOptionPane.showMessageDialog(panel, "削除する行を選択してください", "エラー", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }

    // テーブルにデータを読み込む
    private void loadTableData() {
        List<String[]> applications = DataManager.loadApplications();
        for (String[] application : applications) {
            tableModel.addRow(application);
        }
    }
}
