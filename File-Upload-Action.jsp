<%-- 
    Document   : File-Upload-Action
    Created on : Feb 9, 2019, 3:55:09 PM
    Author     : David
--%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@include file="DB.jsp"%>
<%
    String userid=session.getAttribute("userid").toString();
    String username=session.getAttribute("username").toString();
    
    File f = new File("C:\\Users-Files");
    if(!f.exists())
        f.mkdir();
    
    MultipartRequest m=new MultipartRequest(request,f.getAbsolutePath());
    File file=m.getFile("file");
    String filekey=m.getParameter("filekey");
    String filename=file.getName();
    String date=m.getParameter("date");
    String time=m.getParameter("time");
    PreparedStatement query=con.prepareStatement("insert into files(user_name,user_id,file_name,file_key,time,date)values('"+username+"','"+userid+"','"+filename+"','"+filekey+"','"+time+"','"+date+"')");
    query.executeUpdate();
    
    response.sendRedirect("View-All-Files.jsp");

%>