package com.ht.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AppController extends ActionSupport implements ServletRequestAware, ServletContextAware, ServletResponseAware {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;
    protected ServletContext app;

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
        session = request.getSession();
    }

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    @Override
    public void setServletContext(ServletContext context) {
        app = context;
    }
}
