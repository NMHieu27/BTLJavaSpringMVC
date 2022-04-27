/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Asus
 */
@Controller
public class HomeController {
    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("name", "Nguyễn Minh Hiếu");
        return "adminpages";
    }
}
