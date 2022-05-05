/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.controllers;

import com.hal.pojo.User;
import com.hal.service.UserService;
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
public class LoginController {

    @Autowired
    private UserService userDetailsService;
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = null;
        user.setUserRole(User.USER);
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/login";
            else if (user.getFile() == null) {
                errMsg = "Mời bạn thiết lập ảnh đại diện!";
            }
            else errMsg = "Có lỗi xảy ra!!!";
        }
        else
            errMsg = "Mật khẩu không khớp";
        model.addAttribute("errMsg", errMsg);
        return "register";
    }
}
