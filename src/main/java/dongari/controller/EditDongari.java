package dongari.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class EditDongari
 */
@WebServlet("/edit")
public class EditDongari extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDongari() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); //���⼭ id�� ���Ƹ� id
		
		HttpSession session = request.getSession();
		if (session == null) {
			response.sendRedirect("login");
			return; 
		}
		int user_id = (int) session.getAttribute("user_id");
		
		DongariService dongariService = new DongariService();
		DongariDto dongari = dongariService.findById(id);
		if (user_id != dongari.getUser_id()) {
			response.sendRedirect("./");
			return;
		}
		
		request.setAttribute("dongari", dongari); // �˻��� ����� ��� (jsp���� �� �� �ְ�)
		request.setAttribute("type", "edit");
		
		RequestDispatcher dis = request.getRequestDispatcher("dongariForm.jsp"); //form ������ ����� �߰�
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
		
		int id = Integer.parseInt(request.getParameter("id")); // ���⼭ id�� ���Ƹ� id
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String body = request.getParameter("body");
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		String img = request.getParameter("img");
		int apply_status = Integer.parseInt(request.getParameter("apply_status")); //1 - ������, 2 - ��� ����, 3 - ���� ����
		String apply_link = request.getParameter("apply_link");
		String sns_link = request.getParameter("sns_link");
		String location = request.getParameter("location");
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		
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
		dongariService.editDongari(new DongariDto(id,user_id,category_id,member_num,img,
				title,summary,body,apply_start,apply_end,apply_link,sns_link,location, ""));
		
		response.sendRedirect("./");
		return; 
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		if (session == null) {
			response.sendRedirect("login");
			return; 
		}
		
		int id = Integer.parseInt(request.getParameter("id")); // url �ּҷ� ���� num�� �о���� 
		
		DongariService dongariService = new DongariService();
		dongariService.deleteDongari(id);
		
		response.sendRedirect("./");
		return; 
	}
}
