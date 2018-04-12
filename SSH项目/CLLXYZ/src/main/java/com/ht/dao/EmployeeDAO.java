package com.ht.dao;

import com.ht.bean.Employee;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface EmployeeDAO extends BaseDAO<String,Employee> {
    /**
     * 1.员工修改自己的部分信息
     * 2.修改登录密码,先查询原密码，验证，再修改
     */
    void updateEmployeeSelf(String id,Employee employee);

    Employee queryByIdPwd(String id,String pwd);

    void updateEmpPwd(String id,String pwd);

    Employee findByPhone(String phone); //验证手机号是否存在

    Employee findByEmail(String email);//验证账号是否存在

    Employee loginPhone(String phone,String pwd);

    Employee loginEmail(String email,String pwd);

    void queryEmployeeSalesRecord(String id);//查看员工销售房子记录

    List<Employee> foundEmpsByAgencyId(String id);
}
