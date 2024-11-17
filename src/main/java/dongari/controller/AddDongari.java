package dongari.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		if (session == null) {
			response.sendRedirect("login");
			return; 
		}
		int user_id = (int) session.getAttribute("user_id");
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String body = request.getParameter("body");
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		String img = request.getParameter("img");
		int apply_status = Integer.parseInt(request.getParameter("apply_status")); //1 - 모집중, 2 - 상시 모집, 3 - 모집 마감
		String apply_link = request.getParameter("apply_link");
		String sns_link = request.getParameter("sns_link");
		String location = request.getParameter("location");
		
		String apply_start=null;
		String apply_end=null;
		if (apply_status==1) {
			apply_start = request.getParameter("apply_start");
			apply_end = request.getParameter("apply_end");
		}
		if(apply_status==3) {
			apply_start="9999";
			apply_end="9999";
		}
		
		DongariService dongariService = new DongariService();
		dongariService.saveDongari(new DongariDto(0,user_id,10,member_num,img,
				title,summary,body,apply_start,apply_end,apply_link,sns_link,location, ""));
		
		response.sendRedirect("./");
		return; 
	}
}
