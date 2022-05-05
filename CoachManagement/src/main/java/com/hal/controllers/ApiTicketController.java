/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.pojo.Ticket;
import com.hal.service.TicketService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Linh
 */
@RestController
public class ApiTicketController {
    @Autowired
    private TicketService ticketService;
    
    @PostMapping(path = "api/add-ticket", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Ticket> addComment(@RequestBody Map<String, String> params) {
        try {
            String fullname = params.get("fullname");
            String email = params.get("email");
            String phone = params.get("phone");
            int coachesId = Integer.parseInt(params.get("coachesId"));
            long price = Long.parseLong(params.get("price"));
            
            Ticket ticket = this.ticketService.addTicket(coachesId, phone, fullname, email, price);
            System.out.println(ticket.getCreatedDate());
            return new ResponseEntity<>(ticket, HttpStatus.CREATED);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
