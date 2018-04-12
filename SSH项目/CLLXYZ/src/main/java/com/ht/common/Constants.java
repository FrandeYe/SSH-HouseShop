package com.ht.common;

public class Constants {

    public static final String DEFAULT_ENCRYPT = "MD5";
    public static final String DEFAULT_ENCODING = "utf-8";
    public static final String DEFAULT_SALE_STATUS = "待售中";
    public static final String ALREADY_SALE_STATUS = "已售出";

    public static final String EMPLOYEE_ROLE = "235e964e87c34ac2959ce702f4a50e3d";
    public static final String USER_ROLE = "3944c4378b3a4d5fa813455d6cca16f6";
    public static final String ADMIN_ROLE = "b07db0289b5344cf911723bd9e6e3832";
    public static final String AGENCY_ROLE = "ba18d787e0fc4019a4611943c5193765";

    public static final String DEFAULT_BUILDINGS_LOGO = "default_buildings_logo.jpg";
    public static final String DEFAULT_AGENCY_LOGO = "default_agency_logo.jpg";
    public static final String DEFAULT_ACTIVITY_LOGO = "default_activity_logo.jpg";
    public static final String DEFAULT_ARTICLE_LOGO = "default_article_logo.jpg";
    public static final String DEFAULT_ADS_LOGO = "default_ads_logo.jpg";
    public static final String DEFAULT_HOUSE_LOGO = "default_house_logo.jpg";
    public static final String DEFAULT_USER_HEADICON = "default_user_headicon.jpg";
    public static final String DEFAULT_EMP_HEADICON = "default_emp_headicon.jpg";

    /**
     * 代表数据不可用（已冻结）
     */
    public static final short NO_STATUS = 0;

    /**
     * 代表数据可用（已激活）
     */
    public static final short YES_STATUS = 1;

    /**
     * 代表房屋已售出
     */
    public static final short NO_HOUSE = 0;

    /**
     * 代表房屋待售中
     */
    public static final short YES_HOUSE = 1;

    /**
     * 默认的销售提成
     */
    public static final double DEFAULT_BONUS_PERCENT = 1000;

    /**
     * 默认的员工任务数量
     */
    public static final int DEFAULT_MISSION_QUANTITY = 5;
}
