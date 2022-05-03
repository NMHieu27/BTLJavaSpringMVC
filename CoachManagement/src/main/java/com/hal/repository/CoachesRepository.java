/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.repository;

import com.hal.pojo.Coaches;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface CoachesRepository {
    List<Object[]> getCoaches(String name);
    boolean addCoaches(Coaches coaches);
    Coaches getCoachesById(int coachesId);
    boolean deleteCoaches(Coaches coaches);
    
}
