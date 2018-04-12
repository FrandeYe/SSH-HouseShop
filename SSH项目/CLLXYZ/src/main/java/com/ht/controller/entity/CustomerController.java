package com.ht.controller.entity;

import com.ht.bean.Agency;
import com.ht.bean.Customer;
import com.ht.bean.Employee;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.CustomerService;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.*;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CustomerController extends AppController{
    private Customer customer;
    private static String fileName;//定义静态全局变量（叶）
    private CustomerService customerService;
    private Short status;
    private String id;
    private Integer page;

    private ControllerResult controllerResult;
    private List<Customer> rows;
    private Integer total;
    private List<NameIdVO> nameIdVOList;
    private File upload;
    private String uploadFileName;
    private InputStream downloadFile;

    /**
     * 下载
     * @return
     */
    public InputStream getDownloadFile(){
        String customerFileName = request.getParameter("fileName");
        try{
            downloadFile = ServletActionContext.getServletContext().getResourceAsStream(FileUtil.PATH + "/" + customerFileName);
            System.out.println(FileUtil.PATH + "/" + customerFileName);
            if (downloadFile != null) {
                return downloadFile;
            }
            controllerResult = ControllerResult.getSuccessResult("下载成功！");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("下载失败！");
        }
        return  null;
    }

    public String downFile() {
        return "downFile";
    }

    
    //经销商添加客户
    public String saveCustomer() {
            customer.setStatus(Constants.YES_STATUS);
            customer.setCreated_time(Calendar.getInstance().getTime());
        try {
            customerService.save(customer);
            controllerResult = ControllerResult.getSuccessResult("添加客户成功！");
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加客户失败！该手机号已存在！");
        }
        return SUCCESS;
    }

    //修改客户资料(叶)
    public String updateCustomer(){
        Agency agency = new Agency();
        agency.setId(request.getParameter("agency_id"));
        Employee employee = new Employee();//员工
        employee.setId(request.getParameter("emp_id"));
        customer.setCreated_time(Calendar.getInstance().getTime());
        customer.setEmployee(employee);
        customer.setAgency(agency);
        Set<Customer> customers = new HashSet<Customer>();
        employee.setCustomers(customers);
        agency.setCustomers(customers);
        try {
            customerService.update(customer);
            controllerResult = ControllerResult.getSuccessResult("修改成功！");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("修改失败！");
        }
        return SUCCESS;
    }

    /**
     * 指定修改客户的某些信息y
     * @return
     */
    public String updateCustomerInfo(){
        try {
            if ("".equals(customer.getCustomer_type())){
                customer.setCustomer_type("购房客户");
            }
            customerService.updateCustomerInfo(customer.getId(),customer);
            controllerResult = ControllerResult.getSuccessResult("修改成功！");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("修改失败！该手机号已存在！");
        }

        return SUCCESS;
    }
    /***
     * 查看单个户型详情(修改信息)
     * @return
     */
    public String foundById(){
        customer =customerService.foundById(id);
        return "showAlterCustomer";
    }
   //经销商修改指定客户信息
    public String agencyUpdateCustomer(){
        try {
            customerService.update(customer);
            controllerResult = ControllerResult.getSuccessResult("客户信息修改成功");
        }catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("客户信息修改失败");
        }
        return SUCCESS;
    }

    //客户的激活与冻结
    public String statusCustomer(){
        try {
            customerService.updateStatus(id,status);
            if(status == 1) {
                controllerResult = ControllerResult.getSuccessResult("激活成功!");
            }else if(status == 0) {
                controllerResult = ControllerResult.getSuccessResult("冻结成功!");
            }
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("修改状态失败!参数发生了错误！");
        }
        return SUCCESS;
    }


    /**
     * 员工分页查看客户
     */
    public String pagerCustomerEmployee(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); //每页显示几条数据
        Pager<Customer> pager = new Pager<Customer>();
        pager.setPageSize(pageSize);
        pager.setParamStr(" where emp_id='"+id+ "' order by created_time desc");
        pager.setPage(page);
        pager = customerService.listPager(pager);
        rows = pager.getResult();
        total = customerService.count(pager).intValue();
        return SUCCESS;
    }
    //经销商查看客户
    public String pagerCustomerAgency(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); //每页显示几条数据
        Pager<Customer> pager = new Pager<Customer>();
        pager.setPageSize(pageSize);
        pager.setParamStr(" where agency_id='" + id + "' order by created_time desc");
        pager.setPage(page);
        pager = customerService.listPager(pager);
        rows = pager.getResult();
        total = customerService.count(pager).intValue();
        System.out.println("132test");
        return SUCCESS;
    }

    public String pagerCustomerEmployeeVO(){
        nameIdVOList = new ArrayList<>();
        Pager<Customer> pager = new Pager<Customer>();
        pager.setParamStr(" where emp_id='"+request.getParameter("emp_id")+"'");
        pager.setPageSize(customerService.count(pager).intValue());
        try {
            pager = customerService.listPager(pager);
        }catch (Exception e){
            e.printStackTrace();
        }
        for (Customer c : pager.getResult()){
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(c.getId());
            nameIdVO.setName(c.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    /**
     * 上传文件（叶）：获取文件名，并保存到静态变量中
     * @return
     */
    public String uploadFileCustomer(){
        if (upload != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.upload() + File.separator + uploadFileName));
                fileName=uploadFileName;
                System.out.println("upload:"+fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }

    /**
     * 将静态的文件名传入数据库
     * @return
     */
    public String saveFileCustomer(){
        Customer cus = new Customer();
        cus.setId(id);
        String sqlStr;
        String fileType = request.getParameter("fileType");
        if ("contract".equals(fileType)){   //判断操作类型
            cus.setContract(fileName);
            System.out.println("save"+fileName);
            sqlStr = "contract=:contract where id=:id";
            try {
                customerService.updateCustomerFile(cus,sqlStr,fileType);
                controllerResult = ControllerResult.getSuccessResult("上传成功！");
            }catch (Exception e){
                controllerResult = ControllerResult.getFailResult("上传失败！");
            }

        }else{
            cus.setArchives(fileName);
            sqlStr = "archives=:archives where id=:id";
            try {
                customerService.updateCustomerFile(cus,sqlStr,fileType);
                controllerResult = ControllerResult.getSuccessResult("上传成功！");
            }catch (Exception e){
                controllerResult = ControllerResult.getFailResult("上传失败！");
            }
        }
        return SUCCESS;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public List<Customer> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }
    //合同文件上传的set方法

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }


}
