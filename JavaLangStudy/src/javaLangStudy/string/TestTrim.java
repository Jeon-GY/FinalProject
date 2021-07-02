package javaLangStudy.string;

public class TestTrim {

	public static void main(String[] args) {
		String x = "rs[itf]";
		System.out.println("" + x.indexOf('['));
		System.out.println("" + x.lastIndexOf(']'));
		System.out.println(x.substring(x.indexOf('[') + 1, x.lastIndexOf(']')));

	}

}
