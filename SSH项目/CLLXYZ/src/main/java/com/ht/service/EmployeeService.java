package com.ht.service;

import com.ht.bean.Employee;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface EmployeeService extends BaseService<String,Employee> {
    /**
     * 员工修改自己的部分信息
     */
    void updateEmployeeSelf(String id,Employee employee);

    Employee findByPhone(String phone);

    Employee findByEmail(String Email);

    Employee queryByIdPwd(String id,String pwd);

    void updateEmpPwd(String id,String pwd);

    Employee loginPhone(String phone,String pwd);

    Employee loginEmail(String email,String pwd);

    List<Employee> foundEmpsByAgencyId(String id);
}
