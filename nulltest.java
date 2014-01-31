import java.lang.*;
import java.io.*;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.*;
// derived from SUN's examples in the javax.comm package
import java.io.*;
import java.util.*;
//import javax.comm.*; // for SUN's serial/parallel port libraries
import gnu.io.*; // for rxtxSerial library

public class nulltest implements Runnable, SerialPortEventListener {
private Connection connection=null;

  private ResultSet rs = null;

  private Statement st = null;

  String connectionURL = "jdbc:mysql://localhost:3306/project";

   static CommPortIdentifier portId;
   static CommPortIdentifier saveportId;
   static Enumeration        portList;
   InputStream           inputStream;
   SerialPort           serialPort;
   Thread           readThread;
Scanner scan=new Scanner(System.in);
   static String        messageString=" ";
   static OutputStream      outputStream;
   static boolean        outputBufferEmptyFlag = false;
boolean ats= true;
int cou=0;
   public static void main(String[] args) {
      boolean           portFound = false;
      String           defaultPort;
      
      // determine the name of the serial port on several operating systems
      String osname = System.getProperty("os.name","").toLowerCase();
      if ( osname.startsWith("windows") ) {
         // windows
         defaultPort = "COM15";
      } else if (osname.startsWith("linux")) {
         // linux
        defaultPort = "/dev/ttyUSB0";
      } else if ( osname.startsWith("mac") ) {
         // mac
         defaultPort = "????";
      } else {
         System.out.println("Sorry, your operating system is not supported");
         return;
      }
          
      if (args.length > 0) {
         defaultPort = args[0];
      } 

      System.out.println("Set default port to "+defaultPort);
      
            // parse ports and if the default port is found, initialized the reader
      portList = CommPortIdentifier.getPortIdentifiers();
      while (portList.hasMoreElements()) {
         portId = (CommPortIdentifier) portList.nextElement();
         if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
            if (portId.getName().equals(defaultPort)) {
               System.out.println("Found port: "+defaultPort);
               portFound = true;
               // init reader thread
               nulltest reader = new nulltest();
            } 
         } 
         
      } 
      if (!portFound) {
         System.out.println("port " + defaultPort + " not found.");
      } 
      
   } 

   public void initwritetoport() {
      // initwritetoport() assumes that the port has already been opened and
      //    initialized by "public nulltest()"

      try {
         // get the outputstream
         outputStream = serialPort.getOutputStream();
      } catch (IOException e) {}

//      try {
//         // activate the OUTPUT_BUFFER_EMPTY notifier
//         serialPort.notifyOnOutputEmpty(true);
//      } catch (Exception e) {
//         System.out.println("Error setting event notification");
//         System.out.println(e.toString());
//         System.exit(-1);
//      }
      
   }

   public void writetoport() {
   
   //System.out.println("what do u wanna do:  ");
   //messageString=scan.next();
      System.out.println("Writing \""+messageString+"\" to "+serialPort.getName());
      try {
         // write string to serial port
         outputStream.write(messageString.getBytes());
		 
      } catch (IOException e) {}
   }
   
   public void getsetting()
  {
  
  String on="on",off="off";
  try
{
String sql = "select red,blue,white from users where emailid='anibharadwaj007@gmail.com';";
PreparedStatement ss=connection.prepareStatement(sql);
rs = ss.executeQuery();
rs.next();
if(rs.getString(1).equals(on))
messageString+="R";
else
messageString+="r";
if(rs.getString(2).equals(on))
messageString+="B";
else
messageString+="b";
if(rs.getString(3).equals(on))
messageString+="W";
else
messageString+="w";

System.out.println(" the string is  "+messageString);
}
catch(Exception e){
  //buf=buf+"<div style='background-color:black;color:#ffcc00;'><p>No matches found</p></div>";
     System.out.println(e);
 }
 }
 
   public nulltest() {
   
   try {

 // Load the database driver

  Class.forName("com.mysql.jdbc.Driver");

  // Get a Connection to the database

  connection = DriverManager.getConnection(connectionURL, "root", "anirudh"); 
//JOptionPane.showMessageDialog(null,"HEllo");
  }catch(Exception e){

  System.out.println("Exception is ;"+e);

  }
   
      // initalize serial port
      try {
         serialPort = (SerialPort) portId.open("SimpleReadApp", 2000);
      } catch (PortInUseException e) {}
   
      try {
         inputStream = serialPort.getInputStream();
      } catch (IOException e) {}
   
      try {
         serialPort.addEventListener(this);
      } catch (TooManyListenersException e) {}
      
      // activate the DATA_AVAILABLE notifier
      serialPort.notifyOnDataAvailable(true);
   
      try {
         // set port parameters
         serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, 
                     SerialPort.STOPBITS_1, 
                     SerialPort.PARITY_NONE);
      } catch (UnsupportedCommOperationException e) {}
      
      // start the read thread
      readThread = new Thread(this);
      readThread.start();
   }

   public void run() {
      // first thing in the thread, we initialize the write operation
      initwritetoport();
      try {
         while (ats) {
            // write string to port, the serialEvent will read it
			getsetting();
            writetoport();
			messageString=" ";
            Thread.sleep(2500);
			//if(cou>1)
			//ats=false;
			//cou++;
			 //System.exit(0);
         }
      } catch (InterruptedException e) {}
	 
   } 

   public void serialEvent(SerialPortEvent event) {
      switch (event.getEventType()) {
      case SerialPortEvent.BI:
      case SerialPortEvent.OE:
      case SerialPortEvent.FE:
      case SerialPortEvent.PE:
      case SerialPortEvent.CD:
      case SerialPortEvent.CTS:
      case SerialPortEvent.DSR:
      case SerialPortEvent.RI:
      case SerialPortEvent.OUTPUT_BUFFER_EMPTY:
         break;
      case SerialPortEvent.DATA_AVAILABLE:
         // we get here if data has been received
         byte[] readBuffer = new byte[20];
         try {
            // read data
            while (inputStream.available() > 0) {
			
               int numBytes = inputStream.read(readBuffer);
            } 
            // print data
            String result  = new String(readBuffer);
            System.out.println(result);
         } catch (IOException e) {}
   
         break;
      }
   } 

}
