/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.service.impl;

import java.io.IOException;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hal.pojo.User;
import com.hal.repository.UserRepository;
import com.hal.service.UserService;
import java.util.Date;
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
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public boolean addUser(User user) {
        user.setJoinDate(new Date());
        if (user.getFile() != null) {
            try {
                Map res = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.userRepository.addUser(user);
    }

    @Override
    public User getUserById(int i) {
        return this.userRepository.getUserById(i);
    }

    @Override
    public boolean deleteUser(User user) {
        return this.userRepository.deleteUser(user);
    }

    @Override
    public List<User> getUserByRole(String role) {
        return this.userRepository.getUserByRole(role);
    }

}
