package com.jk.controller;

import com.jk.entity.Student;
import com.jk.entity.mong;
import com.jk.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("test")
public class TestController {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private TestService testService;
    @Resource
    private RedisTemplate<String,Object> redisTemplate;
    @Resource
    private MongoTemplate mongoTemplate;

    @RequestMapping("queryTest")
     @ResponseBody
    private Student querytest(){

        Student student =new Student();
        redisTemplate.opsForValue().set("111","222222");

       redisTemplate.opsForValue().get("1111");
       System.out.println("112111121");
        redisTemplate.delete("11");

        student.setId(2);
        student.setName("gg");
        student.setSex("女");
        student.setCreateTime(new Date());

        return student;

    }


    @RequestMapping("/save")
    @ResponseBody
    public void saveStudent() {
        Student stu = new Student();
        stu.setName("老王");
        stu.setSex("女");
        stu.setCreateTime(new Date());
        testService.saveStudent(stu);
    }


    @RequestMapping("/mong")
    @ResponseBody
    public String mong(mong mong) {
        mong.setMname("老王");
        mong.setMsex("女");
        mongoTemplate.save(mong);
        System.out.println("gg");

        return "1";
    }

    @RequestMapping("jdbclist")
    @ResponseBody
    public List<Map<String, Object>> itemsList(){
        String sql = "select * from student ";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);

        return list;
    }


    @RequestMapping("updatestu")
    public void updatestu(Student student){
        testService.updatestu(student);

    }



@RequestMapping("delestu")
    @ResponseBody
    public  void delestu( ){
      Integer id=1;
    testService.delestu(id);

}

@RequestMapping("querystu")
    @ResponseBody
    public List<Student> querystu(){

        List<Student> list =testService.querystu();


       return list;
}

  @RequestMapping("querystubyid")
  @ResponseBody
  public  Student querystubyid(Integer id) {

  Student student=testService.querystubyid(id);


     return student;
  }




}
