package com.jk.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.lang.annotation.Documented;
import java.util.Date;

@Entity

public class Student implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private  Integer id;
    private  String sex;
    private  String name;

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", sex='" + sex + '\'' +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {

        return id;
    }

    public String getSex() {
        return sex;
    }

    public String getName() {
        return name;
    }

    public Date getCreateTime() {
        return createTime;
    }

    @JSONField(format = "yyyy-MM-dd HH:mm")
    private Date createTime;


}
