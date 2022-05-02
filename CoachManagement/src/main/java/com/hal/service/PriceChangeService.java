/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import com.hal.pojo.Pricechange;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface PriceChangeService {
    List<Pricechange> getPriceChange(String name);
    void addPrice(Pricechange pricechange);
    Pricechange getPriceById(int id);
    boolean deletePrice(Pricechange pricechange);
}
