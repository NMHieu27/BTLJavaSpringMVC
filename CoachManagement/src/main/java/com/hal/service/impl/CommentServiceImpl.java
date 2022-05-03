/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service.impl;

import com.hal.repository.CommentRepository;
import com.hal.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    
    @Override
    public List<Object[]> getComments(int coachId, int routeId){
        return this.commentRepository.getComments(coachId, routeId);
    }
}
