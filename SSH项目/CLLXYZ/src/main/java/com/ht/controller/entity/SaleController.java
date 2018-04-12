package com.ht.controller.entity;

import com.ht.bean.*;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.CustomerService;
import com.ht.service.RoomService;
import com.ht.service.SaleService;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SaleController extends AppController {

    private Sale sale;

    private SaleService saleService;
    private RoomService roomService;
    private CustomerService customerService;
    private Short status;
    private String id;
    private Integer page;
    private ControllerResult controllerResult;
    private Integer total;
    private List<Sale> rows;

    /**
     * 根据room_id查询记录，得到业主信息
     * @return
     */
    public String foundSale(){
        Sale sale = saleService.foundById(id);
       return SUCCESS;
   }

    /**
     * 添加销售记录，同时更改房屋状态,更改客户状态
     * @return
     */
    public String saveSale(){
        sale.setStatus(Constants.YES_STATUS);
        sale.setCreated_time(Calendar.getInstance().getTime());
        Set<Sale> sales = new HashSet<Sale>();
        sales.add(sale);
        Employee employee = new Employee();
        employee.setId(request.getParameter("emp_id"));
        employee.setSales(sales);
        Agency agency = new Agency();
        agency.setId(request.getParameter("agency_id"));
        agency.setSales(sales);
        Customer customer = new Customer();
        customer.setId(request.getParameter("customer_id"));
        customer.setCustomer_type("购房客户");
        Room room = new Room();
        room.setId(request.getParameter("room_id"));
        room.setSale(sale);
        sale.setAgency(agency);
        sale.setEmployee(employee);
        sale.setCustomer(customer);
        sale.setRoom(room);
        try {
            customerService.updateCustomerType(customer);
            roomService.updateSaleStatus(room.getId(),"已售出");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("添加失败！");
        }
        try {
            saleService.save(sale);
            controllerResult = ControllerResult.getSuccessResult("添加成功！");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("添加失败！");
        }
        return SUCCESS;
    }


    /**
     * 销售记录的修改
     */
    public String updateSale(){
        try {
            saleService.update(sale);
            controllerResult = ControllerResult.getSuccessResult("修改成功！");
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("修改失败！");
        }
        return SUCCESS;
    }

    /**
     * 销售记录的分页查看
     */
    public String pagerSale(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Sale> pager = new Pager<Sale>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager.setParamStr(" where emp_id='"+id+"' order by created_time desc");
        try {
            pager = saleService.listPager(pager); // 查询出的结果
        }catch (Exception e){
            e.printStackTrace();
        }
        rows = pager.getResult();
        total = saleService.count(pager).intValue();
        return SUCCESS;
    }

    /**
     * 销售记录的激活与冻结
     */
    public String statusSale(){
        try {
            saleService.updateStatus(id,status);
            if(status == 1) {
                controllerResult = ControllerResult.getSuccessResult("激活成功！");
            }else if(status == 0) {
                controllerResult = ControllerResult.getSuccessResult("冻结成功！");
            }
        }catch (Exception e){
            controllerResult = ControllerResult.getFailResult("修改状态失败！");
        }
        return SUCCESS;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
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

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Sale> getRows() {
        return rows;
    }
}
