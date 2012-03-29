package test.com.yourantao.aimeili.util;

import java.util.List;

import main.com.yourantao.aimeili.util.PHPSerializer;

public class phpUnserialize {
	public static void main(String [] args){
		String aString="a:2:{i:0;s:71:\"http://photo.no5.com.cn/product/mphoto/1639_M_110812163531_24968544.jpg\";i:1;s:71:\"http://photo.no5.com.cn/product/mphoto/1639_M_110812163541_29857460.jpg\";}";
		try {
			List aaa=(List)PHPSerializer.unserialize(aString.getBytes());
			System.out.println(aaa);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
