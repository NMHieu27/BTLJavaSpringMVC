/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hal.controllers;

import com.hal.pojo.Comment;
import com.hal.pojo.User;
import com.hal.service.CommentService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Linh
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session){
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
    }
    
    @PostMapping(path = "api/add-comment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Object>> addComment(@RequestBody Map<String, String> params, HttpSession session) {
        try {
            String content = params.get("content");
            int coachesId = Integer.parseInt(params.get("coachesId"));
            User user = (User) session.getAttribute("currentUser");
            Comment c = this.commentService.addComment(content, coachesId, user);
            User u = c.getUser();
            List<Object> res = new ArrayList<>();
            res.add(c.getContent());
            res.add(c.getCreatedDate());
            res.add(u.getFullname());
            res.add(u.getAvatar());
            return new ResponseEntity<>(res, HttpStatus.CREATED);
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
