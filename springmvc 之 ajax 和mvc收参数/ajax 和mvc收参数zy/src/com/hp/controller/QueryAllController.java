package com.hp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/farm")
public class QueryAllController {
    @RequestMapping("/buy01")
    @ResponseBody
    public Map buy01(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("msg","请求访问成功");
        codeMap.put("data1",map);
        return codeMap;
    }

    @RequestMapping("/buy02")
    @ResponseBody
    public Map buy02(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("msg","请求访问成功");
        codeMap.put("data",map);
        return codeMap;
    }

    @RequestMapping("/buy03")
    @ResponseBody
    public Map buy03(@RequestBody Map map){
        System.out.println("map = " + map);
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("msg","请求访问成功");
        codeMap.put("data",map);
        return codeMap;
    }
}
