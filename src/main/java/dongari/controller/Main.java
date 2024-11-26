package dongari.controller;

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
import scraps.ScrapsDto;
import scraps.ScrapsService;

/**
 * Servlet implementation class Dongari
 */
@WebServlet("/")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
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
		
		DongariService dongariService = new DongariService();
		ScrapsService scrapsService = new ScrapsService(); 
		
		List<DongariDto> list = dongariService.findAll();
		
		List<ScrapsDto> scrapsDtoList = scrapsService.findAll(user_id);
		List<DongariDto> scrapsDongariList = new ArrayList<>(); 
		
		for (ScrapsDto scrap : scrapsDtoList) {
			scrapsDongariList.add(dongariService.findById(scrap.getDongari_id()));
		}
		
		request.setAttribute("dongariList", list);
		request.setAttribute("scrapList", scrapsDongariList);
		
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
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
