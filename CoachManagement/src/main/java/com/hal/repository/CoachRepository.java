/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.repository;

import com.hal.pojo.Coach;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface CoachRepository {
    List<Coach> getCoach(String name);
    boolean addCoach(Coach coach);
    Coach getCoachById(int coachId);
    boolean deleteCoach(Coach coach);
}
