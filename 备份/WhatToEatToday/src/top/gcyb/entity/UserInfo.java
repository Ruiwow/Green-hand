package top.gcyb.entity;

public class UserInfo {
	public String userId;	//易班用户ID
	public String realName;	//	用户真实姓名
	public String userHead;	//用户头像
	public String className;	//用户专业班级
	public int article;		//发文数
	public int unLikeTotal;	//被踩总量
	public int likeTotal;	//被赞总量
	
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserInfo(String userId, String realName, String userHead, String className, int article, int unLikeTotal,
			int likeTotal) {
		super();
		this.userId = userId;
		this.realName = realName;
		this.userHead = userHead;
		this.className = className;
		this.article = article;
		this.unLikeTotal = unLikeTotal;
		this.likeTotal = likeTotal;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUserHead() {
		return userHead;
	}
	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getArticle() {
		return article;
	}
	public void setArticle(int article) {
		this.article = article;
	}
	public int getUnLikeTotal() {
		return unLikeTotal;
	}
	public void setUnLikeTotal(int unLikeTotal) {
		this.unLikeTotal = unLikeTotal;
	}
	public int getLikeTotal() {
		return likeTotal;
	}
	public void setLikeTotal(int likeTotal) {
		this.likeTotal = likeTotal;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", realName=" + realName + ", userHead=" + userHead + ", className="
				+ className + ", article=" + article + ", unLikeTotal=" + unLikeTotal + ", likeTotal=" + likeTotal
				+ "]";
	}
	
}
