package top.gcyb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import top.gcyb.dao.BannerDao;
import top.gcyb.utils.BaseDao;

public class BannerDaoImpl extends BaseDao implements BannerDao {

	@Override
	public int addBanner(String foodName, String foodText, String foodImg, String time) {
		// TODO Auto-generated method stub
		String sql = "insert into banner(articleName,text,img,time)"
				+" values(?,?,?,?)";
		return super.executeUpdate(sql, new Object[]{foodName,foodText,foodImg,time});
	}

	@Override
	public List<Map<String, String>> getBanner() {
		// TODO Auto-generated method stub
		List<Map<String, String>> listMaps = new ArrayList<Map<String,String>>();
		String sql = "SELECT * FROM banner WHERE bannerId IN "
				+ "(SELECT MAX(bannerId) AS id FROM `banner` GROUP BY `time`)";
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, formName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap<String, String>();
				map.put("bannerId", rs.getString("bannerId"));
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("img", rs.getString("img"));
				map.put("time", rs.getString("time"));
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
	public Map<String, String> getMapByBannerId(int bannerId) {
		// TODO Auto-generated method stub
		String sql = "SELECT articleName, `text`, img FROM banner WHERE bannerId = ?";
		Map<String, String> map = new HashMap<String, String>();
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bannerId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map.put("articleName", rs.getString("articleName"));
				map.put("text", rs.getString("text"));
				map.put("img", rs.getString("img"));
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
