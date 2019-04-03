 
<%@page import="Sam.mail"%>
<%@page import="java.util.Random"%>
<%
    String filename = request.getParameter("filename");
    System.out.println("++++++++++++++++++++"+filename);
    String userid=session.getAttribute("userid").toString();
        String email=session.getAttribute("usermail").toString();
        Random val=new Random();
        int key=val.nextInt(100000000);
        session.setAttribute("otpkey", key);
        System.out.println("This is opt "+key);
    //send otp to user mail
            //---------------------mail part ----------------------//
            String em[]= new String[1];

            String subject="OTP Verification";
            String message="Your OTP is "+key;
            String fr="pups0919";   //with out @gmail.com
            String pw="project09";	      // sender password
            em[0]=email;
            mail mmm=new mail();
            mmm.sendFromGMail(fr, pw, em, subject, message);
            System.out.println("email "+em[0]);
            //-----------------completed mail part --------------------//
        //code
        response.sendRedirect("OTP_Verifications.jsp?filename="+filename);
%>
