/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import com.hal.pojo.Coaches;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Asus
 * @author Linh
 */
 */
public interface CoachesService {
    List<Object[]> getCoaches(String name);
    boolean addCoaches(Coaches coaches);
    Coaches getCoachesById(int coachesId);
    boolean deleteCoaches(Coaches coaches);

    List<Object[]> getCoachesForBooking(int start, int end, Date startDate);
    List<Object[]> getCoachesDetailById(int coachesId);
}
