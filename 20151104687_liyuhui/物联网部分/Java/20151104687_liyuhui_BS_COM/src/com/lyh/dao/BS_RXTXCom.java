package com.lyh.dao;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.TooManyListenersException;
 
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;
 
/**
 * TODO
 * @author XWF
 */
public class BS_RXTXCom {
 
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//获得系统端口列表
		getSystemPort();
		//开启端口COM2，波特率9600
		final SerialPort serialPort = openSerialPort("COM4",9600);
		//设置串口的listener
        BS_RXTXCom.setListenerToSerialPort(serialPort, new SerialPortEventListener() {
			@Override
			public void serialEvent(SerialPortEvent arg0) {
				if(arg0.getEventType() == SerialPortEvent.DATA_AVAILABLE) {//数据通知
					byte[] bytes = BS_RXTXCom.readData(serialPort);
					System.out.println("收到的数据长度："+bytes.length);
					System.out.println("收到的数据：");
					System.out.println(new String(bytes));
					String str = new String(bytes);
					String houseId = str.substring(0, str.indexOf(":"));
					float hum = Float.parseFloat(str.substring(str.indexOf("Hum:")+4, str.indexOf(",Tem:")));
					float tem = Float.parseFloat(str.substring(str.indexOf("Tem:")+4));
					System.out.println(houseId+":"+hum+":"+tem);
					Connection con;
			        String driver = "com.mysql.jdbc.Driver";
			        String url = "jdbc:mysql://localhost:3306/LaboratoryCloudMonitoringSystem";
			        String user = "root";
			        String password = "123456";
			        try {
			            Class.forName(driver);
			            con = DriverManager.getConnection(url,user,password);
			            con.createStatement();
			            String sql = "select laboratory.tem_id from laboratory,place where laboratory.place_id = place.place_id and place.house_id = ?";
			            PreparedStatement pstm =null;
			            ResultSet rs = null ;
			            pstm = con.prepareStatement(sql);
						pstm.setString(1, houseId);
						rs = pstm.executeQuery();
			            int temId = 0;
			            while(rs.next()){
			            	temId = Integer.parseInt(rs.getString("tem_id"));
			            }
			            System.out.println(temId);
			            rs.close();
			            PreparedStatement psql;
			            psql = con.prepareStatement("insert into tem_hum (tem_id, time, temperature, humidity) "
			                    + "values(?,?,?,?)");
			            psql.setInt(1, temId);  
			            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			            psql.setString(2, df.format(new Date()));
			            psql.setFloat(3, tem);
			            psql.setFloat(4, hum);
			            psql.executeUpdate();   
			            con.close();
			        } catch(ClassNotFoundException e) {   
			            e.printStackTrace();   
			            } catch(SQLException e) {
			            e.printStackTrace();  
			            }catch (Exception e) {
			            e.printStackTrace();
			        }
				}
			}
		});
        
        //closeSerialPort(serialPort);
	}
	
	/**
	 * 获得系统可用的端口名称列表
	 * @return 可用端口名称列表
	 */
	@SuppressWarnings("unchecked")
	public static List<String> getSystemPort(){
		List<String> systemPorts = new ArrayList<>();
		//获得系统可用的端口
		Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();
		while(portList.hasMoreElements()) {
			String portName = portList.nextElement().getName();//获得端口的名字
			systemPorts.add(portName);
		}
		System.out.println("系统可用端口列表："+systemPorts);
		return systemPorts;
	}
	
	/**
	 * 开启串口
	 * @param serialPortName 串口名称
	 * @param baudRate 波特率
	 * @return 串口对象
	 */
	public static SerialPort openSerialPort(String serialPortName,int baudRate) {
		try {
			//通过端口名称得到端口
			CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(serialPortName);
			//打开端口，（自定义名字，打开超时时间）
			CommPort commPort = portIdentifier.open(serialPortName, 2222);
			//判断是不是串口
            if (commPort instanceof SerialPort) {
                SerialPort serialPort = (SerialPort) commPort;
                //设置串口参数（波特率，数据位8，停止位1，校验位无）
                serialPort.setSerialPortParams(baudRate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);                              
                System.out.println("开启串口成功，串口名称："+serialPortName);
                return serialPort;
            }        
            else {
                //是其他类型的端口
                throw new NoSuchPortException();
            }
		} catch (NoSuchPortException e) {
			e.printStackTrace();
		} catch (PortInUseException e) {
			e.printStackTrace();
		} catch (UnsupportedCommOperationException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 关闭串口
	 * @param serialPort 要关闭的串口对象
	 */
	public static void closeSerialPort(SerialPort serialPort) {
		if(serialPort != null) {
			serialPort.close();
			System.out.println("关闭了串口："+serialPort.getName());
			serialPort = null;
		}
	}
	
	/**
	 * 从串口读取数据
	 * @param serialPort 要读取的串口
	 * @return 读取的数据
	 */
	public static byte[] readData(SerialPort serialPort) {
		InputStream is = null;
        byte[] bytes = null;
        try {
        	is = serialPort.getInputStream();//获得串口的输入流
            int bufflenth = is.available();//获得数据长度
            while (bufflenth != 0) {                             
                bytes = new byte[bufflenth];//初始化byte数组
                is.read(bytes);
                bufflenth = is.available();
            } 
        } catch (IOException e) {
        	e.printStackTrace();
        } finally {
            try {
                if (is != null) {
                	is.close();
                	is = null;
                }
            } catch(IOException e) {
            	e.printStackTrace();
            }
        }
        return bytes;
	}
	
	/**
	 * 给串口设置监听
	 * @param serialPort
	 * @param listener
	 */
	public static void setListenerToSerialPort(SerialPort serialPort, SerialPortEventListener listener) {
		try {
			//给串口添加事件监听
			serialPort.addEventListener(listener);
		} catch (TooManyListenersException e) {
			e.printStackTrace();
		}
		serialPort.notifyOnDataAvailable(true);//串口有数据监听
		serialPort.notifyOnBreakInterrupt(true);//中断事件监听
	}
	
}

