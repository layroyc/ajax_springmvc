package com.hp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
    @RequestMapping("/wy")
    public String wy(){
        System.out.println("你好啊");
        return "wy";
    }
}
