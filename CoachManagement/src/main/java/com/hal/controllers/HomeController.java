/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.pojo.Comment;
import com.hal.pojo.User;
import com.hal.service.CoachesService;
import com.hal.service.CommentService;
import com.hal.service.LocationService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Asus
 */
@Controller
public class HomeController {

    @Autowired
    private LocationService locationService;
    @Autowired
    private CoachesService coachesService;
    @Autowired
    private CommentService commentService;
   
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
            startDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            start = Integer.parseInt(request.getParameter("start"));
            destination = Integer.parseInt(request.getParameter("destination"));
        }
        model.addAttribute("location", this.locationService.getLocations(null));
        model.addAttribute("coaches", this.coachesService.getCoachesDetails(start, destination, startDate));
        return "coaches-booking";
    }

    @GetMapping("coaches-detail")
    public String getCoachesDetail(Model model, HttpServletRequest request) {
        if (null != request.getQueryString()){
            model.addAttribute("coa", this.coachesService.getCoachesDetailsById(Integer.parseInt(request.getParameter("coachesId"))).get(0));
            model.addAttribute("comments", this.commentService.getComments(Integer.parseInt(request.getParameter("coachId")), Integer.parseInt(request.getParameter("routeId"))));
            model.addAttribute("coachesId", Integer.parseInt(request.getParameter("coachesId")));
        }
        return "coaches-detail";
    }
}
