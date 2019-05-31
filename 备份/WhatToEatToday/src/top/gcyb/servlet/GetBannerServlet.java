package top.gcyb.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import top.gcyb.dao.BannerDao;
import top.gcyb.dao.impl.BannerDaoImpl;

/**
 * Servlet implementation class GetBannerServlet
 */
@WebServlet("/GetBanner.do")
public class GetBannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBannerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");		//设置编码
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		BannerDao bannerDao = new BannerDaoImpl();
		mapList = bannerDao.getBanner();
		JSONArray jsonArray = JSONArray.fromObject(mapList);
		System.out.println(jsonArray.toString());
		response.getWriter().print(jsonArray.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
