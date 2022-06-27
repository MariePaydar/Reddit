import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

public class Client {
    public static void main(String[] args) throws Exception {
        Socket socket=new Socket("127.0.0.1",8000);
        DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
        DataInputStream dis=new DataInputStream(socket.getInputStream());
        //dos.writeUTF("send\nmessage:manam salam,,me:reza");
        //dos.flush();
        //System.out.println(dis.readUTF());


        dos.writeUTF("get\ncount:2");
        dos.flush();
        System.out.println(dis.readUTF());
        dos.close();
        dis.close();
        socket.close();
    }
}
