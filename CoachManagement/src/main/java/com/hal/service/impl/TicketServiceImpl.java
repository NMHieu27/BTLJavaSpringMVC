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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private CoachesRepository coachesRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public boolean addTicket(int coachesId, String phone, String fullname, String email, long price) {
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
        return this.ticketRepository.addTicket(ticket);
    }
    
}
