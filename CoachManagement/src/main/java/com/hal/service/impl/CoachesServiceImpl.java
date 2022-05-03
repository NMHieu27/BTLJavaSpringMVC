/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service.impl;

import com.hal.repository.CoachesRepository;
import com.hal.service.CoachesService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class CoachesServiceImpl implements CoachesService{
    @Autowired
    private CoachesRepository coachesRepository;
    
    @Override
    public List<Object[]> getCoaches(int start, int end, Date startDate){
        return this.coachesRepository.getCoaches(start, end, startDate);
    }
    
    @Override
    public List<Object[]> getCoachesById(int coachesId){
        return this.coachesRepository.getCoachesById(coachesId);
    }
}
