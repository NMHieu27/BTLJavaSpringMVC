/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.validator;

import com.hal.service.UserService;
import javax.persistence.NoResultException;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Asus
 */
public class UserPhoneValidator implements ConstraintValidator<UserPhone, String> {

    @Autowired
    private UserService userDetailsService;

    @Override
    public void initialize(UserPhone constraintAnnotation) {
        
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        try {
            return this.userDetailsService.checkPhone(value);
        } catch (NoResultException e) {
            return false;
        }
    }

}
