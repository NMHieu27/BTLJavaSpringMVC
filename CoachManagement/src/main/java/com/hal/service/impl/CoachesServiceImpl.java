/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.hal.pojo.Coaches;
import com.hal.repository.CoachesRepository;
import com.hal.service.CoachesService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import com.hal.repository.CoachesRepository;
import com.hal.service.CoachesService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 * @author Linh
 */
 */
@Service
public class CoachesServiceImpl implements CoachesService {

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

    @Override
    public boolean addCoaches(Coaches coaches) {
        try {
            
            coaches.setIsCanceled(false);
            coaches.setIsStarted(false);
            long unitPrice = coaches.getCoachId().getPrice() + coaches.getRouteId().getPrice();
            coaches.setUnitprice(unitPrice);
            Date dateS = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(coaches.getStartDateString());
            Date dateE = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(coaches.getEndDateString());
            coaches.setStartTime(dateS);
            coaches.setEndTime(dateE);
            int emptySeats = 10;
            coaches.setEmptySeats(emptySeats);
            System.out.println(coaches.getUnitprice());
            System.out.println(coaches.getPricechange());
            System.out.println(coaches.getEmptySeats());
            this.coachesRepository.addCoaches(coaches);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } catch (ParseException ex) {
            Logger.getLogger(CoachesServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public List<Object[]> getCoaches(int start, int end, Date startDate){
        return this.coachesRepository.getCoaches(start, end, startDate);
    }
    
    @Override
    public List<Object[]> getCoachesById(int coachesId){
        return this.coachesRepository.getCoachesById(coachesId);
    }
}
