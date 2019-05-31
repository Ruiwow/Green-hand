package top.gcyb.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class MyFileUtils {
	/**
	 * ���ݴ������չ���Զ�����һ���ļ���
	 * ��ʽ2016010800001.jpg
	 * @param ext
	 * @return
	 */
	public static String generateName(String ext){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String dateStr = dateFormat.format(new Date());
		
		Random random = new Random();
		int r = random.nextInt(100000);
		DecimalFormat decimalFormat = new DecimalFormat("00000");
		String str = decimalFormat.format(r);
		
		return dateStr + str +"." +ext;
	}
}






















