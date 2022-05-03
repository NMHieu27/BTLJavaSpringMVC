/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.formatter;

import com.hal.pojo.Location;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Linh
 */
public class LocationFormatter implements Formatter<Location>{

    @Override
    public String print(Location object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Location parse(String text, Locale locale) throws ParseException {
        Location location = new Location();
        location.setId(Integer.parseInt(text));
        return location;
    }
    
}
