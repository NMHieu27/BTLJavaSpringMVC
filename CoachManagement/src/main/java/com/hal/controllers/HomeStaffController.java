/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;
import com.hal.service.CoachesService;
import com.hal.service.LocationService;
import com.hal.service.TicketService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    @Autowired
    private LocationService locationService;
    @Autowired
    private CoachesService coachesService;
    
    @GetMapping("ticket-management")
    public String ticketManagement(Model model, HttpServletRequest request) {
        model.addAttribute("tickets", this.ticketService.getTicketsByCoachesId(Integer.parseInt(request.getParameter("coachesId"))));
        return "ticket-management";
    }

    @GetMapping("coaches-booking")
    public String coachesBooking(Model model, HttpServletRequest request) throws ParseException {
        int start = 1;
        int destination = 2;
        Date startDate = new Date();
        if (null != request.getQueryString()) {
            if (startDate.before(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")))){
                startDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            }
            start = Integer.parseInt(request.getParameter("start"));
            destination = Integer.parseInt(request.getParameter("destination"));
        }
        model.addAttribute("location", this.locationService.getLocations(null));
        model.addAttribute("coaches", this.coachesService.getCoachesDetails(start, destination, startDate));
        model.addAttribute("startId", request.getParameter("start"));
        model.addAttribute("destination", request.getParameter("destination"));
        model.addAttribute("date",  new SimpleDateFormat("yyyy-MM-dd").format(startDate));
        return "coaches-booking-staff";
    }
}