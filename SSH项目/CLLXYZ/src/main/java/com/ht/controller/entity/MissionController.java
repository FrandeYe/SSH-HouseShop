package com.ht.controller.entity;

import com.ht.bean.Agency;
import com.ht.bean.Employee;
import com.ht.bean.Mission;
import com.ht.bean.Sale;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.DateUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.EmployeeService;
import com.ht.service.MissionService;
import com.ht.service.SaleService;

import java.util.ArrayList;
import java.util.List;

public class MissionController extends AppController {

    private Mission mission;

    private MissionService missionService;
    private EmployeeService employeeService;
    private SaleService saleService;
    private Integer page;
    private String id;

    private ControllerResult controllerResult;
    private List<Mission> rows;
    private Integer total;

    public String pagerMissionAgencyByTime() {
        Pager<Mission> pager = new Pager<Mission>();
        int pageSize =Integer.valueOf(request.getParameter("rows"));
        pager.setPageSize(pageSize);
        pager.setPage(page);
        String time = request.getParameter("time");
        pager.setParamStr(" where agency_id='" + id + "' and monthes='" + time + "'");
        pager = missionService.listPager(pager);
        int length = pager.getResult().size();
        total = missionService.count(pager).intValue();
        rows = pager.getResult();
        for (Mission m : rows) {
            String empId = m.getEmployee().getId();
            Pager<Sale> salePager = new Pager<>();
            salePager.setParamStr(" where emp_id='" + empId + "' and sale_time>='" + DateUtil.getBeginDate(time)
                    + "' and sale_time<'" + DateUtil.getEndDate(time) + "'");
            m.setSaleCount(saleService.count(salePager).intValue());
            m.setBasicSalary(m.getEmployee().getBasic_salary());
            m.setRealSalary(m.getBasicSalary() + m.getSaleCount() * m.getBonus_percent());
        }
        return SUCCESS;
    }

    /**
     * 绩效管理
     * 对员工进行任务分配，设置销售提成,若无当前月份的绩效数据，则自动生成。
     */
    public String pagerMissionAgencyNoTime() {
        Pager<Mission> pager = new Pager<Mission>();
        int pageSize =Integer.valueOf(request.getParameter("rows"));
        pager.setPageSize(pageSize);
        pager.setPage(page);
        String currentMonth = DateUtil.getCurrentMonth();
        pager.setParamStr(" where agency_id='" + id + "' and monthes='" + currentMonth + "'");
        pager = missionService.listPager(pager);
        int length = pager.getResult().size();
        if (length > 0) { //查询到有当月的绩效数据
            total = missionService.count(pager).intValue();
            rows = pager.getResult();
        } else { //未查询到当月的绩效数据，立即生成。
            Agency agency = new Agency();
            agency.setId(id);
            Pager<Employee> employeePager = new Pager<>();
            employeePager.setParamStr(" where agency_id='" + id + "'");
            employeePager.setPageSize(employeeService.count(employeePager).intValue());
            Pager<Employee> listPager = employeeService.listPager(employeePager);
            rows = new ArrayList<>();
            for (Employee e : listPager.getResult()) {
                Mission mission = new Mission();
                mission.setAgency(agency);
                mission.setEmployee(e);
                mission.setBonus_percent(Constants.DEFAULT_BONUS_PERCENT);
                mission.setQuantity(Constants.DEFAULT_MISSION_QUANTITY);
                mission.setMonthes(currentMonth);
                rows.add(mission);
            }
            missionService.save(rows);
        }
        for (Mission m : rows) {
            String empId = m.getEmployee().getId();
            Pager<Sale> salePager = new Pager<>();
            salePager.setParamStr(" where emp_id='" + empId + "' and sale_time>='" + DateUtil.getBeginDate()
                    + "' and sale_time<'" + DateUtil.getEndDate() + "'");
            m.setSaleCount(saleService.count(salePager).intValue());
            m.setBasicSalary(m.getEmployee().getBasic_salary());
            m.setRealSalary(m.getBasicSalary() + m.getSaleCount() * m.getBonus_percent());
        }
        return SUCCESS;
    }

    /**
     * 给所有员工设置提成百分比
     */
    public String updateMissionPercent(){
        Mission mission = new Mission();
        mission.setBonus_percent(Double.valueOf(request.getParameter("bonus_percent")));
        missionService.updatePercent(mission);
        return SUCCESS;
    }


    /**
     *修改绩效
     * 给员工设置任务量，可指定某个月
     */
    public String updateMission(){
//        Mission mission = new Mission();
//        mission.setId(request.getParameter("mission_id"));
//        mission.setMonthes(1);
//        mission.setQuantity(10);
//        mission.setBonus_percent(0.23);
//        Employee employee = new Employee();
//        employee.setId(request.getParameter("emp_id"));
//        Set<Mission> missions = new HashSet<Mission>();
//        mission.setEmployee(employee);
//        missions.add(mission);
//        employee.setMissions(missions);
//        missionService.update(mission);
        return SUCCESS;
    }


    /**
     * 绩效的分页
     * 员工可以单独查看自己的绩效
     */
    public String pagerMission(){
        Pager<Mission> pager = new Pager<Mission>();
        int pageSize =Integer.valueOf(request.getParameter("rows"));
        pager.setPageSize(pageSize);
        pager.setPage(page);
        pager = missionService.listPager(pager);
        total = missionService.count(pager).intValue();
        rows = pager.getResult();

        return SUCCESS;
    }

    /**
     *员工单独查看属于自己的绩效
     */
    public String  pagerMissionEmployee(){
        Pager<Mission> pager = new Pager<Mission>();
        int pageSize =Integer.valueOf(request.getParameter("rows"));
        pager.setPageSize(pageSize);
        pager.setPage(page);
        pager.setParamStr(" where emp_id='" + id + "' order by monthes desc");
        pager = missionService.listPager(pager);
        total = missionService.count(pager).intValue();
        rows = pager.getResult();
        for (Mission m : rows) {
            String empId = m.getEmployee().getId();
            Pager<Sale> salePager = new Pager<>();
            salePager.setParamStr(" where emp_id='" + empId + "' and sale_time>='" + DateUtil.getBeginDate()
                    + "' and sale_time<'" + DateUtil.getEndDate() + "'");
            m.setSaleCount(saleService.count(salePager).intValue());
        }
        return SUCCESS;
    }

    /**
     * 修改任务量与提成
     * @param missionService
     */
    public String updateQuantityPercent(){
        String id = mission.getId();
        int quantity = mission.getQuantity();
        double bonusPercent = mission.getBonus_percent();
        if(mission != null){
            missionService.updateQuantityPercent(id,quantity,bonusPercent);
            controllerResult = ControllerResult.getSuccessResult("修改任务量与成功");
        }
        return SUCCESS;
    }

    /**
     * 修改提成
     * @return
     */
    public String updateBonusPercent(){
        Agency agency = (Agency) session.getAttribute("agency");
        int quantity = mission.getQuantity();
        double bonusPercent = mission.getBonus_percent();
        String monthes = DateUtil.getCurrentMonth();
        String agencyId = agency.getId();
        if(mission != null){
            missionService.updateBonusPercent(quantity,bonusPercent,monthes,agencyId);
            controllerResult = ControllerResult.getSuccessResult("修改提成成功");
        }
        return SUCCESS;
    }

    public Mission getMission() {
        return mission;
    }

    public void setMission(Mission mission) {
        this.mission = mission;
    }

    public void setMissionService(MissionService missionService) {
        this.missionService = missionService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<Mission> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setId(String id) {
        this.id = id;
    }
}
