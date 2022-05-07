/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service.impl;

import com.hal.pojo.Coaches;
import com.hal.pojo.Ticket;
import com.hal.pojo.User;
import com.hal.repository.CoachesRepository;
import com.hal.repository.TicketRepository;
import com.hal.repository.UserRepository;
import com.hal.service.TicketService;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private CoachesRepository coachesRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public Ticket addTicket(int coachesId, String phone, String fullname, String email, long price, User user) {
        final String username = "1951052099linh@ou.edu.vn";
        final String password = "01643219182*";

        Coaches coaches = this.coachesRepository.getCoachesById(coachesId);
        if (user == null) {
            user = this.userRepository.getUserById(1);
        }

        Ticket ticket = new Ticket();
        ticket.setCoachesId(coaches);
        ticket.setUserId(user);
        ticket.setPhone(phone);
        ticket.setFullname(fullname);
        ticket.setEmail(email);
        ticket.setPrice(price);
        ticket.setCreatedDate(new Date());
        Ticket reticket = this.ticketRepository.addTicket(ticket);
        if (reticket != null) {
            coaches.setEmptySeats(coaches.getEmptySeats() - 1);
            this.coachesRepository.updateCoachesSeat(coaches);
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true"); //TLS

            Session session = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                MimeMessage mimeMessage = new MimeMessage(session);
                String messege = "Cám ơn ông,bà: " + fullname + " đã sử dụng dịch vụ thuê xe H&L\n"
                        + "Mã số vé của quý khách là: "+ticket.getId()+"\n"
                        + "Tạo ngày: "+ticket.getCreatedDate()+"\n\n\n"
                        + "Vui lòng xuất trình mail này trước quầy để lấy vé. Cảm ơn đã tin tưởng hãng xe H&L";
                mimeMessage.setHeader("Đây là Tiêu đề", "text/plain; charset=UTF-8");
                mimeMessage.setFrom(new InternetAddress("1951052099linh@ou.edu.vn"));
                mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
                mimeMessage.setSubject("Thông tin vé xe của " + fullname, "utf-8");
                mimeMessage.setContent(messege, "text/plain; charset=UTF-8");

                Transport.send(mimeMessage);

            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }

        return reticket;
    }

    @Override
    public int seatCheck(int coachesId) {
        Coaches coaches = this.coachesRepository.getCoachesById(coachesId);
        return coaches.getEmptySeats();
    }

    @Override
    public List<Ticket> getTicketsByCoachesId(int coachesId) {
        return this.ticketRepository.getTicketsByChoachesId(coachesId);
    }

    @Override
    public boolean deleteTicket(int ticketId) {
        Ticket ticket = this.ticketRepository.getTicketById(ticketId);
        if (ticket != null) {
            if (this.ticketRepository.deleteTicket(ticket)) {
                Coaches coaches = ticket.getCoachesId();
                coaches.setEmptySeats(coaches.getEmptySeats() + 1);
                this.coachesRepository.updateCoachesSeat(coaches);
                return true;
            }
        }
        return false;
    }
}
