package top.gcyb.utils;

import cn.yiban.util.HTTPSimple;



public class User
{
	
	private final String YIBAN_OPEN_URL		= "https://openapi.yiban.cn/";
	
	private final String YIBAN_USER_ME_INFO	= "user/me";
	private final String YIBAN_USER_OTHER	= "user/other";
	private final String YIBAN_USER_REALME	= "user/real_me";
	private final String YIBAN_USER_VERIFYME = "user/verify_me";
	private final String YIBAN_GROUP_PUBLIGROUP ="group/public_group";
	
	
	private String token;
	
	
	public User(String token)
	{
		this.token = token;
	}
	
	
	public String me()
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_ME_INFO;
		query += "?access_token=";
		query += token;
		return HTTPSimple.GET(query);
	}
	
	
	public String other(int userid)
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_OTHER;
		query += "?access_token=";
		query += token;
		query += "&yb_userid=";
		query += String.valueOf(userid);
		return HTTPSimple.GET(query);
	}
	
	
	public String realme()
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_REALME;
		query += "?access_token=";
		query += token;
		return HTTPSimple.GET(query);
	}

	public String verifyme()
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_VERIFYME;
		query += "?access_token=";
		query += token;
		return HTTPSimple.GET(query);
	}
	public String publicGroup(){
		String query = YIBAN_OPEN_URL;
		query += YIBAN_GROUP_PUBLIGROUP;
		query += "?access_token=";
		query += token;
		return HTTPSimple.GET(query);
	}
}