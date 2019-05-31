package top.gcyb.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import top.gcyb.dao.ArticleDao;
import top.gcyb.dao.impl.ArticleDaoImpl;

/**
 * Servlet implementation class FindServlet
 */
@WebServlet("/Find.do")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setCharacterEncoding("UTF-8");		//设置编码
		
		String articleName1 = request.getParameter("articleName");
		String articleName = new String(articleName1.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(articleName);
		ArticleDao articleDao = new ArticleDaoImpl();
		List<Map<String, String>> mapList = articleDao.getArticleByArticleName(articleName);
		JSONArray jsonArray = JSONArray.fromObject(mapList);
		System.out.println(jsonArray.toString());
		request.setAttribute("mapList", mapList);
		request.getRequestDispatcher("admin/glnr.jsp").forward(request,response);//Servlet 转发到查询Servlet
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
