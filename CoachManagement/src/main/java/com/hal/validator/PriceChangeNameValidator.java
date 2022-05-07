/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hal.validator;

import com.hal.service.PriceChangeService;
import javax.persistence.NoResultException;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Asus
 */

public class PriceChangeNameValidator implements ConstraintValidator<PriceChangeName, String>{

    @Autowired
    private PriceChangeService PriceChangeService;
    
    @Override
    public void initialize(PriceChangeName constraintAnnotation) {
        
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        try{
            return this.PriceChangeService.checkPriceChangeName(value);
        }catch(NoResultException ex){
            return false;
        }
    }
    
}
