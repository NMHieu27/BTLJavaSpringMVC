/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.service.impl;

import com.hal.pojo.Coaches;
import com.hal.pojo.Comment;
import com.hal.pojo.User;
import com.hal.repository.CoachesRepository;
import com.hal.repository.CommentRepository;
import com.hal.repository.UserRepository;
import com.hal.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Linh
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;
    
    @Autowired
    private CoachesRepository coachesRepository;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Object[]> getComments(int coachId, int routeId) {
        return this.commentRepository.getComments(coachId, routeId);
    }

    @Override
    public Comment addComment(String content, int coachesId, User user){
        Coaches coaches = this.coachesRepository.getCoachesById(coachesId);
        
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setCoachesId(coaches);
        comment.setUser(user);
        comment.setCreatedDate(new Date());
        
        return this.commentRepository.addComment(comment);
    }

}
