package com.hp.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Record {
    private String zzName;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    @Override
    public String toString() {
        return "Record{" +
                "zzName='" + zzName + '\'' +
                ", count=" + count +
                ", time=" + time +
                '}';
    }

    public String getZzName() {
        return zzName;
    }

    public void setZzName(String zzName) {
        this.zzName = zzName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
