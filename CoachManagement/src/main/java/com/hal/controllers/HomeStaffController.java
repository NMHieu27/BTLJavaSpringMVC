/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;
import com.hal.service.TicketService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Linh
 */
@Controller
@RequestMapping("/staff")
public class HomeStaffController {
    
    @Autowired
    private TicketService ticketService;
    @GetMapping("ticket-management")
    public String ticketManagement(Model model, HttpServletRequest request) {
        model.addAttribute("tickets", this.ticketService.getTicketsByCoachesId(Integer.parseInt(request.getParameter("coachesId"))));
        return "ticket-management";
    }
}