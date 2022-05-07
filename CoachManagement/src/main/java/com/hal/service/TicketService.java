/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service;

import com.hal.pojo.Ticket;
import java.util.List;

/**
 *
 * @author Linh
 */
public interface TicketService {
    Ticket addTicket(int coachesId, String phone, String fullname, String email, long price);
    int seatCheck(int coachesId);
    List<Ticket> getTicketsByCoachesId(int coachesId);
    boolean deleteTicket(int ticketId);
}
