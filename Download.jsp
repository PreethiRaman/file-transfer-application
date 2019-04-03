<%-- 
    Document   : Download
    Created on : Feb 9, 2019, 6:23:46 PM
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
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%
    String userid=session.getAttribute("userid").toString();
        String otp = request.getParameter("otp");
        String keyotp = session.getAttribute("otpkey").toString(); 
        String filename = request.getParameter("filename");
        if(otp.equalsIgnoreCase(keyotp))
        {
                String filePath = "C:\\Users-Files\\" + filename;
                File downloadFile = new File(filePath);
                FileInputStream inStream = new FileInputStream(downloadFile);

                // if you want to use a relative path to context root:
                String relativePath = getServletContext().getRealPath("");
                System.out.println("relativePath = " + relativePath);

                // obtains ServletContext
                ServletContext context = getServletContext();

                // gets MIME type of the file
                String mimeType = context.getMimeType(filePath);
                if (mimeType == null) {
                    // set to binary type if MIME mapping not found
                    mimeType = "application/octet-stream";
                }
                System.out.println("MIME type: " + mimeType);

                // modifies response
                response.setContentType(mimeType);
                response.setContentLength((int) downloadFile.length());

                // forces download
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
                response.setHeader(headerKey, headerValue);

                // obtains response's output stream
                OutputStream outStream = response.getOutputStream();

                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }

                inStream.close();
                outStream.close();
        }
        else 
        {
            out.print("<script>"
                    + "alert('Sorry Invalid OTP');"
                    + "</script>");
            RequestDispatcher rd =request.getRequestDispatcher("OTP_Verifications.jsp?filename="+filename);
            rd.include(request,response);
        }
    
%>

