/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.formatter;

import com.hal.pojo.Pricechange;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Asus
 */
public class PriceChangeFormatter implements Formatter<Pricechange>{

    @Override
    public String print(Pricechange object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Pricechange parse(String text, Locale locale) throws ParseException {
        Pricechange pricechange = new Pricechange();
        pricechange.setId(Integer.parseInt(text));
        return pricechange;
    }
    
}
