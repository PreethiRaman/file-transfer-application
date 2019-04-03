<%-- 
    Document   : Logout
    Created on : 31 Mar, 2019, 10:57:35 PM
    Author     : Raajashri Chandru
--%>

<%
session.invalidate();
response.sendRedirect("Logout.jsp"); 
%>
