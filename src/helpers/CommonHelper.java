package helpers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class CommonHelper{
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
	
	  public static String getPostDataString(HashMap<String, String> params) throws UnsupportedEncodingException{
	        StringBuilder result = new StringBuilder();
	        boolean first = true;
	        for(Map.Entry<String, String> entry : params.entrySet()){
	        	if(entry == null)  continue;

	            if (first)
	                first = false;
	            else
	                result.append("&");
	            
	            
	            result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
	            result.append("=");
	            result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
	        }

	        return result.toString();
	    }
	  
	  public static Date ConverToDate(LocalDate localDate) {
		  return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
	  }
}
