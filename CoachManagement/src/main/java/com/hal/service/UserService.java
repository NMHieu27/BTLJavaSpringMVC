/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.service;

import com.hal.pojo.User;
import java.util.List;

/**
 *
 * @author Asus
 */
public interface UserService {
    List<User> getUsers(String username);
    boolean addUser(User user);
    User getUserById(int userId);
    boolean deleteUser(User user);
    List<User> getUserByRole(String role);
    boolean updateUserByAdmin(User user, int userId);
}
