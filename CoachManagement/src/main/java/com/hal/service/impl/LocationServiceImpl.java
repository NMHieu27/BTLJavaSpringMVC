/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service.impl;

import com.hal.pojo.Location;
import com.hal.repository.LocationRepository;
import com.hal.service.LocationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class LocationServiceImpl implements LocationService{
    @Autowired
    private LocationRepository locationRepository;

    @Override
    public List<Location> getLocations(String locationName){
        return this.locationRepository.getLocals(locationName);
    }
}