/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.pojo.Ticket;
import com.hal.pojo.User;
import com.hal.service.TicketService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session){
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
    }
    
    @PostMapping(path = "api/add-ticket", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Ticket>> addTicket(@RequestBody Map<String, String> params, HttpSession session) {
        try {
            String fullname = params.get("fullname");
            String email = params.get("email");
            String phone = params.get("phone");
            int coachesId = Integer.parseInt(params.get("coachesId"));
            long price = Long.parseLong(params.get("price"));
            int amount = Integer.parseInt(params.get("amount"));
            
            List<Ticket> ticket = new ArrayList<>();
            User user = (User) session.getAttribute("currentUser");
            for (int i=0; i<amount;i++)
                ticket.add(this.ticketService.addTicket(coachesId, phone, fullname, email, price, user));
            return new ResponseEntity<>(ticket, HttpStatus.CREATED);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "api/seat-check", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Object> checkSeats (@RequestBody Map<String, String> params) {
        try {
            int coachesId = Integer.parseInt(params.get("coachesId"));
            Object seat = this.ticketService.seatCheck(coachesId);
            return new ResponseEntity<>(seat, HttpStatus.CREATED);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    @PostMapping(path = "api/delete-ticket", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Object> deleteTicket (@RequestBody Map<String, String> params) {
        try {
            int ticketId = Integer.parseInt(params.get("ticketId"));
            Object flag = this.ticketService.deleteTicket(ticketId);
            return new ResponseEntity<>(flag, HttpStatus.CREATED);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
