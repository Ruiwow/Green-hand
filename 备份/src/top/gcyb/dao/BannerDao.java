package top.gcyb.dao;

import java.util.List;
import java.util.Map;

public interface BannerDao {
	public int addBanner(String foodName, String foodText, String foodImg, String time);
	public List<Map<String, String>> getBanner();
	public Map<String, String> getMapByBannerId(int bannerId);
}
