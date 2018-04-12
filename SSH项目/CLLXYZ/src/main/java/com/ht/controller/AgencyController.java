package com.ht.controller;

import com.ht.bean.*;
import com.ht.common.*;
import com.ht.common.msg.IndustrySMS;
import com.ht.common.msg.VerifyCodeUtil;
import com.ht.service.ActivityService;
import com.ht.service.AgencyService;
import com.ht.service.BuildingService;
import com.ht.service.EmployeeService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.json.annotations.JSON;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class AgencyController extends AppController {

    //get,set
    private Agency agency;

    //get
    private ControllerResult controllerResult;
    private Integer total;
    private List<Agency> rows;
    //set
    private AgencyService agencyService;
    private EmployeeService employeeService;
    private BuildingService buildingService;
    private Integer page;
    private String id;//得到页面选择的id
    private Short status;//得到页面的状态
    private File logo;
    private String logoFileName;

    //index 的页面详情
    public String showAgencyDetail(){
        agency = agencyService.foundById(id);
        return SUCCESS;
    }
    /**
     * jsp页面显示所有经销商,分页。（叶
     */
    public String pagerAgencyIndex(){
        Pager<Agency> agencyPager = new Pager<>();
        int pageSize =6;//默认显示6个
        agencyPager.setParamStr(" where status = 1");
        int idCount = agencyService.count(agencyPager).intValue();
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        agencyPager.setPage(page);//当前页数
        agencyPager.setPageSize(pageSize);
        agencyPager = agencyService.listPager(agencyPager);
        rows = agencyPager.getResult();
        return SUCCESS;
    }
    public String showPagerAgencyIndex(){
        return "showAgencyAll";
    }
    /***
     * 经销商修改自己的密码
     * @return
     */
    public String updateAgencyPwd(){
        String newPwd = request.getParameter("newPwd");
        String conPwd = request.getParameter("conPwd");
        Agency agencyPwd = (Agency) session.getAttribute("agency");
        if(newPwd.equals(conPwd)){
            Agency agency1 = agencyService.queryByIdPwd(agencyPwd.getId(),EncryptUtil.md5(agency.getPwd()));
            if (!(null==agency1)){
                agencyService.updateAgencyPwd(agency1.getId(),EncryptUtil.md5(newPwd));
                session.setAttribute("agency",agency1);
                controllerResult = ControllerResult.getSuccessResult("修改成功！");
            }else{
                controllerResult = ControllerResult.getFailResult("原密码错误！");
            }
        }else{
            controllerResult = ControllerResult.getFailResult("两次密码不一致！");
        }
        return SUCCESS;
    }
    /**
     * 失去焦点触发原密码的验证
     */
    public String checkPassword(){
        Agency checkAgency = (Agency) session.getAttribute("agency");
        String password = request.getParameter("agency.pwd");
        if(EncryptUtil.md5(password).equals(checkAgency.getPwd())) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }else {
            controllerResult = ControllerResult.getFailResult("密码错误，请重新输入");
            controllerResult.setMessageColor("red");
            return "fail";
        }
    }
    /**
     * 修改商标
     */
    public String uploadHeadIcon(){
        Agency loginAgency = (Agency) session.getAttribute("agency");
        if (logo != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.upload() + File.separator + logoFileName));
                loginAgency.setLogo("/"+FileUtil.PATH+"/"+logoFileName);
                agencyService.update(loginAgency);
                session.setAttribute("agency", loginAgency);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }
    /**
     * 经销商修改自己的信息
     */
    public String update() {
        try {
            Agency sessionAgency = (Agency) session.getAttribute("agency");
            sessionAgency.setName(agency.getName());
            sessionAgency.setEmail(agency.getEmail());
            sessionAgency.setLeader(agency.getLeader());
            sessionAgency.setPhone(agency.getPhone());
            sessionAgency.setTel(agency.getTel());
            sessionAgency.setAddress(agency.getAddress());
            sessionAgency.setIntro(agency.getIntro());
            session.setAttribute("agency", sessionAgency);
            agencyService.update(sessionAgency);
            controllerResult = ControllerResult.getSuccessResult("修改信息成功！");
        } catch (Exception e) {
//        agencyService.updateInfo(agency);//此方法需删除
            e.printStackTrace();
            controllerResult = ControllerResult.getFailResult("修改信息失败！");
        }
        return SUCCESS;
    }

    public String register() {
        String verifyCode = (String) session.getAttribute("verifyCode");
        String verifyCodeNew = request.getParameter("verifyCode");
        if ("".equals(verifyCode) || "".equals(verifyCodeNew)){
            controllerResult = ControllerResult.getFailResult("注册失败！");
        }else{
            if (session.getAttribute("verifyCode").equals(request.getParameter("verifyCode"))) {
                System.out.println("com/ht/controller/AgencyController.java:27");
                session.removeAttribute("verifyCode");
                if (checkPhone().equals(SUCCESS) && checkEmail().equals(SUCCESS)) {
                    agency.setPwd(EncryptUtil.md5(agency.getPwd()));
                    agency.setCreated_time(Calendar.getInstance().getTime());
                    agency.setLogo("/" + FileUtil.PATH + "/" + Constants.DEFAULT_AGENCY_LOGO);
                    agency.setStatus(Constants.YES_STATUS);
                    agency.setRole(new Role(Constants.AGENCY_ROLE));
                    agency.setChecked_status(Constants.NO_STATUS);
                    agencyService.save(agency);
                    return SUCCESS;
                }
                return SUCCESS;
            } else {
                return "fail";
            }
        }
        return "fail";
    }

    /**
     * 发送短信验证码
     *
     * @return
     */
    public String sendVerifyCode() {
        String phone = request.getParameter("phone");
        String verifyCode = VerifyCodeUtil.getVerifyCode();
        System.out.println("com/ht/controller/AgencyController.java:31.." + verifyCode);
        session.setAttribute("verifyCode", verifyCode);
        IndustrySMS.execute(phone,verifyCode); //快答辩时再放开这注释（发短信要收费的）。
        controllerResult = ControllerResult.getSuccessResult("发送验证码成功");
        return SUCCESS;
    }

    /**
     * 赖：检查经销商邮箱是否存在
     *
     * @return
     */
    public String checkEmail() {
        Agency reg_agency = agencyService.foundByEmail(agency.getEmail());
        if (reg_agency == null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
        controllerResult = ControllerResult.getSuccessResult("该邮箱已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }

    /**
     * 2.校验手机号
     */
    public String checkPhone() {
        Agency reg_agency = agencyService.foundByPhone(agency.getPhone());
        if (reg_agency == null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
        controllerResult = ControllerResult.getFailResult("该手机号已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }

    /**
     * 分页显示所有经销商
     */
    public String pagerAgency() {
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Agency> pager = new Pager<>();//创建分页对象
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = agencyService.listPager(pager);
        rows = pager.getResult();//查询出所有经销商
        total = agencyService.count(pager).intValue();//查询出经销商总数
        return SUCCESS;
    }

    /**
     * 经销商激活与冻结
     *
     * @return
     */
    public String statusAgency() {
        if (status == 1) {
            agencyService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("激活成功！");
        } else if (status == 0) {
            agencyService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("冻结成功！");
        } else {
            controllerResult = ControllerResult.getFailResult("操作失败!");
        }
        return SUCCESS;
    }

    //查看未经审核的经销商\
    public String foundUncheckedAgencies() {
        rows = agencyService.foundByUnchecked((short) 0);
        return "foundUncheckedAgencies";
    }

    //参看已审核的经销商
    public String foundCheckedAgencies() {
        rows = agencyService.foundByUnchecked((short) 1);
        return "foundCheckedAgencies";
    }

    //批量审核经销商以及单独审核
    public String checkedAgencies() {
        String tempStr = request.getParameter("id");
        String[] strId = tempStr.split(",");
        agencyService.updateCheckedStatus(strId, (short) 1);
        return "checkedAgencies";
    }

    //批量否决经销商以及单独否决
    public String UncheckedAgencies() {
        String tempStr = request.getParameter("id");
        String[] strId = tempStr.split(",");
        agencyService.updateCheckedStatus(strId, (short) 0);
        return "UncheckedAgencies";
    }

    public String agencyPhoneLogin() {
        String agencyPhone = request.getParameter("phone");
        String agencyPwd = request.getParameter("pwd");
        Agency agencyLogin = agencyService.loginPhone(agencyPhone, EncryptUtil.md5(agencyPwd));
        if (agencyLogin == null) {
            controllerResult = ControllerResult.getFailResult("用户被冻结或账号密码错误！");
            controllerResult.setMessageColor("red");
            return "fail";
        } else {
            session.setAttribute("agency", agencyLogin);
            controllerResult = ControllerResult.getSuccessResult("登录成功！");
            return SUCCESS;
        }
    }

    /**
     * 安全退出功能
     * @return
     */
    public String quit(){
        Agency quitAgency = (Agency) session.getAttribute("agency");
        session.invalidate();
        controllerResult = ControllerResult.getSuccessResult("尊敬的用户，您成功安全退出！");
        return SUCCESS;
    }
    public String showAgencyRegister() {
        return "showAgencyRegister";
    }

    public String showAgencyLogin() {
        return "showAgencyLogin";
    }

    public String showAgencyIndex() {
        return "showAgencyIndex";
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public Agency getAgency() {
        return agency;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<Agency> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setAgencyService(AgencyService agencyService) {
        this.agencyService = agencyService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPage() {
        return page;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public void setLogo(File logo) {
        this.logo = logo;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }
}
