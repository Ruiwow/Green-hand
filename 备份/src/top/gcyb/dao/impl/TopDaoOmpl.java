package top.gcyb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import top.gcyb.dao.TopDao;
import top.gcyb.utils.BaseDao;

public class TopDaoOmpl extends BaseDao implements TopDao {

	@Override
	public int addTop(int articleId) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO top(articleId, userId, articleName, `text`, textImg,likeNum, unLike) "
				+ "(SELECT articleId, userId, articleName, `text`, textImg,likeNum, unLike FROM article "
				+ "WHERE articleId = ?)";
		return super.executeUpdate(sql, new Object[]{articleId});
	}

	@Override
	public Map<String, String> getTopMap() {
		// TODO Auto-generated method stub
		String sql = "SELECT userInfo.* , top.* FROM userInfo,top "
				+ "WHERE userInfo.`userId` = top.`userId` ORDER BY topId DESC LIMIT 1";
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, String> map = new HashMap<String, String>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				map.put("articleId", rs.getString("articleId"));
				map.put("userId", rs.getString("userId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("textImg", rs.getString("textImg"));
			//	map.put("addTime", rs.getString("addTime"));
				map.put("likeNum", rs.getString("likeNum"));
				map.put("unLike", rs.getString("unLike"));
				map.put("realName", rs.getString("realName"));
				map.put("className", rs.getString("className"));
				map.put("likeTotal", rs.getString("likeTotal"));
				map.put("userHead", rs.getString("userHead"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll(rs, pstmt, conn);
		}
		return map;
	}

}
