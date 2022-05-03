/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.formatter;

import com.hal.pojo.Coach;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Asus
 */
public class CoachFormatter implements Formatter<Coach>{

    @Override
    public String print(Coach object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Coach parse(String text, Locale locale) throws ParseException {
        Coach coach = new Coach();
        coach.setId(Integer.parseInt(text));
        return coach;
    }
    
}
