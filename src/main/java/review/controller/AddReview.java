package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.ReviewDto;
import review.ReviewService;

/**
 * Servlet implementation class AddReview
 */
@WebServlet("/newreview")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReview() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		request.setAttribute("type", "newreview");
		request.setAttribute("id", id);
		
		RequestDispatcher dis = request.getRequestDispatcher("newreview.jsp"); //form 페이지 생기면 추가
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
		
		int id = Integer.parseInt(request.getParameter("id")); 	
		int user_id = (int) session.getAttribute("user_id");
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		int atm = Integer.parseInt(request.getParameter("atm_rating"));
		int act = Integer.parseInt(request.getParameter("act_rating"));
		int man = Integer.parseInt(request.getParameter("man_rating"));
		
		ReviewService reviewService = new ReviewService();
		reviewService.saveReview(new ReviewDto(0,user_id,id,title,body,atm,act,man,"",0));
		
		response.sendRedirect("./");
		return; 
	}

}
