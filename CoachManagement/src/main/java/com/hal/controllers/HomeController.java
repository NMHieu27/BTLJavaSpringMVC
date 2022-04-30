/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Asus
 */
@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    
    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("users", this.userService.getUsers(null));
        return "home-admin";
    }
}
