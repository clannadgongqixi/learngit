package com.jk.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;


@Document(collection = "test")
public class mong  {


    private  Integer mid;
    private  String msex;
    private  String mname;

    @Override
    public String toString() {
        return "mong{" +
                "mid=" + mid +
                ", msex='" + msex + '\'' +
                ", mname='" + mname + '\'' +
                '}';
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public void setMsex(String msex) {
        this.msex = msex;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getMid() {

        return mid;
    }

    public String getMsex() {
        return msex;
    }

    public String getMname() {
        return mname;
    }
}
