package com.ht.controller;

import com.ht.bean.User;
import com.ht.common.*;
import com.ht.common.msg.IndustrySMS;
import com.ht.common.msg.VerifyCodeUtil;
import com.ht.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class UserController extends AppController {
    private User user;              // getter setter
    private File upload; // 与form表单中file的name一致，temp文件， ROOT/upload_cc3fa222_9f87_4066_af9b_8b7f07e77389_00000000.tmp
    private String uploadFileName; // 此变量的名称固定为file的name + "FileName".
    private String logoContentType; // file的name + "contentType"

    private ControllerResult controllerResult;
    private List<User> rows;
    private Integer total;

    private UserService userService; // setter
    private String id;       // setter
    private Integer page;   //setter
    private Short status; // setter
    //需要输出log记录
    private static final Logger logger = Logger.getLogger(AdminController.class);

    /**
     * 1.到添加页面，得到表单数据
     */
    public String toAddPage() {
        return "toAddPage";
    }

    public String sendVerifyCode() {
        String phone = request.getParameter("phone"); //页面输入的手机号
        String verifyCode = VerifyCodeUtil.getVerifyCode();//获取随机生成的数字
        System.out.println("com/ht/controller/UserController.java:44.." + verifyCode);
        session.setAttribute("verifyCode", verifyCode);
        IndustrySMS.execute(phone,verifyCode); //快答辩时再放开这注释（发短信要收费的）。
        controllerResult = ControllerResult.getSuccessResult("发送验证码成功");
        return SUCCESS;
    }

    /**
     * 2.校验手机号
     */
    public String checkPhone() {
        User reg_user = userService.findByPhone(user.getPhone());
        if (reg_user == null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
        controllerResult = ControllerResult.getFailResult("该手机号已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }

    /**
     * 校验登录手机号
     */
    public String checkLoginPhone() {
        User reg_user = userService.findByPhone(user.getPhone());
        if (reg_user != null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }else {
            controllerResult = ControllerResult.getFailResult("请输入您的手机号");
            controllerResult.setMessageColor("red");
            return "fail";
        }
    }

    /**
     * 3.校验邮箱
     *
     * @return
     */
    public String checkEmail() {
        User reg_user = userService.findByEmail(user.getEmail());
        if (reg_user == null) {
            controllerResult = ControllerResult.getSuccessResult("✔");
            controllerResult.setMessageColor("green");
            return SUCCESS;
        }
        controllerResult = ControllerResult.getSuccessResult("该邮箱已注册");
        controllerResult.setMessageColor("red");
        return "fail";
    }

    /**
     * 4.手机号和邮箱校验通过，实现注册功能
     *
     * @return
     */
    public String register() {
        String verifyCode = (String) session.getAttribute("verifyCode");
        String verifyCodeNew = request.getParameter("verifyCode");
        if ("".equals(verifyCode) || "".equals(verifyCodeNew)){
            controllerResult = ControllerResult.getFailResult("注册失败！");
        }else{

            if (session.getAttribute("verifyCode").equals(request.getParameter("verifyCode"))) {
                System.out.println("com/ht/controller/UserController.java:91");
                session.removeAttribute("verifyCode");
                if (checkPhone().equals(SUCCESS) && checkEmail().equals(SUCCESS)) {
                    user.setPwd(EncryptUtil.md5(user.getPwd()));;
                    user.setHeadicon(Constants.DEFAULT_USER_HEADICON);
                    user.setStatus(Constants.YES_STATUS);
                    userService.save(user);

                    return SUCCESS;
                }
                return "fail";
            } else {
                return "fail";
            }
        }
        return "fail";
    }

//基本信息的查看
    public String information(){
        user = userService.foundById( id);
        System.out.println(user);
        if (user!=null){
            controllerResult = ControllerResult.getSuccessResult("查看成功");
            return  SUCCESS;
        }else{
            controllerResult = ControllerResult.getSuccessResult("查看失败");
            return null;
        }
    }

    public String pagerUser() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<User> pager = new Pager<>();
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pagerSize);
        pager = userService.listPager(pager);
        rows = pager.getResult();
        total = userService.count(pager).intValue();
        return SUCCESS;

    }
    //状态的更改
    public String statusUser(){
        if (status!=null&&id!=null){
            if (status == 1) {
                userService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("激活成功");
            }else if (status ==0){
                userService.updateStatus(id,status);
                controllerResult = ControllerResult.getSuccessResult("冻结成功");
            }else {
                controllerResult = ControllerResult.getSuccessResult("操作失败");
            }
        }
        return SUCCESS;
    }

    /**
     * 用户登录的功能
     * @return
     */
    public String login(){
        String userPhone = request.getParameter("phone");
        String userPwd = request.getParameter("pwd");
        User loginUser = userService.loginUser(userPhone,EncryptUtil.md5(userPwd));
        if(loginUser == null){
            controllerResult = ControllerResult.getFailResult("用户被冻结或账号密码错误！");
            controllerResult.setMessageColor("red");
            return "fail";
        }else {
            session.setAttribute("user",loginUser);
            controllerResult = ControllerResult.getSuccessResult("登录成功！");
            return SUCCESS;
        }
    }

    /**
     * 失去焦点时对输入的密码进行校验，
     * @return
     */
    public String checkPassword(){
        User checkUser = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        if(EncryptUtil.md5(password).equals(checkUser.getPwd())) {
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
     * 修改密码
     * @return
     */
    public String updatePassword(){
        User updateUser = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        if(!password.equals("")&& !newPassword.equals("") && !confirmPassword.equals("")&& updateUser !=null){
            if(EncryptUtil.md5(password).equals(updateUser.getPwd())){
                if(newPassword.equals(confirmPassword)){
                    updateUser.setPwd(EncryptUtil.md5(newPassword));
                    userService.update(updateUser);
                    session.invalidate();
                    return SUCCESS;
                }
            }else{
                controllerResult = ControllerResult.getFailResult("修改密码失败，请检查密码是否输入正确");
                controllerResult.setMessageColor("red");
                return "fail";
            }
        }else {
            controllerResult = ControllerResult.getFailResult("请输入需要修改的密码选项！");
            controllerResult.setMessageColor("red");
            return "fail";
        }
        return SUCCESS;
    }

    /**
     * 修改头像
     * @return
     */
    public String updateIcon(){
        User updateUser = (User) session.getAttribute("user");
        if(!upload.equals("")){
            try {
                FileUtils.copyFile(upload, new File( FileUtil.upload()+ File.separator + uploadFileName));
                updateUser.setHeadicon(uploadFileName);
                session.setAttribute("user", updateUser);
                userService.update(updateUser);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return SUCCESS;
        }else{
            controllerResult = ControllerResult.getFailResult("修改头像失败！");
            controllerResult.setMessageColor("red");
            return "fail";
        }
    }

    /**
     * 安全退出功能
     * @return
     */
    public String quit(){
        User quitUser = (User) session.getAttribute("user");
        session.invalidate();
        controllerResult = ControllerResult.getSuccessResult("尊敬的用户，您成功安全退出！");
        return SUCCESS;
    }

    /**
     * 修改用户信息
     * @return
     */
    public String updateInfo(){
        User updateUser = (User) session.getAttribute("user");
        updateUser.setNickname(request.getParameter("nickname"));
        System.out.println(request.getParameter("nickname"));
        updateUser.setName(request.getParameter("name"));
        updateUser.setEmail(request.getParameter("email"));
        System.out.println(request.getParameter("email"));
        updateUser.setQq(request.getParameter("qq"));
        updateUser.setWechat(request.getParameter("wechat"));
        userService.update(updateUser);
        session.setAttribute("user", updateUser);
        controllerResult = ControllerResult.getSuccessResult("修改基本信息成功");
        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public String showUserLogin(){
        return "showUserLogin";
    }

    public String showUserIndex(){
        return "showUserIndex";
    }

    public String showUserRegister(){
        return "showUserRegister";
    }

    public String showArticle(){
        return "showArticle";
    }

    public String showIndex(){
        return "showIndex";
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setLogoContentType(String logoContentType) {
        this.logoContentType = logoContentType;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<User> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setStatus(Short status) {
        this.status = status;
    }
}
