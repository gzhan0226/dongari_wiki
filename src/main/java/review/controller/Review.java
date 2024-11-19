package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dongari.DongariDto;
import dongari.DongariService;
import review.ReviewDto;
import review.ReviewService;

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
		int id = Integer.parseInt(request.getParameter("id")); // url 주소로 보낸 num값 읽어오기 
		ReviewService reviewService = new ReviewService();
		List<ReviewDto> list = reviewService.findAllByDongariId(id);
		double atm = reviewService.getAverageAtm(list);
		double act = reviewService.getAverageAct(list);
		double man = reviewService.getAverageMan(list);
		
		double total = (atm + act + man) / 3;
		
		request.setAttribute("reviews", list);
		request.setAttribute("atm", atm);
		request.setAttribute("act", act);
		request.setAttribute("man", man);
		request.setAttribute("total", total);
		
		DongariService dongariService = new DongariService();
		DongariDto dongariDto = dongariService.findById(id);
		request.setAttribute("dongari", dongariDto);
		
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
