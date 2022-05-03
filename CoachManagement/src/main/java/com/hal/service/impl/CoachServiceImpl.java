/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hal.pojo.Coach;
import com.hal.repository.CoachRepository;
import com.hal.service.CoachService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Asus
 */
@Service
public class CoachServiceImpl implements CoachService{

    @Autowired
    private Cloudinary cloudinary;
    
    @Autowired
    private CoachRepository coachRepository;
    
    @Override
    public List<Coach> getCoach(String name) {
        return this.coachRepository.getCoach(name);
    }

    @Override
    public boolean addCoach(Coach coach) {
        System.out.println("Mô tả:" + coach.getDescribe());
        System.out.println(coach.getActive());
        System.out.println(coach.getName());
        System.out.println(coach.getPrice());
        System.out.println(coach.getCategoryId());
        
        System.out.println(coach.getLicenseplates());
        if(coach.getFile() != null){
            try {
                Map res = this.cloudinary.uploader().upload(coach.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                coach.setImage(res.get("secure_url").toString());
                System.out.println(coach.getImage());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.coachRepository.addCoach(coach);
    }

    @Override
    public Coach getCoachById(int i) {
        return this.coachRepository.getCoachById(i);
    }

    @Override
    public boolean deleteCoach(Coach coach) {
        return this.coachRepository.deleteCoach(coach);
    }

    @Override
    public boolean updateCoachByAdmin(Coach coach, int i) {
        return this.coachRepository.updateCoachByAdmin(coach, i);
    }
    
}
