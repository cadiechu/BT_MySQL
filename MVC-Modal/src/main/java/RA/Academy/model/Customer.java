package RA.Academy.model;

import java.time.LocalDate;
import java.util.Date;

public class Customer {
    private long id;
    private String name;
    private String email;
    private String phone;
    private boolean gen;
    private LocalDate birthday;
    public String bios;
    private String imageUrl;

    public Customer() {
    }

    public Customer(long id, String name, String email, String phone, boolean gen, LocalDate birthday, String bios) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gen = gen;
        this.birthday = birthday;
        this.bios = bios;
    }

    public Customer(long l, String cadieChau, String mail, String number, boolean b, Date parse, String noPainNoGain, String url) {
    }
}
