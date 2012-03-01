package main.com.yourantao.aimeili.action;

import java.io.*;
import java.util.Date;

import org.apache.struts2.ServletActionContext;



public class FileUploadAction extends BaseAction{

	 private static final long serialVersionUID = 572146812454l ;
     private static final int BUFFER_SIZE = 16 * 1024 ;
    
     //注意，文件上传时<s:file/>同时与myFile，myFileContentType,myFileFileName绑定
     //所以同时要提供myFileContentType,myFileFileName的set方法
     
     private File newtopic_thumb;	//上传文件
     private String contentType;//上传文件类型
     private String fileName;	//上传文件名
     private String imageFileName;
     private String caption;//文件说明，与页面属性绑定
    
     public void setMyFileContentType(String contentType)  {
    	 System.out.println("contentType : " + contentType);
         this .contentType = contentType;
    } 
    
     public void setMyFileFileName(String fileName)  {
    	 System.out.println("FileName : " + fileName);
         this .fileName = fileName;
    } 
        
     public void setNewtopic_thumb(File newtopic_thumb)  {
         this .newtopic_thumb = newtopic_thumb;
    } 
    
     public String getImageFileName()  {
         return imageFileName;
    } 
    
     public String getCaption()  {
         return caption;
    } 
 
      public void setCaption(String caption)  {
         this .caption = caption;
    } 
    
     private static void copy(File src, File dst)  {
         try  {
            InputStream in = null ;
            OutputStream out = null ;
             try  {                
                in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
                out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                 byte [] buffer = new byte [BUFFER_SIZE];
                 while (in.read(buffer) > 0 )  {
                    out.write(buffer);
                } 
             } finally  {
                 if ( null != in)  {
                    in.close();
                } 
                  if ( null != out)  {
                    out.close();
                } 
            } 
         } catch (Exception e)  {
            e.printStackTrace();
        } 
    } 
    
     private static String getExtention(String fileName)  {
         int pos = fileName.lastIndexOf(".");
         return fileName.substring(pos);
    } 
 
    @Override
     public String execute()      {        
        imageFileName = new Date().getTime() + getExtention(fileName);
        File imageFile = new File(ServletActionContext.getServletContext().getRealPath("/UploadImages" ) + "/" + imageFileName);
        copy(newtopic_thumb, imageFile);
         return SUCCESS;
    }
}
