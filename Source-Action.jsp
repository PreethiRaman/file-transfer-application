<%-- 
    Document   : Source-Action
    Created on : Jan 16, 2019, 10:46:36 PM
    Author     : David
--%>
<%
    try
    {
        String admin=session.getAttribute("admin").toString();
    }
    catch(Exception ex)
    {
        response.sendRedirect("Error-Page.jsp");
    }
%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%
    File f = new File("C:\\Temp-Files");
    if(!f.exists())
        f.mkdir();
    
    MultipartRequest m=new MultipartRequest(request,f.getAbsolutePath());
    File file=m.getFile("file");
    session.setAttribute("path", file.getAbsolutePath());
           System.out.println("This is File Name  = "+file.getName());
           System.out.println("This is File Path  = "+file.getPath());
    response.sendRedirect("Source-View.jsp");

%>
