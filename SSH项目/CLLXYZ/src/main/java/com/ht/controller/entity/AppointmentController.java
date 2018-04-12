package com.ht.controller.entity;

import com.ht.bean.*;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.AppointmentService;
import com.ht.service.EmployeeService;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/8/28.
 */
public class AppointmentController extends AppController {
    private Appointment appointment;//setter和getter方法

    private List<Appointment> rows; // getter
    private ControllerResult controllerResult; //getter
    private Integer total;      // getter

    private AppointmentService appointmentService; //setter
    private EmployeeService employeeService;
    private String id;       // setter
    private Integer page;   //setter
    private Short status; // setter

    //预约的添加
    public String saveAppointment() {
        try{
            appointment.setApp_arrive_time(Calendar.getInstance().getTime());
            appointment.setApp_status("已预约");
            appointment.setArrive_time(Calendar.getInstance().getTime());
            appointment.setCreated_time(Calendar.getInstance().getTime());
            controllerResult = ControllerResult.getSuccessResult("预约成功！");
            appointmentService.save(appointment);
            return SUCCESS;
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("预约失败！");
            return null;
        }
    }

    //预约的分页
    public String pagerAppointment() {
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Appointment> pager = new Pager<Appointment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager = appointmentService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = appointmentService.count(pager).intValue();
        return SUCCESS;
    }

    //指定经销商的客户预约分页查看
    public String pagerAppointmentAgency(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Appointment> pager = new Pager<Appointment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setParamStr(" where agency_id ='"+id+"'");
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager = appointmentService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = appointmentService.count(pager).intValue();
        return SUCCESS;
    }

    /**
     * 员工查看属于自己的预约;
     * @return
     */
    public String pagerAppointmentEmployee(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Appointment> pager = new Pager<Appointment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager.setParamStr(" where emp_id='"+request.getParameter("emp_id") + "'");
        pager = appointmentService.listPager(pager); // request.getParameter("emp_id")查询出的结果
        rows = pager.getResult();
        total = appointmentService.count(pager).intValue();
        return SUCCESS;
    }

    /**
     * 用户查看属于自己的预约
     * @return
     */
    public String pagerAppointmentUser(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Appointment> pager = new Pager<Appointment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setParamStr(" where user_id ='"+id+"' order by created_time desc");
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager = appointmentService.listPager(pager); // request.getParameter("emp_id")查询出的结果
        rows = pager.getResult();
        total = appointmentService.count(pager).intValue();
        return SUCCESS;
    }

    //购房状态的修改
    public String appStatusAppointment(){
        appointmentService.updateAppStatus(appointment.getId(),appointment);
        return SUCCESS;
    }

    //预约状态的修改
    public String statusAppointment() {
        System.out.println("com/ht/controller/UserController.java:160 status" + status);
        if (status!=null&&id!=null){
            if (status == 1) {
                appointmentService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("激活成功");
            }else if (status ==0){
                appointmentService.updateStatus(id,status);
                controllerResult = ControllerResult.getSuccessResult("冻结成功");
            }else {
                controllerResult = ControllerResult.getSuccessResult("操作失败");
            }
        }
        return SUCCESS;
    }
    //预约的取消
    public String deleteAppointment(){
        appointmentService.remove(appointment);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return SUCCESS;
    }

    /**
     * 预约的修改
     * @return
     */

    public String updateAppointment(){
        if(appointment.getId() != null){
            appointmentService.updateAppointment(appointment.getId(),appointment.getApp_arrive_time(),appointment.getArrive_time());
            controllerResult = ControllerResult.getSuccessResult("修改成功");
        }else {
            controllerResult = ControllerResult.getFailResult("修改失败");
        }
        return SUCCESS;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public List<Appointment> getRows() {
        return rows;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTotal() {
        return total;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setStatus(Short status) {
        this.status = status;
    }
}
