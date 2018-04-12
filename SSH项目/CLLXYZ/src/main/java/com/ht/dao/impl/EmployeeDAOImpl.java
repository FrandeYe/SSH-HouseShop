package com.ht.dao.impl;

import com.ht.bean.Employee;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.EmployeeDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class EmployeeDAOImpl extends HibernateSessionFactoryBean implements EmployeeDAO {
    @Override
    public void save(Employee employee) {
        getSessionFactory().getCurrentSession().save(employee);
    }

    @Override
    public void remove(Employee employee) {
        getSessionFactory().getCurrentSession().remove(employee);
    }

    @Override
    public void update(Employee employee) {
        getSessionFactory().getCurrentSession().update(employee);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Employee set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Employee foundById(String id) {
        String sql = "from Employee where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public Pager<Employee> listPager(Pager<Employee> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Employee> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Employee" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public void updateEmployeeSelf(String id, Employee employee) {
        String sql = "update Employee set name=:name,email=:email,qq=:qq,wechat=:wechat,address=:address," +
                "gender=:gender,exp=:exp,des=:des,intro=:intro where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("name",employee.getName());
        query.setParameter("email",employee.getEmail());
        query.setParameter("qq",employee.getQq());
        query.setParameter("wechat",employee.getWechat());
        query.setParameter("address",employee.getAddress());
        query.setParameter("gender",employee.getGender());
        query.setParameter("exp",employee.getExp());
        query.setParameter("des",employee.getDes());
        query.setParameter("intro",employee.getIntro());
        query.setParameter("id",employee.getId());
        query.executeUpdate();
    }

    @Override
    public Employee queryByIdPwd(String id, String pwd) {
        String sql = "from Employee where id=:id and pwd=:pwd";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        query.setParameter("pwd",pwd);
        Employee employee =(Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public void updateEmpPwd(String id, String pwd) {
        String sql = "update Employee set pwd=:pwd where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("pwd",pwd);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Employee findByPhone(String phone) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee where phone=:phone");
        query.setParameter("phone",phone);
        return  (Employee) query.uniqueResult();
    }

    @Override
    public Employee findByEmail(String email) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee where email=:email");
        query.setParameter("email",email);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public Employee loginPhone(String phone, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee where phone=:phone and pwd=:pwd and status=1");
        query.setParameter("phone",phone);
        query.setParameter("pwd",pwd);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public Employee loginEmail(String email, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee where email=:email and pwd=:pwd and status=1");
        query.setParameter("email",email);
        query.setParameter("pwd",pwd);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public void queryEmployeeSalesRecord(String id) {

    }

    @Override
    public List<Employee> foundEmpsByAgencyId(String id) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Employee where agency_id =:agency_id");
        query.setParameter("agency_id",id);
        List<Employee> employees = query.list();
        return employees;
    }
}
