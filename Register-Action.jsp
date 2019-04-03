<%-- 
    Document   : Register-Action
    Created on : Feb 9, 2019, 2:34:37 PM
    Author     : David
--%>
<%@page import="java.sql.*"%>
<%@include file="DB.jsp"%>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String mobile=request.getParameter("mobile");
    String email=request.getParameter("email");
    String address=request.getParameter("address");
    
    PreparedStatement query=con.prepareStatement("insert into register(user_name,password,mobile,email,address)"
            + "values('"+username+"','"+password+"','"+mobile+"','"+email+"','"+address+"')");
    query.executeUpdate();
    
    out.print("<script>alert('Successfully Registered');</script>");
    RequestDispatcher rd=request.getRequestDispatcher("Logout.jsp");
    rd.include(request, response);

%>