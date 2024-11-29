package dongari.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dongari.DongariDto;
import dongari.DongariService;

/**
 * Servlet implementation class AddDongari
 */
@WebServlet("/new")
public class AddDongari extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDongari() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") == null) {
			response.sendRedirect("login");
			return;
		}
		request.setAttribute("type", "new");
		RequestDispatcher dis = request.getRequestDispatcher("dongariForm.jsp"); //form 페이지 생기면 추가
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 로그인 확인을 가장 먼저 수행
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login");
            return;
        }
        int user_id = (int) session.getAttribute("user_id");

        // 파일 업로드 경로 설정
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // 업로드 처리
        int maxSize = 1024 * 1024 * 10; // 10MB
        MultipartRequest multi = new MultipartRequest(
            request,
            uploadPath,
            maxSize,
            "UTF-8",
            new DefaultFileRenamePolicy()
        );

        // 파라미터 가져오기
        String title = multi.getParameter("title");
        String summary = multi.getParameter("summary");
        String body = multi.getParameter("body");
        int member_num = Integer.parseInt(multi.getParameter("member_num"));
        int apply_status = Integer.parseInt(multi.getParameter("apply_status"));
        String apply_link = multi.getParameter("apply_link");
        String sns_link = multi.getParameter("sns_link");
        String location = multi.getParameter("location");

        // 이미지 파일 처리
        String img = null;
        Enumeration<?> files = multi.getFileNames();
        if (files.hasMoreElements()) {
            String fileInputName = (String) files.nextElement();
            String savedFileName = multi.getFilesystemName(fileInputName); // 업로드된 파일명
            if (savedFileName != null) {
                img = "/uploads/" + savedFileName; // URL로 저장
            }
        }

        // 모집 상태에 따른 날짜 처리
        String apply_start = null;
        String apply_end = null;
        if (apply_status == 1) { // 모집 중
            apply_start = multi.getParameter("apply_start");
            apply_end = multi.getParameter("apply_end");
        } else if (apply_status == 3) { // 모집 마감
            apply_start = "9999";
            apply_end = "9999";
        }

        // DongariService를 통해 저장
        DongariService dongariService = new DongariService();
        dongariService.saveDongari(new DongariDto(
            0, user_id, 10, member_num, img, title, summary, body,
            apply_start, apply_end, apply_link, sns_link, location, ""
        ));

        // 리다이렉트
        response.sendRedirect("./");
    }
}
