package RA.Academy.serviceLpm;

import RA.Academy.model.Customer;
import RA.Academy.service.ICustomerService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CustomerService implements ICustomerService {
    public List<Customer> customers = new ArrayList<>();

    public CustomerService() {
        SimpleDateFormat sim = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Customer c1 = new Customer(1L, "Cadie Chau", "chau@gmail.com", "0345451538", true, sim.parse("26/01/1997"), "No Pain No Gain", "https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-1/375990023_122095010054046141_2440327697861772900_n.jpg?stp=dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=F2NP7OS7u28AX94eGPR&_nc_ht=scontent.fsgn2-7.fna&cb_e2o_trans=q&oh=00_AfB6GzdB5fUot9UmGG2yfI6VL_HxmTY5AILY0XuutY5BdA&oe=65573044");
            customers.add(c1);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public Optional<Customer> findById(Long id) {
        return customers.stream().filter(c -> c.getId()).orElse(null);
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public void deleteById(Long id) {

    }
}
