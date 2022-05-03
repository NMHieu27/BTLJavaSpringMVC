/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.repository;

import com.hal.pojo.Station;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface StationRepository {
    List<Station> getStation(String kw);
}
