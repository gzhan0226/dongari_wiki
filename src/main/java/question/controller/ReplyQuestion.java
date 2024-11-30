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
import review.ReviewDto;
import review.ReviewService;


/**
 * Servlet implementation class EditQuestion
 */
@WebServlet("/reply")
public class ReplyQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int dongari_id = Integer.parseInt(request.getParameter("id"));
		int question_id = Integer.parseInt(request.getParameter("question_id"));
		
		QuestionService questionService = new QuestionService();
		DongariService dongariService = new DongariService();
		
		QuestionDto questionDto = questionService.findById(question_id);
		DongariDto dongariDto = dongariService.findById(dongari_id);
		
		if (session.getAttribute("user_id") == null) {
			response.sendRedirect("login");
			return;
		}
		
		int user_id = (int) session.getAttribute("user_id");
		
		if (user_id != questionDto.getUser_id()) {
			response.sendRedirect("./");
			return;
		}
		
		request.setAttribute("dongari", dongariDto);
		request.setAttribute("question", questionDto);
		RequestDispatcher dis = request.getRequestDispatcher("reply.jsp"); 
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
		
		int id = Integer.parseInt(request.getParameter("question_id")); 
		int dongari_id = Integer.parseInt(request.getParameter("id"));	
		int user_id = (int) session.getAttribute("user_id");
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		String reply = request.getParameter("reply");
		
		QuestionService questionService = new QuestionService();
		questionService.reply(new QuestionDto(id,user_id,dongari_id,title,body,reply)); 
		response.sendRedirect("./question?id=" + dongari_id);
		return; 
	}

}
