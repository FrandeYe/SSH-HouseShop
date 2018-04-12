package com.ht.controller;

import com.ht.bean.Admin;
import com.ht.common.ControllerResult;
import com.ht.common.EncryptUtil;
import com.ht.service.AdminService;
import com.ht.vo.NameIdVO;

import java.util.List;

public class AdminController extends AppController {

    private Admin admin; // getter setter

    private ControllerResult controllerResult; //getter
    private List<NameIdVO> nameIdVOList;

    private AdminService adminService;

    public String globalSearch() {
        String name = request.getParameter("name");
        nameIdVOList = adminService.globalSearchName(name);
        return SUCCESS;
    }

    //查询管理员的信息
    public String updatePwd() {
        Admin admin2 = (Admin) session.getAttribute("admin");
        String pwd = request.getParameter("pwd");
        String newPwd = request.getParameter("newPwd");
        String commitPwd = request.getParameter("commitPwd");
        if (admin2 != null) {
            if (admin2.getPwd().equals(EncryptUtil.md5(pwd))) {
                if (newPwd.equals(commitPwd)) {
                    admin2.setPwd(EncryptUtil.md5(newPwd));
                    adminService.update(admin2);
                    session.invalidate();
                    return SUCCESS;
                }
            } else {
                controllerResult = ControllerResult.getFailResult("修改密码失败，请检查密码是否输入正确");
                controllerResult.setMessageColor("red");
                return "fail";
            }
        } else {
            controllerResult = ControllerResult.getFailResult("当前管理员已失效，请重新登陆");
            controllerResult.setMessageColor("red");
            return "fail";
        }
        return SUCCESS;
    }

   /**
     * 管理员登录的功能
     * @return
     */
    public String adminLogin(){
       String adminPhone = request.getParameter("phone");
        String adminPwd = request.getParameter("pwd");
        System.out.println(adminPhone);
        System.out.println(adminPwd);
        Admin loginAdmin = adminService.adminLogin(adminPhone, EncryptUtil.md5(adminPwd));
        if (loginAdmin == null) {
            controllerResult = ControllerResult.getFailResult("用户被冻结或账号密码错误！");
            controllerResult.setMessageColor("red");
            return "fail";
        } else {
            session.setAttribute("admin", loginAdmin);
            controllerResult = ControllerResult.getSuccessResult("登录成功！");
            return SUCCESS;
        }
    }

    //验证密码
    public String checkPwd() {
        Admin admin1 = (Admin) session.getAttribute("admin");
        String pwd = request.getParameter("pwd");
        if (admin1.getPwd().equals(EncryptUtil.md5(pwd))) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        } else {
            controllerResult = ControllerResult.getFailResult("密码错误，请重新输入");
            controllerResult.setMessageColor("red");
            return "fail";
        }
    }

    /**
     * 安全退出功能
     * @return
     */
    public String quit() {
        Admin quitAdmin = (Admin) session.getAttribute("admin");
        session.invalidate();
        controllerResult = ControllerResult.getSuccessResult("尊敬的管理员，您成功安全退出！");
        return SUCCESS;
    }
    public String showAdminLogin(){
        return "showAdminLogin";
    }

    public String showAdminIndex() {
        return "showAdminIndex";
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }
}
