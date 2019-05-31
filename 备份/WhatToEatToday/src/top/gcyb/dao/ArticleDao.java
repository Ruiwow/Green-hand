package top.gcyb.dao;

import java.util.List;
import java.util.Map;

import top.gcyb.entity.Article;

public interface ArticleDao {
	public int addArticle(Article article);
	public List<Map<String, String>> getArticleByTimeDESC();  //获取所有的食物按照时间排序
	public List<Map<String, String>> getArticleByLikeDESC();	//获取所有食物按照点赞量排序
	public int addLike(String articleId);			//根据食物Id点赞
	public int addUnLike(String articleId);			//根据食物Id点踩
	public int deleteArticleByArticleId(int articleId);	//根据食物Id删除食物
	public List<Map<String, String>> getArticleTenByTimeDESC(int page);	//获取一页10个食物数据按时间排序
	public List<Map<String, String>> getArticleTenByLikeDESC(int page);	//获取一页10个食物数据按照热度、点赞量
	public List<Map<String, String>> adminGetNineByTimeDESC(int page);//管理员页面，每次获取9个，按照发布时间排序
	
	public int getCountOfArticle();		//获取文章总数
	public List<Map<String, String>> getArticleByArticleName(String articleName);	//检索菜名
}
