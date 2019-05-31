package top.gcyb.entity;

public class Article {
	public int articleId;	//发文ID，系统自动生成
	public String userId;	//用户ID，区别出是发文作者
	public String articleName;	//发文名称
	public String text;			//文章详细内容
	public String textImg;		//文章配图路径
	public int like;			//点赞量
	public int unLike;			//点踩量
	
	
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Article(int articleId, String userId, String articleName, String text, String textImg, int like,
			int unLike) {
		super();
		this.articleId = articleId;
		this.userId = userId;
		this.articleName = articleName;
		this.text = text;
		this.textImg = textImg;
		this.like = like;
		this.unLike = unLike;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTextImg() {
		return textImg;
	}
	public void setTextImg(String textImg) {
		this.textImg = textImg;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getUnLike() {
		return unLike;
	}
	public void setUnLike(int unLike) {
		this.unLike = unLike;
	}
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", userId=" + userId + ", articleName=" + articleName + ", text="
				+ text + ", textImg=" + textImg + ", like=" + like + ", unLike=" + unLike + "]";
	}
	
	
}
