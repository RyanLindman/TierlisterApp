package com.jensen.springexam1;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;


@Controller

public class HomePageController {
    @Autowired
    private MovieRepository movieRepository;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model homePage) {
        homePage.addAttribute("movies", movieRepository.findAll());
        return "index";
    }
;
}

