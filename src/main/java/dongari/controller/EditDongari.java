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
		int id = Integer.parseInt(request.getParameter("id")); // url �ּҷ� ���� num�� �о���� 
		HttpSession session = request.getSession();
		
		int user_id = (int) session.getAttribute("user_id");
		
		DongariService dongariService = new DongariService();
		DongariDto dongari = dongariService.findById(id);
		if (user_id != dongari.getUser_id()) {
			response.sendRedirect("./");
			return;
		}
		
		request.setAttribute("dongari", dongari); // �˻��� ����� ��� (jsp���� �� �� �ְ�)
		
		RequestDispatcher dis = request.getRequestDispatcher("dongariForm.jsp"); //form ������ ����� �߰�
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
