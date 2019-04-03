<%@page import="Sam.mail"%>
<%@page import="java.util.Random"%>
<%
    String filename = request.getParameter("filename");
    try
    {
        
        
        //send otp to user mail
            //---------------------mail part ----------------------//
//            String em[]= new String[1];
//
//            String subject="OTP Verification";
//            String message="Your OTP is ";
//            String fr="invalid.dg";   //with out @gmail.com
//            String pw="Jesusjasmine";		      // sender password
//            em[0]=email;
//            mail mmm=new mail();
//            mmm.sendFromGMail(fr, pw, em, subject, message);
//            System.out.println("email "+em[0]);
            //-----------------completed mail part --------------------//
        //code
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
        <title>OTP Verifications</title>
    </head>
    <body style="background-color: aliceblue">
        <h1 align="center">Users File Download with OTP Verifications</h1>
        <form action="Download.jsp">
            <table border="1" cellspacing="2" align="center" style="width: 30%;font-family: cursive;text-align: center;background: beige;border-collapse: collapse;color: navy;line-height: 30px;text-transform: capitalize;">
                <thead>
                    <tr>
                        <th>Enter OTP</th>
                        <th><input type="text" placeholder="Enter Your OTP" name="otp"></th>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Download">
                        </td>
                    </tr>
                </thead>
            </table>
            <input type="hidden" name="filename" value="<%=filename%>"> 
        </form>
        <p align="center"><a href="User-Home.jsp" style="font-size: 20px;">User Home</a></p>
    </body>
</html> 