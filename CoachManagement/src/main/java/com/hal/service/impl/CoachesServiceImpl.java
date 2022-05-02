/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Coaches;
import com.hal.repository.CoachesRepository;
import com.hal.service.CoachesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service
public class CoachesServiceImpl implements CoachesService{
    @Autowired
    private CoachesRepository coachesRepository;
    
    @Override
    public List<Object[]> getCoaches(String name) {
        return this.coachesRepository.getCoaches(name);
    }

    @Override
    public Coaches getCoachesById(int coachesId) {
        return this.coachesRepository.getCoachesById(coachesId);
    }

    @Override
    public boolean deleteCoaches(Coaches chs) {
        return this.coachesRepository.deleteCoaches(chs);
    }
    
}
