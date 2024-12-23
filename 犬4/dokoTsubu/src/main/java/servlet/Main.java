package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import model.Mutter;
import model.User;

@WebServlet("/Main")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,     // 10MB
    maxRequestSize = 1024 * 1024 * 15  // 15MB
)
public class Main extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        super.init();
        // アプリケーションスコープにリストが存在しない場合、初期化
        if (getServletContext().getAttribute("mutterList") == null) {
            getServletContext().setAttribute("mutterList", new ArrayList<Mutter>());
        }
    }

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<Mutter> mutterList = (List<Mutter>) getServletContext().getAttribute("mutterList");
        request.setAttribute("mutterList", mutterList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
        dispatcher.forward(request, response);
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String text = request.getParameter("text");
        Part imagePart = request.getPart("image");
        Part videoPart = request.getPart("video");  // 動画用のPartを取得
        String imagePath = null;
        String videoPath = null;

        try {
            // 入力検証
            if (text == null || text.trim().isEmpty()) {
                request.setAttribute("errorMsg", "つぶやき内容を入力してください。");
            } else {
                // 画像アップロード処理
                if (imagePart != null && imagePart.getSize() > 0) {
                    String originalFileName = imagePart.getSubmittedFileName();
                    String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                    String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

                    // アップロードディレクトリ
                    String uploadDir = getServletContext().getRealPath("/uploads");
                    File uploadDirFile = new File(uploadDir);
                    if (!uploadDirFile.exists()) {
                        uploadDirFile.mkdirs();
                    }

                    File file = new File(uploadDir, uniqueFileName);
                    imagePart.write(file.getAbsolutePath());
                    imagePath = "/uploads/" + uniqueFileName; // Webから参照可能なパス
                }

                // 動画アップロード処理
                if (videoPart != null && videoPart.getSize() > 0) {
                    String originalFileName = videoPart.getSubmittedFileName();
                    String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                    // 動画ファイルの拡張子が.mp4かどうかチェック
                    if (!fileExtension.equalsIgnoreCase(".mp4")) {
                        request.setAttribute("errorMsg", "動画ファイルはMP4形式である必要があります。");
                        return;
                    }
                    String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

                    // アップロードディレクトリ
                    String uploadDir = getServletContext().getRealPath("/uploads");
                    File uploadDirFile = new File(uploadDir);
                    if (!uploadDirFile.exists()) {
                        uploadDirFile.mkdirs();
                    }

                    File file = new File(uploadDir, uniqueFileName);
                    videoPart.write(file.getAbsolutePath());
                    videoPath = "/uploads/" + uniqueFileName; // Webから参照可能なパス
                }

                List<Mutter> mutterList = (List<Mutter>) getServletContext().getAttribute("mutterList");
                Mutter newMutter = new Mutter(loginUser.getName(), text, imagePath, videoPath);
                mutterList.add(newMutter);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "つぶやきの投稿に失敗しました。");
        }

        response.sendRedirect("Main");
    }
}

