package RA.Academy.controller;

import RA.Academy.model.Customer;
import RA.Academy.service.ICustomerService;
import RA.Academy.serviceLpm.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    private SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/404.jsp").forward(request, response);
        } else {
            switch (action) {
                case "FINDALL":
                    showListCustomer(customerService.findAll(), request, response);
                    break;
                case "ADD":
                    request.getRequestDispatcher("/WEB-INF/views/customer/add-customer.jsp");
                    break;
                case "EDIT":

                    break;
            }
        }
    }

    protected void showListCustomer(List<Customer> list, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setAttribute("list", list);
        req.getRequestDispatcher("/WEB-INF/views/customer/list-customer.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 
