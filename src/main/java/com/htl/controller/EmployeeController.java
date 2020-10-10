package com.htl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.htl.domain.Employee;
import com.htl.domain.Msg;
import com.htl.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工的 CRUD
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;


    /**
     *  Model方式获取员工数据
     */
//    @RequestMapping("/emp_s")
//    public String getEmp_s(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        //这不是一个分页查询
//        //引入PageHelper分页插件
//        //在查询之前只需要调用，传入页码，以及每页的大小。  （ pn 表示第几页 ，pageSize表示每页几条数据）
//        PageHelper.startPage(pn,5);
//        //startPage后面紧跟的这个查询就是一个分页查询
//        List<Employee> emps = employeeService.getAll();
//        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
//        //封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数。
//        // navigatePages = 5 表示连续显示5个页码。
//        PageInfo page = new PageInfo(emps,5);
//        model.addAttribute("pageInfo",page);
//        return "list";
//    }

    /**
     *  Json格式的获取员工数据（需导入Json数据解析包）
     */
    @RequestMapping("/emp_s")
    @ResponseBody
    public Msg getEmp_sWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小。  （ pn 表示第几页 ，pageSize表示每页几条数据）
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        //封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数。
        // navigatePages = 5 表示连续显示5个页码。
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);
    }


    /**
     *  员工保存
     *
     *  1、支持JSR303校验
     * 	2、导入Hibernate-Validator
     *
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }


    /**
     *  检查用户名是否可用
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法的表达式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }

        //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }


    /**
     * 根据id查询员工
     */
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }


    /**
     *  员工更新
     */
    @ResponseBody
    @RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
    public Msg saveEmp(Employee employee, HttpServletRequest request){
        System.out.println("请求体中的值："+request.getParameter("gender"));
        System.out.println("将要更新的员工数据："+employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }


    /**
     * 单个批量二合一
     * 批量删除：1-2-3
     * 单个删除：1
     *
     */
    @ResponseBody
    @RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids")String ids){
        //批量删除
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                del_ids.add(Integer.parseInt(string));
            }
            employeeService.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }

}
