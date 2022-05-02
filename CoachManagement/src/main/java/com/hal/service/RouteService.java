/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import com.hal.pojo.Route;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface RouteService {
    List<Object[]> getRouteDetail(String name);
    void addRoute(Route route);
    Route getRouteById(int routeId);
    boolean deleteRoute(Route route);
}
