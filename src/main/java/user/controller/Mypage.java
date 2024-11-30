package user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import scraps.ScrapsDto;
import scraps.ScrapsService;
import user.UserDto;
import user.UserService;

/**
 * Servlet implementation class Mypage
 */
@WebServlet("/mypage")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") == null) {
			response.sendRedirect("login");
			return; 
		}
		
		int user_id = (int) session.getAttribute("user_id");
		String username = (String) session.getAttribute("username");
		
		DongariService dongariService = new DongariService();
		ScrapsService scrapsService = new ScrapsService(); 
		QuestionService questionService = new QuestionService();
		ReviewService reviewService = new ReviewService();
		UserService userService = new UserService();
		
		UserDto userDto = userService.findByUsername(username);
		
		List<DongariDto> dongariList = dongariService.findByUserId(user_id);
		List<ReviewDto> reviewList = reviewService.findAllByUserId(user_id);
		
		List<ScrapsDto> scrapsDtoList = scrapsService.findAll(user_id);
		List<DongariDto> scrapsDongariList = new ArrayList<>(); 
		
		for (ScrapsDto scrap : scrapsDtoList) {
			scrapsDongariList.add(dongariService.findById(scrap.getDongari_id()));
		}
		
		List<QuestionDto> questionList = questionService.findAllByUserId(user_id);
		
		request.setAttribute("dongariList", dongariList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("scrapList", scrapsDongariList);
		request.setAttribute("questionList", questionList);
		request.setAttribute("user", userDto);
		
		RequestDispatcher dis = request.getRequestDispatcher("mypage.jsp");
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
