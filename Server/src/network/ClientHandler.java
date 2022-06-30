package network;

import controller.Controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;

import java.net.Socket;
import java.util.Scanner;

public class ClientHandler extends Thread {
    private Socket socket;
    public ClientHandler(Socket socket)
    {
        this.socket=socket;
    }
    @Override
    public void run()
    {
        try {
            DataInputStream dis =new DataInputStream(socket.getInputStream());
            DataOutputStream dos =new DataOutputStream(socket.getOutputStream());
            StringBuilder request=new StringBuilder();
            int c=dis.read();
            while (c!=0)
            {
                request.append((char) c);
                c=dis.read();
            }

            Scanner sc=new Scanner(request.toString());
            String command=sc.nextLine();
            System.out.println("command: "+command);//test
            String data=sc.nextLine();
            System.out.println("data: "+data);//test
            String response=new Controller().run(command,data);
            System.out.println("response: "+response);//test
            dos.writeBytes(response);
            dos.flush();

            dos.close();
            dis.close();
            socket.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }


    }
}
//
