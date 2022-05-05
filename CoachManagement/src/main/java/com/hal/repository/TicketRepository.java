/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.repository;

import com.hal.pojo.Ticket;

/**
 *
 * @author Linh
 */
public interface TicketRepository {
    Ticket addTicket(Ticket ticket);
}
