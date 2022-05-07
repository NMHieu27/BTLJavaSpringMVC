/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hal.validator;

import java.lang.annotation.Documented;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

/**
 *
 * @author Asus
 */
@Target({METHOD, FIELD})
@Retention(RUNTIME)
@Constraint(validatedBy = CoachLicenseplatesValidator.class)
@Documented
public @interface CoachLicenseplates {
    String message() default "";

    Class<?>[] groups() default {};

    public abstract Class<? extends Payload>[] payload() default {};
}
