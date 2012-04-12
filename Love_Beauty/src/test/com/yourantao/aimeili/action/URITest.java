package test.com.yourantao.aimeili.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class URITest {
	
	public static void main(String [] args){
		
	URL url;
	try {
		url = new URL("http://photo.no5.com.cn/product/mphoto/10003_M_110812105125_45626961.jpg");
		
		 URLConnection   uc   =   url.openConnection(); 
         InputStream   is   =   uc.getInputStream(); 
         File   file   =   new   File( "D:/testImg"); 
         FileOutputStream   out   =   new   FileOutputStream(file); 
         int   i=0; 
         while   ((i=is.read())!=-1)   { 
                 out.write(i); 
         } 
         is.close();
		System.out.println(file);
	} catch (MalformedURLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
//
}
}

