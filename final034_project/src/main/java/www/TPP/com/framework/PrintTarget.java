package www.TPP.com.framework;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target({ TYPE, FIELD, METHOD })
public @interface PrintTarget {
	//출력 순서
	int order() default 0;
	//Caption
	String caption() default "";
	
	String pattern() default "";
	
	boolean withAnchor() default false;
}
