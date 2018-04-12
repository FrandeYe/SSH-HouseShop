package com.ht.controller;


import com.ht.bean.Employee;
import com.ht.bean.Pie;
import com.ht.bean.Sale;
import com.ht.common.*;
import com.ht.common.highcharts.BasicPillar;
import com.ht.service.EmployeeService;
import com.ht.service.SaleService;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class EmployeeController extends AppController {

    private Employee employee;

    //提供get
    private ControllerResult controllerResult;
    private Integer total;
    private String titleStr;
    private List<Employee> rows;
    private List<NameIdVO> nameIdVOList;
    private List<BasicPillar<Double>> series;

    //提供set
    private EmployeeService employeeService;
    private Pie pie;
    private SaleService saleService;
    private Short status;
    private Integer page;
    private String id;
    private String year;
    private File logo;
    private String logoFileName;


    // 用于上传活动图片的方法
//    public String uploadHeadIcon1() {
//        if (logo != null) {
//            try {
//                FileUtils.copyFile(logo, new File(FileUtil.upload() + File.separator + logoFileName));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        return SUCCESS;
//    }
    public String showAgencyDetailIndex(){
        request.setAttribute("id",id);
        return "showAgencyDetailIndex";
    }
    public String showEmployees(){
        Pager<Employee> employeePager = new Pager<>();
        int pageSize =4;//默认显示4个
        employeePager.setParamStr(" where status = 1 and agency_id ='" + id + "'");
        employeePager.setPage(page);//当前页数
        employeePager.setPageSize(pageSize);
        employeePager = employeeService.listPager(employeePager);
        rows = employeePager.getResult();
        return SUCCESS;
    }
    /**
     * 校验手机号
     */
    public String checkPhone() {
        Employee add_emp = employeeService.findByPhone(employee.getPhone());
        if (add_emp == null) {
            System.out.println("098@098.com");
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
        System.out.println("18870798915");
        controllerResult = ControllerResult.getFailResult("该手机号已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }

    /**
     * 校验邮箱
     *
     * @return
     */
    public String checkEmail() {
        Employee email = employeeService.findByEmail(employee.getEmail());
        if (email == null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
//        employeeService.update(employee);
        controllerResult = ControllerResult.getSuccessResult("该邮箱已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }
    /**
     * 4.手机号和邮箱校验通过，实现增加，修改员工功能
     *
     * @return
     */
    public String add_update() {
        if (session.getAttribute("verifyCode").equals(request.getParameter("verifyCode"))) {
            System.out.println("com/ht/controller/UserController.java:91");
            session.removeAttribute("verifyCode");
            if (checkPhone().equals(SUCCESS) && checkEmail().equals(SUCCESS)) {
                employee.setPwd(EncryptUtil.md5(employee.getPwd()));
                employeeService.save(employee);
                return SUCCESS;
            }
            return "fail";
        } else {
            return "fail";
        }
    }

    /***
     * 添加员工(经销商添加员工时，需判断邮箱和手机是否存在)
     * @return
     */
    public  String saveEmployee() {
        try {
            employee.setHeadicon("/"+FileUtil.PATH+"/"+Constants.DEFAULT_EMP_HEADICON);
            employee.setStatus(Constants.YES_STATUS);
            employee.setPwd(EncryptUtil.md5(employee.getEmail()));
            employee.setCreated_time(Calendar.getInstance().getTime());
            employeeService.save(employee);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }
    /***
     * 修改员工(经销商修改员工时，需判断邮箱和手机是否存在)
     * @return
     */
//    public String updateEmployee() {
//        try{
//            Employee update_emp = employeeService.findByPhone(employee.getPhone());
//            Employee update_emp1 = employeeService.findByEmail(employee.getEmail());
//            if(update_emp != null && update_emp1 != null) {
//                employeeService.update(employee);
//                controllerResult = ControllerResult.getSuccessResult("修改员工成功");
//                controllerResult.setMessageColor("green");
//            }else{
//                controllerResult = ControllerResult.getFailResult("修改员工失败");
//                controllerResult.setMessageColor("red");
//            }
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//        employeeService.update(employee);
//        return SUCCESS;
//    }
    public String updateEmployee() {
        try{
            employeeService.update(employee);
            controllerResult = ControllerResult.getSuccessResult("修改员工成功");
            controllerResult.setMessageColor("green");
        }catch (Exception e) {
//            employeeService.update(employee);
            e.printStackTrace();
            controllerResult.setMessageColor("red");
            controllerResult = ControllerResult.getFailResult("修改员工失败");
        }
        return SUCCESS;
    }
    /***
     * 经销商查看自己的员工（经销商底下的员工）
     *
     * @return
     */
    public String pagerEmployeeAgency() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Employee> pager = new Pager<>();
        pager.setParamStr(" where agency_id='" + id + "' order by created_time desc");
        pager.setPage(page);
        pager.setPageSize(pagerSize);
        pager = employeeService.listPager(pager);
        List<Employee> employees = pager.getResult();
        rows = pager.getResult();
        total = employeeService.count(pager).intValue();
        return SUCCESS;
    }

    /***
     * 查看单个员工详情(修改信息)
     * @return
     */
    public String foundById(){
        employee = employeeService.foundById(id);
        return "showAlterPage";
    }

    /***
     * 更改员工状态（冻结，激活）
     * @return
     */
    public String updateStatus() {
        if(status != null) {
            if (status == 1) {
                employeeService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("员工已可用");
            } else if (status == 0) {
                employeeService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("员工冻结成功");
            } else {
                controllerResult = ControllerResult.getFailResult("操作失败");
            }
        }
        return SUCCESS;
    }

    /**
     * 测试：模拟登陆
     */
    public String loginTest(){
        employee = employeeService.foundById(request.getParameter("id"));
        HttpSession session = request.getSession();
        session.setAttribute("employee",employee);
        return SUCCESS;
    }

    /**
     * 员工修改自己的信息(ye 优化)
     */
    public String updateEmployeeSelf(){
        Employee empInfo = (Employee) session.getAttribute("employee");
        empInfo.setName(employee.getName());
        empInfo.setEmail(employee.getEmail());
        empInfo.setGender(employee.getGender());
        empInfo.setQq(employee.getQq());
        empInfo.setWechat(employee.getWechat());
        empInfo.setExp(employee.getExp());
        empInfo.setDes(employee.getDes());
        empInfo.setIntro(employee.getIntro());
        empInfo.setAddress(employee.getAddress());
        try {
            employeeService.update(empInfo);
            session.setAttribute("employee",empInfo);
            controllerResult = ControllerResult.getSuccessResult("修改成功！");
        }catch (Exception e){
            session.setAttribute("employee",session.getAttribute("employee"));
            controllerResult = ControllerResult.getFailResult("修改失败！");
        }
        return SUCCESS;
    }
    /**
     * 失去焦点，验证邮箱是否存在(ye)
     */
    public String verifyEmail(){

        Employee empEmail = employeeService.findByEmail(employee.getEmail());
        if (!(null==empEmail)){
            controllerResult = ControllerResult.getFailResult("该邮箱已存在！请重输");
        }else{
            controllerResult = ControllerResult.getSuccessResult("邮箱可用");
        }
        return SUCCESS;
    }
    /**
     * 员工修改自己的的登入密码(ye)
     */
    public String updateEmpPwd(){
        String newPwd = request.getParameter("newPwd");
        String conPwd = request.getParameter("conPwd");
        Employee empPwd = (Employee) session.getAttribute("employee");
        if(newPwd.equals(conPwd)){
            Employee emp = employeeService.queryByIdPwd(empPwd.getId(),EncryptUtil.md5(employee.getPwd()));
            if (!(null==emp)){
                employeeService.updateEmpPwd(emp.getId(),EncryptUtil.md5(newPwd));
                session.setAttribute("employee",emp);
                controllerResult = ControllerResult.getSuccessResult("修改成功！");
            }else{
                controllerResult = ControllerResult.getFailResult("原密码错误！");
            }
        }else{
            controllerResult = ControllerResult.getFailResult("两次密码不一致！");
        }
        return SUCCESS;
    }

    /***
     * 经销商修改员工密码（xie）
     * @return
     */
    public String updatePwdAgency() {
        employee.setPwd(EncryptUtil.md5(employee.getPwd()));
        employeeService.updateEmpPwd(employee.getId(), employee.getPwd());
        controllerResult = ControllerResult.getSuccessResult("修改密码成功");
        return SUCCESS;
    }
    /**
     * 失去焦点触发原密码的验证(ye)
     */
    public String checkOldPwd(){
        Employee empPwdValid = (Employee) session.getAttribute("employee") ;
        empPwdValid.setPwd(EncryptUtil.md5(employee.getPwd()));
        Employee emp = employeeService.queryByIdPwd(empPwdValid.getId(),empPwdValid.getPwd());
        if (!(null==emp)){
            session.setAttribute("employee",empPwdValid);
            controllerResult = ControllerResult.getSuccessResult("正确！");
        }else{
            controllerResult = ControllerResult.getSuccessResult("原密码错误！");
        }
        return SUCCESS;
    }

    /**
     * 上传头像
     */
    public String uploadHeadIcon(){
        Employee empIcon = (Employee) session.getAttribute("employee");
        if (logo != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.upload() + File.separator + logoFileName));
                empIcon.setHeadicon("/"+FileUtil.PATH+"/"+logoFileName);
                employeeService.update(empIcon);
                session.setAttribute("employee",empIcon);
                controllerResult = ControllerResult.getSuccessResult("上传成功！");
            } catch (IOException e) {
                controllerResult = ControllerResult.getFailResult("上传失败！");
            }
        }
        return SUCCESS;
    }
    /**
     * 员工的登录
     * @return
     */
    public String EmployeePhoneLogin() {
        String employeePhone = request.getParameter("phone");
        String employeePwd = request.getParameter("pwd");
        Employee employeeLogin = employeeService.loginPhone(employeePhone, EncryptUtil.md5(employeePwd));
        if (employeeLogin == null) {
            controllerResult = ControllerResult.getFailResult("用户被冻结或账号密码错误！");
            controllerResult.setMessageColor("red");
            return "fail";
        } else {
            session.setAttribute("employee", employeeLogin);
            controllerResult = ControllerResult.getSuccessResult("登录成功！");
            return SUCCESS;
        }
    }

    public String EmployeeEmailLogin() {
        String employeeEmail = request.getParameter("employee.email");
        String employeePwd = request.getParameter("employee.pwd");
        Employee employeeLogin = employeeService.loginPhone(employeeEmail, EncryptUtil.md5(employeePwd));
        if (employeeLogin == null) {
            controllerResult = ControllerResult.getFailResult("用户被冻结或账号密码错误！");
            controllerResult.setMessageColor("red");
            return "fail";
        } else {
            session.setAttribute("employee", employeeLogin);
            controllerResult = ControllerResult.getSuccessResult("登录成功！");
            return "login";
        }
    }
    /**
     * 安全退出功能
     * @return
     */
    public String quit(){
        Employee quitEmployee = (Employee) session.getAttribute("employee");
        session.invalidate();
        controllerResult = ControllerResult.getSuccessResult("尊敬的用户，您成功安全退出！");
        return SUCCESS;
    }

    /**
     * 查询经销商底下的员工
     * @return
     */

    public String pagerEmployeeAgencyVO() {
        nameIdVOList = new ArrayList<>();
        Pager<Employee> pager = new Pager<>();
        pager.setParamStr(" where agency.id='" + id + "'" + " and status=1");
        pager.setPageSize(employeeService.count(pager).intValue());
        pager = employeeService.listPager(pager);
        for (Employee employee : pager.getResult()) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(employee.getId());
            nameIdVO.setName(employee.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    /**
     * 员工每月销售金额统计
     * @return
     */
    public String employeeSaleHouse(){
        String yearStr = year;
        titleStr = "员工"+yearStr+"年销售金额统计";
        series = new ArrayList<>();
        Pager<Employee> pager = new Pager<>();
        pager.setParamStr(" where buildings_id='" + id + "' and status=1");
        pager.setPageSize(employeeService.count(pager).intValue());
        pager = employeeService.listPager(pager);//获取楼盘下的员工
        for(Employee employee: pager.getResult()){
            BasicPillar<Double> basicPillar = new BasicPillar<>();
            basicPillar.setName(employee.getName());//组装name
            List<Double> doubles = new ArrayList<>();//用于存储 每月的销售额，
            for (int i = 0; i < 12; i++) {
                int month = i + 1;
                String beginMonth = yearStr+"-"+ month +"-1";
                String endMonth = yearStr+"-"+ month +"-31";
                Double moneyByMonth = saleService.calculateMoneyByMonth(beginMonth,endMonth,employee.getId());
                doubles.add(moneyByMonth);
            }
            basicPillar.setData(doubles);//组装销售总金额
            series.add(basicPillar);
        }
        return SUCCESS;
    }

    /**
     * 查询楼盘中的最佳销售额的员工
     * @return
     */

    public String excellentEmployee(){
        String yearStr = year;
        series = new ArrayList<>();
        Pager<Employee> pager = new Pager<>();
        pager.setParamStr(" where buildings_id='" + id + "' and status=1");
        pager.setPageSize(employeeService.count(pager).intValue());
        pager = employeeService.listPager(pager);//获取楼盘下的员工
        for(int i=0 ,size=pager.getResult().size();i<size;i++){
            BasicPillar<Double> basicPillar = new BasicPillar<>();
            basicPillar.setName(employee.getName());

            if(i==1){
                pie.setSliced(true);
                pie.setSelected(true);
            }
        }
        return SUCCESS;
    }

    public String showEmployeeLogin(){
        return "showEmployeeLogin";
    }

    public String showEmployeeIndex(){
        return "showEmployeeIndex";
    }
    /**
     * setter,getter
     * @return
     */
    public Employee getEmployee() {
        return employee;
    }

    public String getTitle() {
        return titleStr;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setPie(Pie pie) {
        this.pie = pie;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public void setLogo(File logo) {
        this.logo = logo;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Employee> getRows() {
        return rows;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }

    public List<BasicPillar<Double>> getSeries() {
        return series;
    }
}
