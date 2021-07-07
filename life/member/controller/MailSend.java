package kr.co.life.member.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	private static MailSend instance = new MailSend();

	   private MailSend(){}

	   public static MailSend getInstance()
	   {
	     return instance;
	   }
	public int setEmail(String email, String subject, String body) throws Exception 
	{
	     String host = "smtp.naver.com"; 
	     final String username = "midassk"; // �۽��� ���̹� ���̵�
	     final String password = "eagle$0988"; // �۽��� ���̹� ��й�ȣ
	     int port=465;    
	     int state=0;

	     //String recipient = email; // �޴� ��� �̸��� �ּ�
	     //String subject = "�ȳ��ϼ���"; // �̸��� ����
	     //String body = "�׽�Ʈ�Դϴ�"; // �̸��� ����

	     Properties props = System.getProperties();

	     try {
	     props.put("mail.smtp.host", host);
	     props.put("mail.smtp.port", port);
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.ssl.enable", "true");
	     props.put("mail.smtp.ssl.trust", host);

	     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	         String un=username;
	         String pw=password;
	         protected PasswordAuthentication getPasswordAuthentication() {
	             return new PasswordAuthentication(un, pw);
	         }
	     });
	     session.setDebug(true); //for debug

	     Message mimeMessage = new MimeMessage(session);
	     mimeMessage.setFrom(new InternetAddress("midassk@naver.com")); // �۽��� ���̹� �ּ�
	     mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
	     mimeMessage.setSubject(subject);
	     mimeMessage.setText(body);
	     Transport.send(mimeMessage);
	     state=1;
	     }catch(Exception e){
	      state=0;
	     }
	     return state;
	   }
	
}
