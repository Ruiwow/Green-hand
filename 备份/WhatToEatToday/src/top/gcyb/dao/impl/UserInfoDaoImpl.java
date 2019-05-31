package top.gcyb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import top.gcyb.dao.UserInfoDao;
import top.gcyb.entity.UserInfo;
import top.gcyb.utils.BaseDao;

public class UserInfoDaoImpl extends BaseDao implements UserInfoDao {

	@Override
	public int addUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		String sql = "insert into userInfo(userId,realName,userHead,className,article,unLikeTotal,likeTotal)"
				+" values(?,?,?,?,?,?,?)";
		return super.executeUpdate(sql, new Object[]{userInfo.getUserId(),userInfo.getRealName(),
				userInfo.getUserHead(),userInfo.getClassName(),userInfo.getArticle(),
				userInfo.getUnLikeTotal(),userInfo.getLikeTotal()});
	}

	@Override
	public int existUser(String userId) {
		// TODO Auto-generated method stub
		String sql = "select count(*) c from userInfo where userId = ?";
		Connection conn = super.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("c");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		super.closeAll(rs, pstmt, conn);
		
		return result;
	}
	
	

}
