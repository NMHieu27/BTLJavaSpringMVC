/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Route;
import com.hal.repository.RouteRepository;
import com.hal.service.RouteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 */
@Service
public class RouteServiceImpl implements RouteService {

    @Autowired
    private RouteRepository routeRepository;

    @Override
    public List<Object[]> getRouteDetail(String name) {
        return this.routeRepository.getRouteDetail(name);
    }

    @Override
    public boolean addRoute(Route route) {
        System.out.println(route.getDestinationId());
        return this.routeRepository.addRoute(route);
    }

    @Override
    public Route getRouteById(int i) {
        return this.routeRepository.getRouteById(i);
    }

    @Override
    public boolean deleteRoute(Route route) {
        return this.routeRepository.deleteRoute(route);
    }

    @Override
    public List<Route> getRoutes(String string) {
        return this.routeRepository.getRoutes(string);
    }

    @Override
    public boolean updateRouteByAdmin(Route route, int i) {
        return this.routeRepository.updateRouteByAdmin(route, i);
    }

}
