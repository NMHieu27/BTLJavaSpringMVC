/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Station;
import com.hal.repository.StationRepository;
import com.hal.service.StationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Asus
 */
@Service
@Transactional
public class StationServiceImpl implements StationService {

    @Autowired
    private StationRepository stationRepository;

    @Override
    public List<Station> getStation(String kw) {
        return this.stationRepository.getStation("");
    }

}
