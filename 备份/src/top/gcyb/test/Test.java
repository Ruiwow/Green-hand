package top.gcyb.test;

import java.util.List;
import java.util.Map;

import top.gcyb.dao.ArticleDao;
import top.gcyb.dao.impl.ArticleDaoImpl;

public class Test {
	public static void main(String[] args) {
		ArticleDao articleDao = new ArticleDaoImpl();
		List<Map<String, String>> listMaps = articleDao.getArticleByArticleName("烤肉");
		System.out.println(listMaps.toString());
	}
	
}
