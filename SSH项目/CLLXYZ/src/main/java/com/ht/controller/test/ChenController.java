package com.ht.controller.test;

import com.ht.bean.*;
import com.ht.common.Constants;

import com.ht.controller.AppController;
import com.ht.service.*;
import java.util.Calendar;


public class ChenController extends AppController {
    //----agency-------------
    private AgencyService agencyService;
    private CustomerService customerService;
    private EmployeeService employeeService;
    private SaleService saleService;
    private MissionService missionService;

    private ArticleTypeService articleTypeService;
    private ArticleService articleService;
    private AdsService adsService;
    private ActivityService activityService;
    private AppointmentService appointmentService;

    private UserService userService; //用户
    private MessageService messageService; //留言
    private CommentService commentService; // 评论
    private LikeService likeService; //点赞记录
    private HistoryService historyService;// 历史记录表
    private RoleService roleService;//角色表

    private BuildingsService buildingsService;
    private BuildingService buildingService;
    private HouseService houseService;
    private RoomService roomService;
    private BuildingsImgService buildingsImgService;



    public String agencyAdd() {
        Agency agency = new Agency();
        agency.setEmail("102@qq.com");
        agency.setName("王五");
        agency.setPhone("188082059");
        agency.setPwd("123456");
        agency.setAddress("load");
        agency.setLogo("/agency.jpg");
        agency.setIntro("intro");
        agency.setLeader("leader");
        agency.setStatus((short) 0);
        agency.setTel("0797");
        agency.setCreated_time(Calendar.getInstance().getTime());
        agency.setChecked_status((short) 0);
        agencyService.save(agency);
        return SUCCESS;
    }

    //-----------user--------------


    public String userAdd() {
        User user = new User();
            user.setEmail("12345@qq.com");
            user.setPhone("1234561234");
            user.setPwd("123456");
            user.setQq("251466258");
            user.setWechat("wechat2");
            user.setGender("f");
            user.setBirthday(Calendar.getInstance().getTime());
            user.setNickname("users");
            user.setName("张三丰");
            user.setHeadicon("/user.jpg");
            userService.save(user);

        return SUCCESS;
    }

    //--------------building-----------------

    //测试单独添加楼盘数据
    public String addBuildingsTest() {
             Buildings buildings = new Buildings();
             Agency agency = new Agency();
            agency.setId("4028805c5e2bf930015e2bf9d8640000");
            buildings.setName("楼盘0");
            buildings.setArea("章贡区");
            buildings.setAddress("江西省赣州市章贡区");
            buildings.setFloor_area(10000.00);
            buildings.setOpen_date(Calendar.getInstance().getTime());
            buildings.setBuilding_area(8888.88);
            buildings.setHouse_type("商业");
            buildings.setBuilding_type("塔楼");
            buildings.setLongitude(66.66);
            buildings.setLatitude(66.66);
            buildings.setAvg_price(1000000.00);
            buildings.setCompany("建筑设计公司");
            buildings.setOpen_date(Calendar.getInstance().getTime());
            buildings.setTotal_rooms(100);
            buildings.setReception_address("章贡区");
            buildings.setTel("朝阳新区");
            buildings.setGreen_ratio(15);
            buildings.setPlot_ratio(70);
            buildings.setProperty_company("物业");
            buildings.setProperty_fee(800);
            buildings.setCar_station(4);
            buildings.setTraffic("良好");
            buildings.setEquipments("周边配套");
            buildings.setLogo("/buildings.jsp");
            buildings.setIntro("简介");
            buildings.setCreated_time(Calendar.getInstance().getTime());
            buildings.setStatus((short) 0);
            buildings.setAgency(agency);
            buildingsService.save(buildings);
        return SUCCESS;
    }


