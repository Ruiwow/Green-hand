package top.gcyb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import top.gcyb.dao.ArticleDao;
import top.gcyb.dao.impl.ArticleDaoImpl;

/**
 * Servlet implementation class AddUnLikeServlet
 */
@WebServlet("/AddUnLike.do")
public class AddUnLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUnLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String articleId = request.getParameter("articleId");		//从jsp页面传回的食物ID
		ArticleDao articleDao = new ArticleDaoImpl();
		int result = articleDao.addUnLike(articleId);					//点赞更新数据库
		if(result > 0){
			System.out.println("点踩成功");
			response.getWriter().print("successful");		//成功返回到ajax的参数为successful
		}else{
			System.out.println("点踩失败");
			response.getWriter().print("failed");			//失败返回到ajax的参数为failed
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
