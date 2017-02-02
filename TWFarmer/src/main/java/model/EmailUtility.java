package model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class EmailUtility {
    public static void sendEmail(String msgWriterId, String msgReaderId, String msgTitle, String msgContent, String msgTime) throws AddressException,
            MessagingException, SQLException {
    	final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
    	final String USERNAME = "sa";
    	final String PASSWORD = "P@ssw0rd";
    	Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
    	PreparedStatement statement 
        = conn.prepareStatement("insert into Msg (MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus) values (?, ?, ?, ?, ?, ?)");	
    	
        // sets SMTP server properties
/*        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);
 
        // sends the e-mail
        Transport.send(msg);*/
 
    }
}