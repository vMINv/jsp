<%@page import="util.FileUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "jdbc.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "org.apache.commons.fileupload.*"%>
<%@ page import = "org.apache.commons.fileupload.disk.*"%>
<%@ page import = "org.apache.commons.fileupload.servlet.*"%>

<%
	request.setCharacterEncoding("utf-8");//한글처리 
	
	String fbtitle = null;
	String fbwriter = "someone";
	String fbcontent = null;
	String fbfileone = null;//사진이름 
	String fbfiletwo = null;//사진이름 
	byte[] fbuone = null;//사진 
	byte[] fbutwo = null;//사진 
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	
	while(iter.hasNext()){
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();//키값속성추출 
		if(item.isFormField()){//키값 벨류값 형태의 데이터 추출 
			String value = item.getString("utf-8");
			if(name.equals("fbtitle")) fbtitle = value;
			else if(name.equals("fbcontent")) fbcontent = value;
		} else{
			if(name.equals("fbfileone")){
				fbfileone = item.getName();
				fbuone = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, fbfileone, fbuone);
			} else if(name.equals("fbfiletwo")){
				fbfileone = item.getName();
				fbutwo = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, fbfiletwo, fbutwo);
			}
		}
	}
	
	int result = FBoardDAO.insert(fbtitle, fbwriter, fbcontent, fbfileone, fbfiletwo);
%>