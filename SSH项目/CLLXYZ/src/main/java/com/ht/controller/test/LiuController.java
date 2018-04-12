package com.ht.controller.test;

import com.ht.bean.*;
import com.ht.controller.AppController;
import com.ht.service.*;

import java.util.Calendar;

public class LiuController extends AppController {
    private AgencyService agencyService;
    private CustomerService customerService;
    private EmployeeService employeeService;
    private SaleService saleService;
    private MissionService missionService;

    public void setAgencyService(AgencyService agencyService) {
        this.agencyService = agencyService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setMissionService(MissionService missionService) {
        this.missionService = missionService;
    }

    public String agencyAdd() {
        Agency agency = new Agency();
        agency.setEmail("1002@qq.com");
        agency.setPhone("1880820815");
        agency.setAddress("load");
        agency.setIntro("intro");
        agency.setLeader("leader");
        agency.setPwd("password");
        agency.setStatus((short) 1);
        agency.setTel("0797");
        agency.setCreated_time(Calendar.getInstance().getTime());
        agencyService.save(agency);
        return SUCCESS;
    }

    public String customerAdd() {
        Customer customer = new Customer();
        customer.setName("name");
        customer.setEmail("1003@qq.com");
        customer.setAddress("address");
        customer.setArchives("archives");
        customer.setContract("Internet");
        customer.setBirthday(Calendar.getInstance().getTime());
        customer.setGender("m");
        customer.setIdentity_id("440723199608120015");
        customer.setPhone("1234567890a");
        customerService.save(customer);
        return "customerAdd";
    }

    public String empAdd(){
        Employee employee = new Employee();
        employee.setAddress("赣州");
        employee.setBasic_salary(10);
        employee.setCreated_time(Calendar.getInstance().getTime());
        employee.setDes("赣州最大的楼盘");
        employee.setEmail("1004@qq.com");
        employee.setExp("four years");
        employee.setIntro("intro");
        employee.setHeadicon("headicon");
        employee.setWechat("weChat");
        employee.setGender("f");
        employee.setPwd("qwer");
        employee.setPhone("1234567890b");
        employeeService.save(employee);
        return "empAdd";
    }

    public String saleAdd(){
        Sale sale = new Sale();
        sale.setCreated_time(Calendar.getInstance().getTime());
        sale.setDiscount(8);
        sale.setSale_time(Calendar.getInstance().getTime());
        sale.setTotal_cost(9888);
        sale.setUnit_price(9999);
        saleService.save(sale);
        return "saleAdd";
    }

    public String missionAdd(){
        Mission mission = new Mission();
        mission.setBonus_percent(20);
//        mission.setMonthes(12);
        mission.setQuantity(9);
        missionService.save(mission);
        return "missionAdd";
    }
}
