package com.ht.common;

public class GlobalSearchUtil {

    public String getSearchSQL(String name, int page, int pageSize) {
        int beginIndex = (page - 1) * pageSize;
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("select id, name, '经销商' as attribute, logo from t_agency where status = 1 and name like '%" + name + "%' ");
        stringBuffer.append("union select id, name, '楼盘' as attribute, logo from t_buildings where status = 1 and name like '%" + name + "%' ");
        stringBuffer.append("union select id, title, '活动' as attribute, logo from t_activity where status = 1 and title like '%" + name + "%' ");
        stringBuffer.append("union select id, title, '资讯' as attribute, logo from t_article where status = 1 and title like '%" + name + "%' ");
        stringBuffer.append("limit " + beginIndex + ", " + pageSize);
        return stringBuffer.toString();
    }

    public String getSearchCountSQL(String name) {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("select id from t_agency where status = 1 and name like '%" + name + "%' ");
        stringBuffer.append("union select id from t_buildings where status = 1 and name like '%" + name + "%' ");
        stringBuffer.append("union select id from t_activity where status = 1 and title like '%" + name + "%' ");
        stringBuffer.append("union select id from t_article where status = 1 and title like '%" + name + "%' ");
        return stringBuffer.toString();
    }
}
