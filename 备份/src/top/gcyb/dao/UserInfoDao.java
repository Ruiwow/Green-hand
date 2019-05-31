package top.gcyb.dao;

import top.gcyb.entity.UserInfo;

public interface UserInfoDao {
	public int addUserInfo(UserInfo userInfo);
	public int existUser(String userId);		//判断用户是否存在本地数据库中
}
