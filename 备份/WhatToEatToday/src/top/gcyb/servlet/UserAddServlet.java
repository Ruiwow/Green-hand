package top.gcyb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import top.gcyb.dao.ArticleDao;
import top.gcyb.dao.impl.ArticleDaoImpl;
import top.gcyb.entity.Article;
import top.gcyb.entity.UserInfo;
import top.gcyb.utils.MyFileUtils;

/**
 * Servlet implementation class UserAddServlet
 */
@WebServlet("/UserAdd.do")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserInfo userInfo = new UserInfo();
		userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
		if(userInfo == null){
			System.out.println("您长时间未操作登陆已过期");
			return;
		}
		PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
		//使用SmartUpload组件完成文件解析
    	//1. 初始化组件
    	SmartUpload smartUpload = new SmartUpload();
    	//2. 给组件设置编码
    	smartUpload.setCharset("utf-8");
    	//3. 初始化
    	smartUpload.initialize(pageContext);
    	//4. 完成文件上传,将文件上传到服务器的内存中
    	try {
			smartUpload.upload();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	Request req = smartUpload.getRequest();
    	String foodname = req.getParameter("foodname");
    	String description = req.getParameter("description");
    	System.out.println("食物名称：" + foodname);
    	System.out.println("食物描述：" + description);
    	//String otherName = req.getParameter("other_name");
    	
    	//out.print("<h1>"+name+"和"+otherName+"在测姻缘</h1>");
    	//获取上传的文件，输出文件信息，保存到指定的文件夹
    	Files files = smartUpload.getFiles();
    	for(int i = 0; i < files.getCount(); i++){
    		File file = files.getFile(i);
    		//文件名
    		String filename = file.getFileName();
    		//文件大小
    		int size = file.getSize();
    		//文件的扩展名
    		String ext = file.getFileExt();
    		
    		String newName = MyFileUtils.generateName(ext);
    		System.out.println("上传的文件名：" + filename);
    		System.out.println("文件大小:" + size);
    		System.out.println("文件的扩展名：" + ext);
    		
//    		out.print("上传的文件名：" + filename);
//    		out.print("文件大小:" + size);
//    		out.print("文件的扩展名：" + ext);
//    		out.print("<img src='images/touxiang/"+newName+"'/>");
//    		out.print("<hr/>");
    		
    		//保存文件到指定的文件夹
    		try {
				file.saveAs("userImg/"+newName, SmartUpload.SAVE_VIRTUAL);
				System.out.println("保存文件成功");
				ArticleDao articleDao = new ArticleDaoImpl();
				Article article = new Article(0, userInfo.getUserId(), foodname, description, "userImg/"+newName, 0, 0);
				int result = articleDao.addArticle(article);
				if(result > 0){
					System.out.println("发布食物成功");
					response.sendRedirect(request.getContextPath() + "/index.jsp"); //Redirect to teacher home page
				}
				
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
