package com.htl.test;

import com.htl.dao.DepartmentMapper;
import com.htl.dao.EmployeeMapper;
import com.htl.domain.Department;
import com.htl.domain.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){
//        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper bean = app.getBean(DepartmentMapper.class);
//        System.out.println(departmentMapper);

        //1、插入几个部门
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));
//        departmentMapper.insertSelective(new Department(null,"宣传部"));

        //2、生成员工数据，测试员工插入
//        employeeMapper.insertSelective(new Employee(null,"韩天乐","男","1056077429@qq.com",1));
//        employeeMapper.insertSelective(new Employee(null,"韩天喜","男","1056077429@qq.com",3));
//        employeeMapper.insertSelective(new Employee(null,"韩天琪","男","1056077429@qq.com",2));

        //3、批量插入多个员工；批量；使用可以执行批量操作的sqlSession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0;i<50;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@CCTV.com",1));
        }
        System.out.println("批量完成");
    }
}





