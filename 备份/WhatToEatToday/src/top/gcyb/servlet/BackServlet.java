package top.gcyb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yiban.open.Authorize;
import net.sf.json.JSONObject;
import top.gcyb.dao.UserInfoDao;
import top.gcyb.dao.impl.UserInfoDaoImpl;
import top.gcyb.entity.UserInfo;
import top.gcyb.utils.AppUtil;
import top.gcyb.utils.User;

/**
 * Servlet implementation class BackServlet
 */
@WebServlet("/Back.do")
public class BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		Authorize au = new Authorize(AppUtil.APPID,AppUtil.APPSECRET);
		JSONObject json = JSONObject.fromObject(au.querytoken(code, AppUtil.BACKURL));
		String accessToken = json.getString("access_token");
		request.getSession().setAttribute("accessToken", accessToken);
		//Obtain user authentication information from the API
		User user = new User(accessToken);
		JSONObject userInfo1 = JSONObject.fromObject(user.verifyme()).getJSONObject("info");
		JSONObject userInfo2 = JSONObject.fromObject(user.realme()).getJSONObject("info");
	
//		System.out.println(userInfo1.toString());
		//Encapsulate user information 
		UserInfo userInfo = new UserInfo(); 
		
		userInfo.setUserId(userInfo1.getString("yb_userid"));
		userInfo.setRealName(userInfo1.getString("yb_realname"));
		userInfo.setClassName(userInfo1.getString("yb_classname"));
		userInfo.setUserHead(userInfo2.getString("yb_userhead"));
		
		
		request.getSession().setAttribute("userInfo", userInfo);		//将用户信息放入session中
		
		//判断用户是否已经存在本地数据库中
		UserInfoDao userInfoDao = new UserInfoDaoImpl();	
		int result2 = userInfoDao.existUser(userInfo.getUserId());
		
		//开始写入用户信息
		if(result2 == 0){
			int result1 = userInfoDao.addUserInfo(userInfo);
			if(result1 == 1){
				System.out.println("添加用户成功");
				response.sendRedirect(request.getContextPath() + "/index.jsp"); //Redirect to teacher home page
			}
		}else{
			System.out.println("此用户已经存在本地数据库中");
			response.sendRedirect(request.getContextPath() + "/index.jsp"); //Redirect to teacher home page
		}
		
//		if(userInfo.getIdentity().equals("学生")){	//student login
//			System.out.println("某学生登陆  来自backServlet");
//			response.sendRedirect(request.getContextPath() + "/StudentIndex.do"); //Redirect to student home page
//		}else{
//			
//			System.out.println("某教师登陆  来自backServlet");
//			
//			//获取用户权限
//			PermissionDao permissionDao = new PermissionDaoImpl();
//			String permission = permissionDao.getPermissionByUserId(userInfo.getUserId());
//			
//			request.getSession().setAttribute("permission", permission);
//			System.out.print(permission);
//			System.out.print(userInfo.getUserId());
//			
//			if(permission != null){
//				if(permission.contains("学工部")){
//					if(deviceInfo.contains("PC")){
//						response.sendRedirect(request.getContextPath() + "/webApplication/boss/4-1-1.jsp"); //Redirect to xuegongbu home PC page
//					}else{
//						response.sendRedirect(request.getContextPath() + "/BossFormManager.do"); //Redirect to xuegongbu home Phone page
//					}
//				}else{
//					response.sendRedirect(request.getContextPath() + "/TeacherIndex.do"); //Redirect to teacher home page
//				}
//			}else{
//				PrintWriter out = response.getWriter();
//				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		        out.println("<HTML>");
//		        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		        out.println("  <BODY>");
//		        out.print(" <h3 color> You are not authorized to view this content </h3>");
//		        out.println("  </BODY>");
//		        out.println("</HTML>");
//		        //最后要记得清空缓存区，并且关闭。
//		        out.flush();
//		        out.close();
//			}
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