    public String empAdd() {

        Employee employee = new Employee();
            employee.setName("张师傅");
            employee.setEmail("123@qq.com");
            employee.setPwd("123456");
            employee.setPhone("1234561234");
            employee.setQq("251466252");
            employee.setWechat("wechat");
            employee.setGender("n");
            employee.setExp("very-good");
            employee.setDes("employee-des");
            employee.setAddress("章贡区");
            employee.setBasic_salary(12.22);
            employee.setHeadicon("/employee.jsp");
            employee.setIntro("简介");
            employee.setCreated_time(Calendar.getInstance().getTime());
            employee.setStatus((short) 0);
            employeeService.save(employee);
        return SUCCESS;
    }

    public String appointments() {
        Appointment appointment = new Appointment();
        int i;
        for (i = 0; i < 8; i++) {
            appointment.setApp_arrive_time(Calendar.getInstance().getTime()); //预约看房时间
            appointment.setArrive_time(Calendar.getInstance().getTime()); //真实看房时间
            appointment.setApp_status("预约中");//预约的状态
            appointment.setCreated_time(Calendar.getInstance().getTime()); //预约创建的时间
            appointment.setStatus((short) 0);
            appointmentService.save(appointment);
        }
        return SUCCESS;
    }

    public String customerAdd() {
        Customer customer = new Customer();

            customer.setName("小敏");
            customer.setGender("f");
            customer.setBirthday(Calendar.getInstance().getTime());
            customer.setIdentity_id("36072619990808603");
            customer.setEmail("123@qq.com");
            customer.setPhone("1331777177");
            customer.setAddress("章贡区");
            customer.setCustomer_type("预约客户");
            customer.setTogether("小明");
            customer.setContract("电子版购房合同路径");
            customer.setArchives("zip版电子档案路径");
            customer.setCreated_time(Calendar.getInstance().getTime());
            customer.setStatus((short) 0);

            customerService.save(customer);

        return SUCCESS;
    }

    public String saleAdd() {
        Sale sale = new Sale();
            sale.setSale_time(Calendar.getInstance().getTime());
            sale.setUnit_price(123.33);
            sale.setDiscount(0.88);
            sale.setTotal_cost(1234.66);
            sale.setCreated_time(Calendar.getInstance().getTime());
            sale.setStatus((short) 0);
            saleService.save(sale);
        return SUCCESS;
    }

    //单独添加户型数据
    public String addHouse() {
        House house = new House();
        int i;
        for (i = 0; i < 8; i++) {
            house.setName("户型0" + i);
            house.setLogo("/house.jsp");
            house.setIntro("house简介");
            house.setArea(10000.10);
            house.setUnit_price(1000000);
            house.setCreated_time(Calendar.getInstance().getTime());
            house.setStatus((short) 0);
            houseService.save(house);
        }
        return SUCCESS;
    }

    //单独添加楼栋数据测试
    public String addBuildingTest() {
        Building building = new Building();
        int i;
        for (i = 0; i < 8; i++) {
            building.setName("楼栋0" + i + "号");
            building.setFloor_rooms(25);
            building.setTotal_lift(5);
            building.setTotal_room(10);
            building.setCreated_time(Calendar.getInstance().getTime());
            building.setStatus((short) 0);
            buildingService.save(building);
        }
        return SUCCESS;
    }


    //单独添加房号数据
    public String addRoom() {
        Room room = new Room();
        int i;
        for (i = 0; i < 8; i++) {
            room.setName("1-10" + i);
            room.setSale_status("待售中");
            roomService.save(room);
        }
        return SUCCESS;
    }

    //单独添加楼盘图片表数据
    public String addBuildingsImg() {
        BuildingsImg buildingsImg = new BuildingsImg();
        int i;
        for (i = 0; i < 8; i++) {
            buildingsImg.setImg_path("/buildingsImg.jpg");
            buildingsImg.setImg_des("BuildingsImg_Des");
            buildingsImg.setCreated_time(Calendar.getInstance().getTime());
            buildingsImgService.save(buildingsImg);
        }
        return SUCCESS;
    }

