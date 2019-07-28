package com.abctravelagency.utility;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.json.JSONObject;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.MultipartFile;

public class Utility {
	
	public static int getGeneratedUniqueId() {     
        UUID idOne = UUID.randomUUID();
        String str=""+idOne;        
        int uid=str.hashCode();
        String filterStr=""+uid;
        str=filterStr.replaceAll("-", "");
        return Integer.parseInt(str);
    }
	
	public static String convertDate(Date date, String ptrn){
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(ptrn);
			String format = formatter.format(date);
			return format;
		} catch (Exception e) {
			return null;
		}
	}
	
	public static String convertDate(Date date){
		try {
			return convertDate(date,"yyyy-MM-dd");
		} catch (Exception e) {
			return null;
		}
	}
	
	public static Boolean isLoggedIn() {Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken))
			return true;
		else 
			return false;
	}
	
	public static String getUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authentication.getName();
	}
	
	public static String getImgByUsername(String username) throws IOException {
		if (username==null || username.equals(""))
			username = "avater";
		String img = System.getProperty("catalina.home")+"\\tmpFiles\\"+username+".png";
		BufferedImage bImage = ImageIO.read(new File(img));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bImage, "jpg", baos);
		baos.flush();
		byte[] imageInByteArray = baos.toByteArray();
		baos.close();
		String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
		return b64;
	}
	
	public static String getAlphaNumeric(int len) {

		char[] ch = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();

	    char[] c = new char[len];
	    SecureRandom random = new SecureRandom();
	    for (int i = 0; i < len; i++) {
	      c[i] = ch[random.nextInt(ch.length)];
	    }
	    return new String(c);
	}
	
	public String getBaseUrl(HttpServletRequest req) {
	    return req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath();
	}
	
	public static String uploadImg(MultipartFile file, String username) {
		
		if(!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				//Create directory to store photo
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "images");
				System.out.println(dir);
				if(!dir.exists())
					dir.mkdirs();
				//Create the file on the server
				username = username+".jpg";
				File serverFile = new File(dir.getAbsolutePath() + File.separator + username);
				
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				return "";
				
			} catch (Exception e) {
			}
		}
		return "";
	}
	
	public static String errorResponse(String msg) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("success", false);
		jsonObj.put("data", "");
		jsonObj.put("message", "Somthing went wrong");
		jsonObj.put("exception", msg);
		return jsonObj.toString();
	}

}
