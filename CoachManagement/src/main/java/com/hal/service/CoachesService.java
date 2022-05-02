/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import com.hal.pojo.Coaches;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface CoachesService {
    List<Object[]> getCoaches(String name);
    Coaches getCoachesById(int coachesId);
    boolean deleteCoaches(Coaches coaches);
}