    public String message() {
        Message message = new Message();
            message.setContent("小张的留言内容");
            message.setReply("留言的回复");
            message.setLeave_time((Calendar.getInstance().getTime())); //留言的时间
            message.setReply_time((Calendar.getInstance().getTime())); //留言的回复时间
            message.setStatus((short) 0);
            messageService.save(message);
        return SUCCESS;
    }

    public String comment() {
        Comment comment = new Comment();
        int i;
        for (i = 0; i < 8; i++) {
            comment.setContent("评论的内容" + i);
            comment.setComment_time(Calendar.getInstance().getTime()); //评论的时间
            comment.setStatus((short) 0);
            commentService.save(comment);
        }
        return SUCCESS;
    }

    public String like() {
        int i;
        for (i = 0; i < 8; i++) {
            Like like = new Like();
            like.setCreated_time(Calendar.getInstance().getTime()); //点赞的时间
            likeService.save(like);
        }
        return SUCCESS;
    }


    public String history() {

        History history = new History();
        int i;
        for (i = 0; i < 8; i++) {
            history.setCreated_time(Calendar.getInstance().getTime()); //历史记录的时间
            historyService.save(history);
        }
        return SUCCESS;
    }



    public String testArticleTypeAdd() {
        ArticleType articleType = new ArticleType();
        articleType.setName("articleType-name11111");
        articleType.setDes("articleType-des11111");
        articleTypeService.save(articleType);
        return SUCCESS;
    }

    public String testArticleAdd() {
        Article article = new Article();
        article.setAbstracts("article-abstract11");
        article.setTitle("article-title11");
        article.setContent("article-content11");
        articleService.save(article);
        return SUCCESS;
    }

    public String testAdsAdd() {
        Ads ads = new Ads();
        ads.setTitle("ads-title11");
        ads.setShow_order(3);
        ads.setContent("ads-content11");
        adsService.save(ads);
        return SUCCESS;
    }

    public String testActivityAdd() {
        Activity activity = new Activity();
        activity.setAddress("activity-address11");
        activity.setTitle("activity-title11");
        activityService.save(activity);
        return SUCCESS;
    }

    public String missionAdd() {
        Mission mission = new Mission();

            mission.setBonus_percent(20);
//            mission.setMonthes(12);
            mission.setQuantity(9);
            missionService.save(mission);
        return SUCCESS;
    }


    public String role() {
            Role role = new Role();
            role.setName("role角色的名称");
            role.setDes("角色的描述");
            role.setCreated_time(Calendar.getInstance().getTime()); //角色的创建时间
            role.setStatus((short) 0);
            roleService.save(role);

        return SUCCESS;
    }


    //------------- employee -------------------

    //员工添加客户资料
    public String addCustomer() {
        Customer customer = new Customer();
            customer.setId(request.getParameter("customer_id"));
            customer.setName("客户0" );
            customer.setGender("女");
            customer.setBirthday(Calendar.getInstance().getTime());
            customer.setEmail("abc@qq.com");
            customer.setAddress("赣州市章贡区沙石镇赣州技师学院");
            customer.setIdentity_id("36072620170101233");
            customer.setPhone("1234567880");
            customer.setCustomer_type("预约客户");
            customer.setTogether("zhangsan");//共同购房人
            customer.setContract("src/doc/path");//电子版购房合同路径
            customer.setArchives("src/zip/path");//zip合同路径
            customer.setStatus(Constants.NO_STATUS);
            customer.setCreated_time(Calendar.getInstance().getTime());
            customerService.save(customer);

        return SUCCESS;
    }

   /* public void setAgencyService(AgencyService agencyService) {
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

    public void setArticleTypeService(ArticleTypeService articleTypeService) {
        this.articleTypeService = articleTypeService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public void setAdsService(AdsService adsService) {
        this.adsService = adsService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public void setUserService(UserService userService) {
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

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }*/
}
