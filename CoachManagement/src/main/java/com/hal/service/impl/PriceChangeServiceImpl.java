/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Pricechange;
import com.hal.repository.PriceChangeRepository;
import com.hal.service.PriceChangeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service
public class PriceChangeServiceImpl implements PriceChangeService {

    @Autowired
    private PriceChangeRepository priceChangeRepository;

    @Override
    public List<Pricechange> getPriceChange(String name) {
        return this.priceChangeRepository.getPriceChange(name);
    }

    @Override
    public boolean addPrice(Pricechange prchng) {
        return this.priceChangeRepository.addPrice(prchng);
    }

    @Override
    public Pricechange getPriceById(int i) {
        return this.priceChangeRepository.getPriceById(i);
    }

    @Override
    public boolean deletePrice(Pricechange prchng) {
        return this.priceChangeRepository.deletePrice(prchng);
    }

    @Override
    public boolean updatePrice(Pricechange prchng, int priceId) {
        return this.priceChangeRepository.updatePrice(prchng, priceId);
    }

}
