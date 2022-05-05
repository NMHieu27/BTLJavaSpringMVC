/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Ticket;
import com.hal.repository.StatsRepository;
import com.hal.service.StatsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service
public class StatsServiceImpl implements StatsService{

    @Autowired
    private StatsRepository statsRepository;
    
    @Override
    public List<Object[]> getRouteStat() {
        return this.statsRepository.getRouteStat();
    }

    @Override
    public List<Object[]> getRevenueByMonth(int year) {
        return this.statsRepository.getRevenueByMonth(year);
    }

    @Override
    public List<Object[]> getRevenueByQuarter(int year) {
        return this.statsRepository.getRevenueByQuarter(year);
    }
    
    
}
