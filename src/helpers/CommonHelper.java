package helpers;

import java.nio.charset.Charset;
import java.util.Random;

public class CommonHelper {
	public static String RandomString(int length) {
	    byte[] array = new byte[length]; // length is bounded by 7
	    new Random().nextBytes(array);
	    String generatedString = new String(array, Charset.forName("UTF-8"));
	    return generatedString;
	}
	
	/**
	 * Kiểm tra một giá trị có nằm trong list giá trị khác hay ko
	 * @param <T>
	 * @param array
	 * @param v
	 * @return
	 */
	public static <T> boolean contains(final T[] array, final T v) {
	    if (v == null) {
	        for (final T e : array)
	            if (e == null)
	                return true;
	    } 
	    else {
	        for (final T e : array)
	            if (e == v || v.equals(e))
	                return true;
	    }

	    return false;
	}
}
