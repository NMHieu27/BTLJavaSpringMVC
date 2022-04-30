/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.controllers;

import com.hal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Asus
 */
@Controller
@RequestMapping("/admin")
public class HomeAdminController {

    @Autowired
    private UserService userService;

    public String homeAdmin(Model model) {
        model.addAttribute("users", this.userService.getUsers(null));
        return "home-admin";
    }
}
