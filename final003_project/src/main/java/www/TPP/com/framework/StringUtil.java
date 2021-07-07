package www.TPP.com.framework;

public class StringUtil {
	
	public static int[] convertCommaSepString2IntArray(String ids) {
		String[] splited = ids.split(",");
		int[] ret = new int[splited.length];
		for (int i = 0; i < splited.length; i++) {
			try {
				ret[i] = Integer.parseInt(splited[i]);
			}catch(NumberFormatException e) {
			}
		}
		return ret;
	}
	
	public static boolean hasInfo(String str) {
		return str != null && ! str.trim().isEmpty();
	}
}
