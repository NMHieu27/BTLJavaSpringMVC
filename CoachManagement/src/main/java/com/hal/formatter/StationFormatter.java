/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.formatter;

import com.hal.pojo.Station;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Asus
 */
public class StationFormatter implements Formatter<Station>{

    @Override
    public String print(Station object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Station parse(String text, Locale locale) throws ParseException {
        Station sta = new Station();
        sta.setId(Integer.parseInt(text));
        return sta;
    }
    
}
