/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Linh
 */
public interface CoachesService {
    List<Object[]> getCoaches(int start, int end, Date startDate);
    List<Object[]> getCoachesById(int coachesId);
}
