package filetransfer;

/**
 *
 */

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.util.Scanner;

public class Receiver {


	public static Scanner scanner;

	public static void main (String [] args ) throws IOException
        {
            String fileLocation,ipAddress;
            int portNo;
            scanner=new Scanner(System.in);
            System.out.println("Enter Ip 127.0.0.1");
            ipAddress=scanner.next();

            System.out.println("Enter port number Like 2000");
            portNo=scanner.nextInt();
            System.out.println("Enter file Location for Save Like D:\\Sample.txt");
            fileLocation=scanner.next();
            Receiver rr=new Receiver();
            rr.receiveFile(ipAddress, portNo, fileLocation);
	}
	public void receiveFile(String ipAddress,int portNo,String fileLocation) throws IOException
	{

		int bytesRead=0;
		int current = 0;
		FileOutputStream fileOutputStream = null;
		BufferedOutputStream bufferedOutputStream = null;
		Socket socket = null;
		try {

			//creating connection.
			socket = new Socket(ipAddress,portNo);
			System.out.println("connected.");
			
			// receive file
			byte [] byteArray  = new byte [6022386];
			System.out.println("Please wait downloading file");
			
			//reading file from socket
			InputStream inputStream = socket.getInputStream();
			fileOutputStream = new FileOutputStream(fileLocation);
			bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
			bytesRead = inputStream.read(byteArray,0,byteArray.length);

			current = bytesRead;
			do 
                        {
                            bytesRead =inputStream.read(byteArray, current, (byteArray.length-current));
                            if(bytesRead >= 0) current += bytesRead;
			}while(bytesRead > -1);
			bufferedOutputStream.write(byteArray, 0 , current);
			bufferedOutputStream.flush();
			
			System.out.println("File " + fileLocation  + " downloaded ( size: " + current + " bytes read)");
		} catch (IOException e) {}
		finally {
			if (fileOutputStream != null) fileOutputStream.close();
			if (bufferedOutputStream != null) bufferedOutputStream.close();
			if (socket != null) socket.close();
		}
	}
}