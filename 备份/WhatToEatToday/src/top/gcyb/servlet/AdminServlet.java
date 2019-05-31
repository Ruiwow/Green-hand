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
import top.gcyb.dao.ArticleDao;
import top.gcyb.dao.impl.ArticleDaoImpl;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/Admin.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");		//设置编码
		String pageString = request.getParameter("page");
		int pageInt = 1;		//默认页码为1，此时ajax不传递数据
		if(pageString != null){
			pageInt = Integer.valueOf(pageString);	//ajax开始传递数据后，已是第二页，因此前端数据的页码加一
			System.out.println(pageInt);
		}
		
		
		ArticleDao articleDao = new ArticleDaoImpl();	
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		//mapList = articleDao.getArticleByTimeDESC();
		mapList = articleDao.adminGetNineByTimeDESC(pageInt);
		int totalCount = articleDao.getCountOfArticle();	//获取总条数
		System.out.println("总数据条数："+totalCount);
		int totalPage = totalCount % 9 == 0 ? totalCount / 9 : totalCount / 9 + 1;	//计算总页码
		System.out.println("总页数："+totalPage);
		JSONArray jsonArray = JSONArray.fromObject(mapList);
		System.out.println(jsonArray.toString());
		//response.getWriter().print(jsonArray.toString());
		request.setAttribute("mapList", mapList);
		request.setAttribute("pageInt", pageInt);
		request.setAttribute("totalPage", totalPage);
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
