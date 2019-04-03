 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DB.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: aliceblue">
        <h1 align="center">View All User Status</h1>
        <table border="1" cellspacing="2" align="center" style="width: 80%;font-family: cursive;text-align: center;background: beige;border-collapse: collapse;color: navy;line-height: 30px;text-transform: capitalize;">
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>User Name</th>
                    <th>Mobile Number</th>
                    <th>E-Mail</th>
                    <th>Address</th>
                    <th>No . of Attempt</th>
                    <th>Status</th>
                    <th>Action</th>
                    
                </tr>
            </thead>
            <tbody>
            <%
                PreparedStatement query=con.prepareStatement("select * from register");
                ResultSet rs=query.executeQuery();
                while(rs.next())
                {
                    %>
                        <tr style="background: black;color: white;">
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("mobile")%></td>
                        <td><%=rs.getString("EMAIL")%></td>
                        <td><%=rs.getString("address")%></td>
                        <td><%=rs.getString("status")%></td> 
                         <td><%=rs.getString("profile")%></td> 
                        <td><A href="Revoke.jsp?id=<%=rs.getString("id")%>">Un_Revoke</a></td> 
                    </tr>
                    <%
                }
            %>
            </tbody>
        </table>
        <p align="center"><a href="Admin-Home.jsp" style="font-size: 20px;">Admin Home</a></p>
    </body>
</html>