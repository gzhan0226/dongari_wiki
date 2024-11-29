package question.controller;

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
import question.QuestionDto;
import question.QuestionService;


/**
 * Servlet implementation class Question
 */
@WebServlet("/newquestion")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestion() {
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
		
		int id = Integer.parseInt(request.getParameter("dongari_id"));
		
		DongariService dongariService = new DongariService();
		
		DongariDto dongariDto = dongariService.findById(id);
		
		request.setAttribute("id", id);
		request.setAttribute("dongari", dongariDto);
		
		RequestDispatcher dis = request.getRequestDispatcher("newquestion.jsp"); //form 페이지 생기면 추가
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
		
		int dongari_id = Integer.parseInt(request.getParameter("dongari_id")); 
		int user_id = (int) session.getAttribute("user_id");
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		
		QuestionService questionService = new QuestionService();
		
		questionService.saveQuestion(new QuestionDto(0, user_id, dongari_id, title, body, ""));
		
		response.sendRedirect("./");
		return; 
	}

}
