<%-- 
    Document   : View-All-Files
    Created on : Feb 9, 2019, 3:53:42 PM
    Author     : David
--%>
<%
    try
    {
        String userid=session.getAttribute("userid").toString();
    }
    catch(Exception ex)
    {
        response.sendRedirect("Error-Page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DB.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: aliceblue">
        <h1 align="center">View All Users Uploaded Files</h1>
        <table border="1" cellspacing="2" align="center" style="width: 80%;font-family: cursive;text-align: center;background: beige;border-collapse: collapse;color: navy;line-height: 30px;text-transform: capitalize;">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Uploaded By</th>
                    <th>User ID</th>
                    <th>File</th>
                    <th>File Key</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                PreparedStatement query=con.prepareStatement("select * from files");
                ResultSet rs=query.executeQuery();
                while(rs.next())
                {
                    %>
                    <tr style="background: black;color: white;">
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("user_id")%></td>
                        <td><%=rs.getString("file_name")%></td>
                        <td><%=rs.getString("file_key")%></td>
                        <td><%=rs.getString("date")%></td>
                        <td><%=rs.getString("time")%></td>
                        <td><a href="OTP.jsp?filename=<%=rs.getString("file_name")%>" style="font-size: 20px;text-decoration: none;color: greenyellow;">Download</a></td>
                    </tr>
                    <%
                }
            %>
            </tbody>
        </table>
        <p align="center"><a href="User-Home.jsp" style="font-size: 20px;">User Home</a></p>
    </body>
</html>