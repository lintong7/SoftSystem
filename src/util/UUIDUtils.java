package util;

import java.util.UUID;

/**
 * @author LinTong
 * @date:  2018年5月17日 下午9:28:50
 * @Description: 生成随机32位的UUID（通用唯一识别码）
 */
public class UUIDUtils {
	/**
	 * 获得一个UUID
	 * @return String UUID
	 */
	public static String getUUID() {
		String uuid = UUID.randomUUID().toString();
		// 去掉“-”符号
		return uuid.replaceAll("-", "");
	}
	
	/**
	 * 获得指定数目的UUID
	 * @param number int 需要获得的UUID数量
	 * @return String[] UUID数组
	 */
	public static String[] getUUID(int number) {
		if (number < 1) {
			return null;
		}
		String[] retArray = new String[number];
		for (int i = 0; i < number; i++) {
			retArray[i] = getUUID();
		}
		return retArray;
	}
}
