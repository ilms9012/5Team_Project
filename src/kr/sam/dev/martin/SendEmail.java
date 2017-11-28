package kr.sam.dev.martin;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
 public static void main(String[] args) {

  String host     = "smtp.naver.com";
  final String user   = "id"; // 아디
  final String password  = "pw"; //비번 

  String to     = "ilms9012@gmail.com"; // 받는주소

  
  // Get the session object
  Properties props = new Properties();
  props.put("mail.smtp.host", host);
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable", "true");

  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(user, password);
   }
  });

  // Compose the message
  try {
   MimeMessage message = new MimeMessage(session);
   message.setFrom(new InternetAddress(user));
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

   // Subject
   message.setSubject("[테스트] Java Mail Test","utf-8");
   
   // Text
   message.setText("메일 테스트 성공");

   // send the message
   Transport.send(message);
   System.out.println("message sent successfully...");

  } catch (MessagingException e) {
   e.printStackTrace();
  }
 }
}