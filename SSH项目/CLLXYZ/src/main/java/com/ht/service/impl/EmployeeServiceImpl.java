package com.ht.service.impl;

import com.ht.bean.Employee;
import com.ht.common.Pager;
import com.ht.dao.EmployeeDAO;
import com.ht.service.EmployeeService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeDAO employeeDAO;
    @Override
    public void save(Employee employee) {
        employeeDAO.save(employee);
    }

    @Override
    public void remove(Employee employee) {
        employeeDAO.remove(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeDAO.update(employee);
    }

    @Override
    public void updateStatus(String id, short status) {
        employeeDAO.updateStatus(id, status);
    }

    @Override
    public Employee foundById(String id) {
        return employeeDAO.foundById(id);
    }

    @Override
    public Pager<Employee> listPager(Pager<Employee> pager) {
        return employeeDAO.listPager(pager);
    }

    @Override
    public List<Employee> listAll() {
        return employeeDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return employeeDAO.count(pager);
    }

    public EmployeeDAO getEmployeeDAO() {
        return employeeDAO;
    }

    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    @Override
    public void updateEmployeeSelf(String id, Employee employee) {
        employeeDAO.updateEmployeeSelf(id,employee);
    }

    @Override
    public Employee findByPhone(String phone) {
        return employeeDAO.findByPhone(phone);
    }

    @Override
    public Employee findByEmail(String Email) {
        return employeeDAO.findByEmail(Email);
    }

    @Override
    public Employee queryByIdPwd(String id, String pwd) {
        return employeeDAO.queryByIdPwd(id,pwd);
    }

    @Override
    public void updateEmpPwd(String id, String pwd) {
        employeeDAO.updateEmpPwd(id,pwd);
    }

    @Override
    public Employee loginPhone(String phone, String pwd) {
        return employeeDAO.loginPhone(phone,pwd);
    }

    @Override
    public Employee loginEmail(String email, String pwd) {
        return employeeDAO.loginEmail(email,pwd);
    }

    @Override
    public List<Employee> foundEmpsByAgencyId(String id) {
        return employeeDAO.foundEmpsByAgencyId(id);
    }
}
