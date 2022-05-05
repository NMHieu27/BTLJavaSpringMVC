/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import java.util.List;

/**
 *
 * @author Asus
 */
public interface StatsService {
    List<Object[]> getRouteStat();
    List<Object[]> getRevenueByMonth(int year);
    List<Object[]> getRevenueByQuarter(int year);
}
