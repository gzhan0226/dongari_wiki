package scraps.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import scraps.ScrapsService;

/**
 * Servlet implementation class Scraps
 */
@WebServlet("/scraps")
public class Scraps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Scraps() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("./"); 
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
		int dongari_id = Integer.parseInt(request.getParameter("dongari_id"));
		
		ScrapsService scrapsService = new ScrapsService();
		
		if(scrapsService.check(dongari_id, user_id)) {
			scrapsService.deleteScraps(dongari_id, user_id);
		}
		else
			scrapsService.doScraps(dongari_id, user_id);
		
		return;
	}

}
