/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.pojo.User;
import com.hal.service.CoachesService;
import com.hal.service.CommentService;
import com.hal.service.LocationService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 *
 * @author Asus
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private LocationService locationService;
    @Autowired
    private CoachesService coachesService;
    @Autowired
    private CommentService commentService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("location", this.locationService.getLocations(null));
        return "index";
    }

    @GetMapping("coaches-booking")
    public String getCoaches(Model model, HttpServletRequest request) throws ParseException {
        int start = 1;
        int destination = 2;
        Date startDate = new Date();
        if (null != request.getQueryString()) {
            if (startDate.before(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date")))) {
                startDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            }
            start = Integer.parseInt(request.getParameter("start"));
            destination = Integer.parseInt(request.getParameter("destination"));
        }
//        int page = Integer.parseInt(request.getParameter("page"));
        model.addAttribute("location", this.locationService.getLocations(null));
//        model.addAttribute("coachesCounter", this.coachesService.countCoaches());
        model.addAttribute("coaches", this.coachesService.getCoachesDetails(start, destination, startDate));
        model.addAttribute("startId", request.getParameter("start"));
        model.addAttribute("destination", request.getParameter("destination"));
        model.addAttribute("date", new SimpleDateFormat("yyyy-MM-dd").format(startDate));
        return "coaches-booking";
    }

    @GetMapping("coaches-detail")
    public String getCoachesDetail(Model model, HttpServletRequest request) {
        if (null != request.getQueryString()) {
            model.addAttribute("coa", this.coachesService.getCoachesDetailsById(Integer.parseInt(request.getParameter("coachesId"))).get(0));
            model.addAttribute("comments", this.commentService.getComments(Integer.parseInt(request.getParameter("coachId")), Integer.parseInt(request.getParameter("routeId"))));
            model.addAttribute("coachesId", Integer.parseInt(request.getParameter("coachesId")));
        }
        return "coaches-detail";
    }

    @GetMapping("user-booking-history")
    public String getUserBookingHistory(Model model, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "login";
        }
        model.addAttribute("tickets", this.coachesService.getCoachesDetailsByUser(user.getId()));
        return "user-booking-history";
    }
}
