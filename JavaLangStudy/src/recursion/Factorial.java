package recursion;

public class Factorial {
	/**
	 * 재귀함수... 본질
	 * 분할정복. 큰 문재를 작은 문재로 쪼개고 결합하면 해결된다.
	 * 가장 작은 문제를 맨 처음 검사하고 빠르게 반환
	 * @param t
	 * @return
	 */
	private static int calc(int t) {
		if (t == 1)
			return t;
		return calc(t - 1) * t;
	}
	public static void main(String[] args) {
		System.out.println(calc(3));
	}
}
