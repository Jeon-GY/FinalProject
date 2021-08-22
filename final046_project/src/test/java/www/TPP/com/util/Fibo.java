package www.TPP.com.util;

import org.junit.Test;

public class Fibo {
	int checkCount = 0;
	
	int num1 = 0;
	int num2 = 1;
	
	private void getFibo(int count) {
		if(count <= checkCount)
			return;
		int retNum1 = num2;
		int retNum2 = num1 + num2;
		
		num1 = retNum1;
		num2 = retNum2;
		if(checkCount == 1)
			System.out.print(num1 + " ");
		System.out.print(num2 + " ");
		
		checkCount++;
		getFibo(count);
	}
	
	@Test
	public void test() {
		getFibo(10);
	}
}
