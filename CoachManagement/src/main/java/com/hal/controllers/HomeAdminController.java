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
import com.hal.service.StatsService;
import com.hal.service.UserService;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Autowired
    private StatsService statsService;

    @GetMapping
    public String homeAdmin() {
        return "home-admin";
    }

    //Quản lí người dùng
    @GetMapping("/users-manage")
    public String usersManage(Model model,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        model.addAttribute("users", this.userService.getUsers(kw));
        return "users-manage";
    }

    @GetMapping("/users-manage/add-user")
    public String addUserView(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    @PostMapping("/users-manage/add-user")
    public String addUser(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        if (result.hasErrors()) {
            return "add-user";
        }
        this.userService.addUser(user);
        return "redirect:/admin/users-manage";
    }

    @GetMapping("/users-manage/update-user/{user_id}")
    public String updateUserView(Model model, @PathVariable(value = "user_id") int userId) {
        model.addAttribute("user", this.userService.getUserById(userId));
        return "update-user";
    }

    @PostMapping("/users-manage/update-user/{user_id}")
    public String updatePriceProcess(Model model,
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result,
            @PathVariable(value = "user_id") int i) {
//        if (this.userService.updateUserByAdmin(user, i) == true) {
//            return "redirect:/admin/users-manage";
//        }
//        model.addAttribute("errMsg", "Không thể sửa");
//        return "update-user";
        if (result.hasErrors()) {
            return "update-user";
        }
        this.userService.updateUserByAdmin(user, i);
        return "redirect:/admin/users-manage";
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
    public String priceManage(Model model,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        model.addAttribute("prices", this.priceChangeService.getPriceChange(kw));
        return "price-manage";
    }

    @GetMapping("/price-manage/add-price")
    public String addPriceView(Model model) {
        model.addAttribute("price", new Pricechange());
        return "add-price";
    }

    @PostMapping("/price-manage/add-price")
    public String addPriceProcess(Model model, @ModelAttribute(value = "price") @Valid Pricechange pricechange,
            BindingResult result) {
//        if (this.priceChangeService.addPrice(pricechange) == true) {
//            return "redirect:/admin/price-manage";
//        }
//        model.addAttribute("errMsg", "Có lỗi xảy ra");
//        return "add-price";
        if (result.hasErrors()) {
            return "add-price";
        }
        this.priceChangeService.addPrice(pricechange);
        return "redirect:/admin/price-manage";
    }

    @GetMapping("/price-manage/update-price/{price_id}")
    public String updatePriceView(Model model, @PathVariable(value = "price_id") int priceId) {
        model.addAttribute("price", this.priceChangeService.getPriceById(priceId));
        return "update-price";
    }

    @PostMapping("/price-manage/update-price/{price_id}")
    public String updatePriceProcess(Model model,
            @ModelAttribute(value = "price") @Valid Pricechange pricechange,
            BindingResult result,
            @PathVariable(value = "price_id") int i) {
//        if (this.priceChangeService.updatePrice(pricechange, i) == true) {
//            return "redirect:/admin/price-manage";
//        }
//        model.addAttribute("errMsg", "Không thể sửa");
//        return "update-price";
        if (result.hasErrors()) {
            return "update-price";
        }
        this.priceChangeService.updatePrice(pricechange, i);
        return "redirect:/admin/price-manage";

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
    public String coachManage(Model model,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        model.addAttribute("listCoach", this.coachService.getCoach(kw));
        return "coach-manage";
    }

    @GetMapping("/coach-manage/add-coach")
    public String addCoachView(Model model) {
        model.addAttribute("coach", new Coach());
        model.addAttribute("cates", this.categoryService.getCates(null));
        return "add-coach";
    }

    @PostMapping("/coach-manage/add-coach")
    public String addCoachProcess(Model model, @ModelAttribute(value = "coach") @Valid Coach coach,
            BindingResult result) {
//        if (this.coachService.addCoach(coach) == true) {
//            return "redirect:/admin/coach-manage";
//        }
//        model.addAttribute("errMsg", "Có lỗi xảy ra");
//        model.addAttribute("cates", this.categoryService.getCates(null));
//        return "add-coach";
        if (result.hasErrors()) {
            model.addAttribute("errMsg", "Có lỗi xảy ra");
            model.addAttribute("cates", this.categoryService.getCates(null));
            return "add-coach";
        }
        this.coachService.addCoach(coach);
        return "redirect:/admin/coach-manage";
    }

    @GetMapping("/coach-manage/update-coach/{coach_id}")
    public String updateCoachView(Model model, @PathVariable(value = "coach_id") int coachId) {
        model.addAttribute("coach", this.coachService.getCoachById(coachId));
        model.addAttribute("cates", this.categoryService.getCates(null));
        return "update-coach";
    }

    @PostMapping("/coach-manage/update-coach/{coach_id}")
    public String updateCoachProcess(Model model,
            @ModelAttribute(value = "coach") @Valid Coach coach,
            BindingResult result,
            @PathVariable(value = "coach_id") int i) {
//        if (this.coachService.updateCoachByAdmin(coach, i) == true) {
//            return "redirect:/admin/coach-manage";
//        }
//        model.addAttribute("errMsg", "Không thể sửa");
//        model.addAttribute("cates", this.categoryService.getCates(null));
//        return "update-coach";
        if (result.hasErrors()) {
            model.addAttribute("errMsg", "Không thể sửa");
            model.addAttribute("cates", this.categoryService.getCates(null));
            return "update-coach";
        }
        this.coachService.updateCoachByAdmin(coach, i);
        return "redirect:/admin/coach-manage";
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
    public String routeManage(Model model,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        model.addAttribute("routes", this.routeService.getRouteDetail(kw));
        return "route-manage";
    }

    @GetMapping("/route-manage/add-route")
    public String addRouteView(Model model) {
        model.addAttribute("route", new Route());
        model.addAttribute("station", this.stationService.getStation(""));
        return "add-route";
    }

    @PostMapping("/route-manage/add-route")
    public String addRouteProcess(Model model, @ModelAttribute(value = "route") @Valid Route route,
            BindingResult result) {
//        if (this.routeService.addRoute(route) == true) {
//            return "redirect:/admin/route-manage";
//        }
//        model.addAttribute("errMsg", "Có lỗi xảy ra");
//        model.addAttribute("station", this.stationService.getStation(""));
//        return "add-route";

        if (result.hasErrors()) {
            model.addAttribute("errMsg", "Có lỗi xảy ra");
            model.addAttribute("station", this.stationService.getStation(""));
            return "add-route";
        }
        this.routeService.addRoute(route);
        return "redirect:/admin/route-manage";
    }

    @GetMapping("/route-manage/update-route/{route_id}")
    public String updateRouteView(Model model, @PathVariable(value = "route_id") int routeId) {
        model.addAttribute("route", this.routeService.getRouteById(routeId));
        model.addAttribute("station", this.stationService.getStation(""));
        return "update-route";
    }

    @PostMapping("/route-manage/update-route/{route_id}")
    public String updateRouteProcess(Model model,
            @ModelAttribute(value = "route") @Valid Route route,
            BindingResult result,
            @PathVariable(value = "route_id") int i) {
//        if (this.routeService.updateRouteByAdmin(route, i)) {
//            return "redirect:/admin/route-manage";
//        }
//        model.addAttribute("errMsg", "Không thể sửa");
//        model.addAttribute("station", this.stationService.getStation(""));
//        return "update-route";
        if (result.hasErrors()) {
            model.addAttribute("errMsg", "Không thể sửa");
            model.addAttribute("station", this.stationService.getStation(""));
            return "update-route";
        }
        this.routeService.updateRouteByAdmin(route, i);
        return "redirect:/admin/route-manage";
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
    public String coachesManage(Model model,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        model.addAttribute("Coaches", this.coachesService.getCoaches(kw));
        return "coaches-manage";
    }

    @GetMapping("/coaches-manage/add-coaches")
    public String addCoachesView(Model model) {
        model.addAttribute("coaches", new Coaches());
        model.addAttribute("listRoute", this.routeService.getRoutes(null));
        model.addAttribute("listCoach", this.coachService.getCoach(null));
        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
        return "add-coaches";
    }

    @PostMapping("/coaches-manage/add-coaches")
    public String addCoachesProocess(Model model, @ModelAttribute(value = "coaches") @Valid Coaches coaches,
            BindingResult result) {
//        if (this.coachesService.addCoaches(coaches) == true) {
//            return "redirect:/admin/coaches-manage";
//        }
//        model.addAttribute("listRoute", this.routeService.getRoutes(null));
//        model.addAttribute("listCoach", this.coachService.getCoach(null));
//        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
//        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
//        model.addAttribute("errMsg", "Lỗi");
//        return "add-coaches";
        if (result.hasErrors()) {
            model.addAttribute("listRoute", this.routeService.getRoutes(null));
            model.addAttribute("listCoach", this.coachService.getCoach(null));
            model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
            model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
            model.addAttribute("errMsg", "Lỗi");
            return "add-coaches";
        }
        System.out.println(coaches.getCoachId().getId());
        int coachId = coaches.getCoachId().getId();
        Coach c1 = this.coachService.getCoachById(coachId);
        System.out.println("so ghe trong");
        System.out.println(c1.getCategoryId().getNumberofseat());
        int emptySeat = c1.getCategoryId().getNumberofseat();
        System.out.println("tien cua xe khach");
        System.out.println(c1.getPrice());
        long coachPrice = c1.getPrice();
        int routeId = coaches.getRouteId().getId();
        Route r1 = this.routeService.getRouteById(routeId);
        long routePrice = r1.getPrice();
        System.out.println("Tien cua route");
        System.out.println(routePrice);
        System.out.println("Value:");
        //Giá trị thay đổi giá 30%, 20%, 15% kiểu Bigdecimal

//        BigDecimal valuePriceChange = coaches.getPricechangeId().getValue();
        int priceChangeId = coaches.getPricechangeId().getId();
        Pricechange pc1 = this.priceChangeService.getPriceById(priceChangeId);
        BigDecimal valuePriceChange = pc1.getValue();
        System.out.println(valuePriceChange);

        //Giá gốc kiểu long
        long coachesUnitPriceLong = coachPrice + routePrice;
        System.out.println("Giá gốc: ");
        System.out.println(coachesUnitPriceLong);

        //Giá gốc kiểu Bigdecimal
        BigDecimal coachesUnitPriceBigDecimal = new BigDecimal(coachesUnitPriceLong);

        //Số tiền được giảm, tăng dạng Bigdecimal
        BigDecimal coachesChangeBigDecimal = coachesUnitPriceBigDecimal.multiply(valuePriceChange);

        //Số tiền được giảm, tăng dạng Long
        long coachesChangeLong = coachesChangeBigDecimal.longValue();

        //Số tiền sau khi được giảm giá
        long coachesPriceAfterChange = coachesUnitPriceLong + coachesChangeLong;
        System.out.println("Giá sau khi giảm giá:");
        System.out.println(coachesPriceAfterChange);

        coaches.setEmptySeats(emptySeat);
        coaches.setUnitprice(coachesUnitPriceLong);
        coaches.setPricechange(coachesPriceAfterChange);

        this.coachesService.addCoaches(coaches);
        return "redirect:/admin/coaches-manage";
    }

    @GetMapping("/coaches-manage/update-coaches/{coaches_id}")
    public String updateCoachesView(Model model, @PathVariable(value = "coaches_id") int coachesId) {
        model.addAttribute("coaches", this.coachesService.getCoachesById(coachesId));
        model.addAttribute("listRoute", this.routeService.getRoutes(null));
        model.addAttribute("listCoach", this.coachService.getCoach(null));
        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
        return "update-coaches";
    }

    @PostMapping("/coaches-manage/update-coaches/{coaches_id}")
    public String updateRouteProcess(Model model,
            @ModelAttribute(value = "coaches") @Valid Coaches coaches,
            BindingResult result,
            @PathVariable(value = "coaches_id") int i) {
        coaches.setStartTime(LocalDateTime.parse(coaches.getStartDateString()));
        coaches.setEndTime(LocalDateTime.parse(coaches.getEndDateString()));

//        Ghi chú: Sẽ tính lại tiền trước và sau giả giá nếu có thay đổi xe và tuyến xe
//        if (this.coachesService.updateCoachesByAdmin(coaches, i) == true) {
//            return "redirect:/admin/coaches-manage";
//        }
//        model.addAttribute("errMsg", "Không thể sửa");
//        model.addAttribute("coaches", this.coachesService.getCoachesById(i));
//        model.addAttribute("listRoute", this.routeService.getRoutes(null));
//        model.addAttribute("listCoach", this.coachService.getCoach(null));
//        model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
//        model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
//        return "update-coaches";
        if (result.hasErrors()) {
            model.addAttribute("errMsg", "Không thể sửa");
            model.addAttribute("coaches", this.coachesService.getCoachesById(i));
            model.addAttribute("listRoute", this.routeService.getRoutes(null));
            model.addAttribute("listCoach", this.coachService.getCoach(null));
            model.addAttribute("listDriver", this.userService.getUserByRole(User.DRIVER));
            model.addAttribute("listPriceChange", this.priceChangeService.getPriceChange(null));
            return "update-coaches";
        }

        int coachId = coaches.getCoachId().getId();
        Coach c1 = this.coachService.getCoachById(coachId);
        System.out.println("tien cua xe khach");
        System.out.println(c1.getPrice());
        long coachPrice = c1.getPrice();
        int routeId = coaches.getRouteId().getId();
        Route r1 = this.routeService.getRouteById(routeId);
        long routePrice = r1.getPrice();
        System.out.println("Tien cua route");
        System.out.println(routePrice);
        System.out.println("Value:");
        //Giá trị thay đổi giá 30%, 20%, 15% kiểu Bigdecimal

//        BigDecimal valuePriceChange = coaches.getPricechangeId().getValue();
        int priceChangeId = coaches.getPricechangeId().getId();
        Pricechange pc1 = this.priceChangeService.getPriceById(priceChangeId);
        BigDecimal valuePriceChange = pc1.getValue();
        System.out.println(valuePriceChange);

        //Giá gốc kiểu long
        long coachesUnitPriceLong = coachPrice + routePrice;
        System.out.println("Giá gốc: ");
        System.out.println(coachesUnitPriceLong);

        //Giá gốc kiểu Bigdecimal
        BigDecimal coachesUnitPriceBigDecimal = new BigDecimal(coachesUnitPriceLong);

        //Số tiền được giảm, tăng dạng Bigdecimal
        BigDecimal coachesChangeBigDecimal = coachesUnitPriceBigDecimal.multiply(valuePriceChange);

        //Số tiền được giảm, tăng dạng Long
        long coachesChangeLong = coachesChangeBigDecimal.longValue();

        //Số tiền sau khi được giảm giá
        long coachesPriceAfterChange = coachesUnitPriceLong + coachesChangeLong;
        System.out.println("Giá sau khi giảm giá:");
        System.out.println(coachesPriceAfterChange);

        coaches.setPricechange(coachesPriceAfterChange);
        this.coachesService.updateCoachesByAdmin(coaches, i);
        return "redirect:/admin/coaches-manage";

    }

    @GetMapping("/coaches-manage/delete/{coaches_id}")
    public String deleteCoaches(Model model, @PathVariable(value = "coaches_id") int coachesId,
            @RequestParam(name = "kw", defaultValue = "") String kw) {
        Coaches coaches = this.coachesService.getCoachesById(coachesId);
        if (coaches.getIsStarted() == true) {
            model.addAttribute("errMsg", "Không thể xóa vì xe đã chạy");
            model.addAttribute("Coaches", this.coachesService.getCoaches(kw));
            return "coaches-manage";
        }
        if (this.coachesService.deleteCoaches(coaches) == true) {
            return "redirect:/admin/coaches-manage";
        }
        model.addAttribute("errMsg", "Không thể xóa");
        return "coaches-manage";
    }

//    Báo cáo thống kê
    @GetMapping("/route-stat")
    public String routeStat(Model model) {
        model.addAttribute("routeStat", this.statsService.getRouteStat());
        return "route-stat";
    }

    @GetMapping("/revenue-stat")
    public String routeRevenue(Model model,
            @RequestParam(name = "year", defaultValue = "2022") Integer year) {
        model.addAttribute("revenueMonth", this.statsService.getRevenueByMonth(year));
        model.addAttribute("revenueQuarter", this.statsService.getRevenueByQuarter(year));
        return "revenue-stat";
    }
}
