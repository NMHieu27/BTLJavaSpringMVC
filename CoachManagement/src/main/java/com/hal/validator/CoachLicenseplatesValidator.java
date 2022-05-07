/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.validator;

import com.hal.service.CoachService;
import javax.persistence.NoResultException;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Asus
 */
public class CoachLicenseplatesValidator implements ConstraintValidator<CoachLicenseplates, String>{

    @Autowired
    private CoachService coachService;
    
    @Override
    public void initialize(CoachLicenseplates constraintAnnotation) {
        
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        try {
            return this.coachService.checkCoachLicenseplates(value);
        } catch (NoResultException ex) {
            return false;
        }
    }
    
}
