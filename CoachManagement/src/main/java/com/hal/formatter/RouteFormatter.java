/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.formatter;

import com.hal.pojo.Route;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Asus
 */
public class RouteFormatter implements Formatter<Route>{

    @Override
    public String print(Route object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Route parse(String text, Locale locale) throws ParseException {
        Route route = new Route();
        route.setId(Integer.parseInt(text));
        return route;   
    }
    
}
