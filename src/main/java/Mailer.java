import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Bian
 */
class Mailer {
   /* public static void send(String to,String subject,String msg, PrintWriter out, HttpServletResponse response){  
        
        String from = "smtp@googlemail.com";

        String host = "localhost";

        Properties properties = System.getProperties();

        properties.setProperty("mail.smtp.host", host);

        Session session = Session.getDefaultInstance(properties);

        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();

        try {
           MimeMessage message = new MimeMessage(session);

           message.setFrom(new InternetAddress(from));

           message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

           message.setSubject("This is the Subject Line!");

           message.setText("This is actual message");

           Transport.send(message);
           String title = "Send Email";
           String res = "Sent message successfully....";
           String docType =
              "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";

           out.println(docType +
              "<html>\n" +
                 "<head><title>" + title + "</title></head>\n" +
                 "<body bgcolor = \"#f0f0f0\">\n" +
                    "<h1 align = \"center\">" + title + "</h1>\n" +
                    "<p align = \"center\">" + res + "</p>\n" +
                 "</body>"+
              "</html>"
           );
        } catch (MessagingException mex) {
           out.println(mex.getMessage());
           mex.printStackTrace();
        }*/
        /*//final String user="sonoojaiswal@javatpoint.com";        
        //final String pass="xxxxx";  
        
        final String host = "localhost";

        Properties props = new Properties();  
        props.put("mail.smtp.host", host);//"mail.javatpoint.com");
        //props.put("mail.smtp.auth", "true");  

        Session session = Session.getDefaultInstance(props);/*,  
         new javax.mail.Authenticator() {  
          protected PasswordAuthentication getPasswordAuthentication() {  
           return new PasswordAuthentication(user,pass);  
           }  
        });  */
        /*try {  
            MimeMessage message = new MimeMessage(session);  
            message.setFrom(new InternetAddress("placeholder@gmail.com"));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(subject);  
            message.setText(msg);  

            Transport.send(message);  

            out.println("Enviado");

         } catch (MessagingException e) {
            out.println("Erro: " + e.getMessage());
            throw new RuntimeException(e);  
         }*/
    //}
}