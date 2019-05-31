package top.gcyb.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import top.gcyb.dao.BannerDao;
import top.gcyb.dao.impl.BannerDaoImpl;

/**
 * Servlet implementation class BannerServlet
 */
@WebServlet("/Banner.do")
public class BannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bannerId = Integer.valueOf(request.getParameter("bannerId"));
		BannerDao bannerDao = new BannerDaoImpl();
		Map<String, String> map = new HashMap<String, String>();
		map = bannerDao.getMapByBannerId(bannerId);
		request.setAttribute("map", map);
		System.out.println(map.toString());
		request.getRequestDispatcher("2.jsp").forward(request,response);//Servlet 转发到查询Servlet
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
