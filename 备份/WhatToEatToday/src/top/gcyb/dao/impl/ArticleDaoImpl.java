package top.gcyb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import top.gcyb.dao.ArticleDao;
import top.gcyb.entity.Article;
import top.gcyb.utils.BaseDao;

public class ArticleDaoImpl extends BaseDao implements ArticleDao {

	@Override
	public int addArticle(Article article) {
		// TODO Auto-generated method stub
		String sql = "insert into article(userId,articleName,text,textImg,likeNum,unLike)"
				+" values(?,?,?,?,?,?)";
		return super.executeUpdate(sql, new Object[]{article.getUserId(),
				article.getArticleName(),article.getText(),article.getTextImg(),
				article.getLike(),article.getUnLike()});
	}

	@Override
	public List<Map<String, String>> getArticleByTimeDESC() {
		// TODO Auto-generated method stub
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` ORDER BY ADDTIME DESC";		//按照时间降序排列，即最新发布在前面
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, formName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}

	@Override
	public List<Map<String, String>> getArticleByLikeDESC() {
		// TODO Auto-generated method stub
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` ORDER BY likeNum DESC";		//按照点赞量降序排列
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, formName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}

	@Override
	public int addLike(String articleId) {
		// TODO Auto-generated method stub
		String sql = "UPDATE userInfo, article "
				+ "SET userInfo.`likeTotal` = userInfo.`likeTotal` + 1, article.`likeNum` = article.`likeNum` + 1 "
				+ "WHERE userInfo.`userId` = article.`userId` AND article.`articleId` = ?";		//维护时注意空格
		return super.executeUpdate(sql, new Object[]{articleId});
	}

	@Override
	public int addUnLike(String articleId) {
		// TODO Auto-generated method stub
		String sql = "UPDATE userInfo, article "
				+ "SET userInfo.`unLikeTotal` = userInfo.`unLikeTotal` + 1, article.`unLike` = article.`unLike` + 1 "
				+ "WHERE userInfo.`userId` = article.`userId` AND article.`articleId` = ?";		//维护时注意空格
		return super.executeUpdate(sql, new Object[]{articleId});
	}

	@Override
	public int deleteArticleByArticleId(int articleId) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM article WHERE articleId = ?";
		return super.executeUpdate(sql, new Object[]{articleId});
	}

	@Override
	public List<Map<String, String>> getArticleTenByTimeDESC(int page) {
		// TODO Auto-generated method stub
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` ORDER BY addTime DESC LIMIT ?,?";
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*10-10);
			pstmt.setInt(2, 10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				map.put("userHead", rs.getString("userHead"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}

	@Override
	public List<Map<String, String>> getArticleTenByLikeDESC(int page) {
		// TODO Auto-generated method stub
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` ORDER BY likeNum DESC LIMIT ?,?";
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*10-10);
			pstmt.setInt(2, 10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				map.put("userHead", rs.getString("userHead"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}

	@Override
	public List<Map<String, String>> adminGetNineByTimeDESC(int page) {
		// TODO Auto-generated method stub
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` ORDER BY addTime DESC LIMIT ?,?";
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page*9-9);
			pstmt.setInt(2, 9);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				map.put("userHead", rs.getString("userHead"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}

	@Override
	public int getCountOfArticle() {
		// TODO Auto-generated method stub
		String sql = "select count(*) c from article";
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("c");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return result;
	}

	@Override
	public List<Map<String, String>> getArticleByArticleName(String articleName) {
		// TODO Auto-generated method stub
		String sql = "SELECT userInfo.* , article.* FROM userInfo,article WHERE userInfo.`userId` = article.`userId` AND articleName = ?";
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, articleName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
				map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				map.put("userHead", rs.getString("userHead"));
				listMaps.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return listMaps;
	}
	

}
