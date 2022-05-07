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
import java.util.Date;
import java.util.List;
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
    public Ticket addTicket(int coachesId, String phone, String fullname, String email, long price) {
        Coaches coaches = this.coachesRepository.getCoachesById(coachesId);
        User user = this.userRepository.getUserById(6);

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
           if (this.ticketRepository.deleteTicket(ticket)){
               Coaches coaches = ticket.getCoachesId();
               coaches.setEmptySeats(coaches.getEmptySeats() + 1);
               this.coachesRepository.updateCoachesSeat(coaches);
               return true;
            }
        }
         return false;
    }
}
