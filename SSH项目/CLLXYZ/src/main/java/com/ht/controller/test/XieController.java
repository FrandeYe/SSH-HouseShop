package com.ht.controller.test;

import com.ht.bean.*;
import com.ht.common.EncryptUtil;
import com.ht.controller.AppController;
import com.ht.service.*;
import com.ht.vo.NameIdVO;

import java.util.Calendar;
import java.util.List;

public class XieController extends AppController {


    /* 测试要求：向数据库中添加相应表的数据（非外键的所有数据），
        即在com.ht.controller.test包中的controller中增加相应service，方法。
        例如UserController

        10、用户，留言，评论，点赞，历史记录表的测试。

   */
    private UserService userService; //用户
    private MessageService messageService; //留言
    private CommentService commentService; // 评论
    private LikeService likeService; //点赞记录
    private HistoryService historyService;// 历史记录表
    private AppointmentService appointmentService;//预约
    private RoleService roleService;//角色表
    private AgencyService agencyService;

    private AdminService adminService;

    private String id;

    public String testGlobalSearch() {
        List<NameIdVO> 最 = adminService.globalSearchName("1");
        return SUCCESS;
    }

    /***
     * 模拟经销商登入
     * @return
     */
    public String testLogin() {
        session.setAttribute("agency", agencyService.foundById(id));
        return SUCCESS;
    }

    public String user() {
        User user = new User();
        user.setEmail("HELLO@qq.com");
        user.setPwd(EncryptUtil.md5("123456"));
        user.setPhone("3456789");
        user.setQq("2979064770");
        user.setWechat("A18870798915");
        user.setGender("女");
        user.setBirthday(Calendar.getInstance().getTime());
        user.setNickname("Ru天籁");
        user.setName("xdp");
        userService.save(user);
        return SUCCESS;
    }


    public String message() {
        Message message = new Message();
        message.setContent("小张的留言内容");
        message.setReply("留言的回复");
        message.setLeave_time((Calendar.getInstance().getTime())); //留言的时间
        message.setReply_time((Calendar.getInstance().getTime())); //留言的回复时间
        messageService.save(message);
        return SUCCESS;
    }

    public String comment() {
        Comment comment = new Comment();
        comment.setContent("评论的内容");
        comment.setComment_time(Calendar.getInstance().getTime()); //评论的时间
        commentService.save(comment);
        return SUCCESS;
    }

    public String like() {
        Like like = new Like();
        like.setCreated_time(Calendar.getInstance().getTime()); //点赞的时间
        likeService.save(like);
        return SUCCESS;
    }


    public String history() {
        History history = new History();
        history.setCreated_time(Calendar.getInstance().getTime()); //历史记录的时间
        historyService.save(history);
        return SUCCESS;
    }

    public String appointments() {
        Appointment appointment = new Appointment();
        appointment.setApp_arrive_time(Calendar.getInstance().getTime()); //预约看房时间
        appointment.setArrive_time(Calendar.getInstance().getTime()); //真实看房时间
        appointment.setApp_status("预约中");//预约的状态
        appointment.setCreated_time(Calendar.getInstance().getTime()); //预约创建的时间
        appointmentService.save(appointment);
        return SUCCESS;
    }

    public String role() {
        Role role = new Role();
        role.setName("role角色的名称");
        role.setDes("角色的描述");
        role.setCreated_time(Calendar.getInstance().getTime()); //角色的创建时间
        roleService.save(role);
        return SUCCESS;
    }

    public void setId(String id) {
        this.id = id;
    }

    /*public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public void setLikeService(LikeService likeService) {
        this.likeService = likeService;
    }

    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }*/

    public void setAgencyService(AgencyService agencyService) {
        this.agencyService = agencyService;
    }

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }
}
