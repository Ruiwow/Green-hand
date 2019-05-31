package top.gcyb.dao;

import java.util.Map;

public interface TopDao {
	public int addTop(int articleId);
	public Map<String, String> getTopMap();			//获取被置顶的食物
}
