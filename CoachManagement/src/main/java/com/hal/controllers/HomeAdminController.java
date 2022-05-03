/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.controllers;

import com.hal.pojo.Coach;
import com.hal.pojo.Coaches;
import com.hal.pojo.Pricechange;
import com.hal.pojo.Route;
import com.hal.pojo.User;
import com.hal.service.CategoryService;
import com.hal.service.CoachService;
import com.hal.service.CoachesService;
import com.hal.service.PriceChangeService;
import com.hal.service.RouteService;
import com.hal.service.StationService;
import com.hal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

    @Autowired
    private PriceChangeService priceChangeService;

    @Autowired
    private CoachService coachService;

    @Autowired
    private RouteService routeService;

    @Autowired
    private CoachesService coachesService;

    @Autowired
    private StationService stationService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String homeAdmin() {
        return "home-admin";
    }

    //Quản lí người dùng
    @GetMapping("/users-manage")
    public String usersManage(Model model) {
        model.addAttribute("users", this.userService.getUsers(null));
        return "users-manage";
    }

    @GetMapping("/users-manage/add-user")
    public String addUserView(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    @PostMapping("/users-manage/add-user")
    public String addUser(Model model, @ModelAttribute(value = "user") User user) {
        if (user.getPassword().isEmpty()) {
            model.addAttribute("errMsg", "Vui lòng nhập mật khẩu");
        } else {
            if (this.userService.addUser(user) == true) {
                return "redirect:/admin/users-manage";
            }
            model.addAttribute("errMsg", "Có lỗi xảy ra");
        }
        return "add-user";
    }

    @GetMapping("/users-manage/delete/{user_id}")
    public String deleteUser(Model model, @PathVariable(value = "user_id") int userId) {
        User u = this.userService.getUserById(userId);
        if (this.userService.deleteUser(u) == true) {
            return "redirect:/admin/users-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "users-manage";
    }

    //Quản lí giá
    @GetMapping("/price-manage")
    public String priceManage(Model model) {
        model.addAttribute("prices", this.priceChangeService.getPriceChange(null));
        return "price-manage";
    }

    @GetMapping("/price-manage/add-price")
    public String addPriceView(Model model) {
        model.addAttribute("price", new Pricechange());
        return "add-price";
    }

    @PostMapping("/price-manage/add-price")
    public String addPriceProcess(Model model, @ModelAttribute(value = "price") Pricechange pricechange) {
        if(this.priceChangeService.addPrice(pricechange) == true)
            return "redirect:/admin/price-manage";
        model.addAttribute("errMsg", "Có lỗi xảy ra");
        return "add-price";
    }
    
    
    @GetMapping("/price-manage/update-price/{price_id}")
    public String updatePriceView(Model model, @PathVariable(value = "price_id") int priceId){
        model.addAttribute("price", this.priceChangeService.getPriceById(priceId));
        return "update-price";
    }
    
    @PostMapping("/price-manage/update-price/{price_id}")
    public String updatePriceProcess(Model model, 
            @ModelAttribute(value = "price") Pricechange pricechange,
            @PathVariable(value = "price_id") int i) {
        if(this.priceChangeService.updatePrice(pricechange, i) == true){
            return "redirect:/admin/price-manage";
        }
        model.addAttribute("errMsg", "Không thể sửa");
        return "update-price";
    }

    
    @GetMapping("/price-manage/delete/{price_id}")
    public String deletePrice(Model model, @PathVariable(value = "price_id") int priceId) {
        Pricechange p = this.priceChangeService.getPriceById(priceId);
        if (this.priceChangeService.deletePrice(p) == true) {
            return "redirect:/admin/price-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "price-manage";
    }

    
    //Quản lí xe khách
    @GetMapping("/coach-manage")
    public String coachManage(Model model) {
        model.addAttribute("listCoach", this.coachService.getCoach(null));
        return "coach-manage";
    }

    @GetMapping("/coach-manage/add-coach")
    public String addCoachView(Model model) {
        model.addAttribute("coach", new Coach());
        model.addAttribute("cates", this.categoryService.getCates(null));
        return "add-coach";
    }

    @PostMapping("/coach-manage/add-coach")
    public String addCoachProcess(Model model, @ModelAttribute(value = "coach") Coach coach) {
        if(this.coachService.addCoach(coach) == true)
            return "redirect:/admin/coach-manage";
        model.addAttribute("errMsg", "Có lỗi xảy ra");
        model.addAttribute("cates", this.categoryService.getCates(null));
        return "add-coach";
    }

    @GetMapping("/coach-manage/delete/{coach_id}")
    public String deleteCoach(Model model, @PathVariable(value = "coach_id") int coachId) {
        Coach c = this.coachService.getCoachById(coachId);
        if (this.coachService.deleteCoach(c) == true) {
            return "redirect:/admin/coach-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "coach-manage";
    }

    //Quản lí tuyến xe
    @GetMapping("/route-manage")
    public String routeManage(Model model) {
        model.addAttribute("routes", this.routeService.getRouteDetail(null));
        return "route-manage";
    }

    @GetMapping("/route-manage/add-route")
    public String addRouteView(Model model) {
        model.addAttribute("route", new Route());
        model.addAttribute("station", this.stationService.getStation(""));
        return "add-route";
    }

    @PostMapping("/route-manage/add-route")
    public String addRouteProcess(Model model, @ModelAttribute(value = "route") Route route) {
        if(this.routeService.addRoute(route) == true)
            return "redirect:/admin/route-manage";
        model.addAttribute("errMsg", "Có lỗi xảy ra");
        model.addAttribute("station", this.stationService.getStation(""));
        return "add-route";
    }

    @GetMapping("/route-manage/delete/{route_id}")
    public String deleteRoute(Model model, @PathVariable(value = "route_id") int routeId) {
        Route r = this.routeService.getRouteById(routeId);
        if (this.routeService.deleteRoute(r) == true) {
            return "redirect:/admin/route-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "route-manage";
    }

    //Quản lí chuyến xe
    @GetMapping("/coaches-manage")
    public String coachesManage(Model model) {
        model.addAttribute("Coaches", this.coachesService.getCoaches(null));
        return "coaches-manage";
    }
    
    @GetMapping("/coaches-manage/add-coaches")
    public String addCoachesView(Model model){
        model.addAttribute("coaches", new Coaches());
        model.addAttribute("listRoute", this.routeService.getRoutes(null));
        model.addAttribute("listCoach", this.coachService.getCoach(null));
        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
        return "add-coaches";
    }
    
    @PostMapping("/coaches-manage/add-coaches")
    public String addCoachesProocess(Model model, @ModelAttribute(value = "coaches") Coaches coaches) {
        if(this.coachesService.addCoaches(coaches) == true)
            return "redirect:/admin/coaches-manage";
        model.addAttribute("listRoute", this.routeService.getRoutes(null));
        model.addAttribute("listCoach", this.coachService.getCoach(null));
        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
        model.addAttribute("errMsg", "Lỗi");
        return "add-coaches";
    }
    

    @GetMapping("/coaches-manage/delete/{coaches_id}")
    public String deleteCoaches(Model model, @PathVariable(value = "coaches_id") int coachesId) {
        Coaches coaches = this.coachesService.getCoachesById(coachesId);
        if (this.coachesService.deleteCoaches(coaches) == true) {
            return "redirect:/admin/coaches-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "coaches-manage";
    }
}