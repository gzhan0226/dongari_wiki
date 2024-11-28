package review.controller;

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
import likes.LikesService;
import review.ReviewDto;
import review.ReviewLikeDto;
import review.ReviewService;
import scraps.ScrapsService;
import question.QuestionDto;
import question.QuestionService;

/**
 * Servlet implementation class Review
 */
@WebServlet("/review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int user_id=0;
		if (session.getAttribute("user_id") != null) {
	    	user_id = (int) session.getAttribute("user_id");
	    }
		
		int id = Integer.parseInt(request.getParameter("id")); // url 주소로 보낸 num값 읽어오기 
		
		ReviewService reviewService = new ReviewService();
		LikesService likesService = new LikesService();
		DongariService dongariService = new DongariService();
		ScrapsService scrapsService = new ScrapsService();
		QuestionService questionService = new QuestionService();
		
		List<ReviewDto> list = reviewService.findAllByDongariId(id);
		List<ReviewLikeDto> reviews = new ArrayList<>();
		
		for (ReviewDto reviewDto : list) {
		    int likeCount = likesService.count(reviewDto.getId());
		    boolean likeCheck = false;
		    likeCheck = likesService.check(reviewDto.getId(), user_id);
		    
		    ReviewLikeDto reviewLikeDto = new ReviewLikeDto(reviewDto, likeCount, likeCheck);
		    reviews.add(reviewLikeDto); // 리스트에 추가
		}
		
		double atm = reviewService.getAverageAtm(list);
		double act = reviewService.getAverageAct(list);
		double man = reviewService.getAverageMan(list);
		
		double total = (atm + act + man) / 3;
		
		DongariDto dongariDto = dongariService.findById(id);
		
		boolean scrapCheck = scrapsService.check(dongariDto.getId(), user_id);
		
		List<QuestionDto> questions = questionService.findAllByDongariId(id);
		
		request.setAttribute("dongari", dongariDto);
		request.setAttribute("reviews", reviews);
		request.setAttribute("atm", atm);
		request.setAttribute("act", act);
		request.setAttribute("man", man);
		request.setAttribute("total", total);
		request.setAttribute("scrapCheck", scrapCheck);
		request.setAttribute("questions", questions);
		
		RequestDispatcher dis = request.getRequestDispatcher("review.jsp");
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
