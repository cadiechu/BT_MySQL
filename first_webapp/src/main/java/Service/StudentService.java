package Service;

import entity.Student;
import utils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentService implements IStudentService {

    @Override
    public List<Student> findAll() {
        List<Student> list = new ArrayList<>();
        Connection conn = null;
        conn = ConnectDB.getConnection();

        try {
            PreparedStatement pre = conn.prepareStatement("select *from Student");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setSex(rs.getBoolean("sex"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }

        return list;
    }

    @Override
    public Student findById(Integer id) {
        Student s = null;
        Connection conn = null;
        conn = ConnectDB.getConnection();
        try {
            PreparedStatement pre = conn.prepareStatement(
                    "select * from Student where id = ? ");
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setSex(rs.getBoolean("sex"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            List<Student> list1 = new ArrayList<>();
            Connection conn1 = null;
            conn1 = ConnectDB.getConnection();

            try {
                PreparedStatement pre = conn1.prepareStatement("select *from Student");
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    Student s1 = new Student();
                    s1.setId(rs.getInt("id"));
                    s1.setName(rs.getString("name"));
                    s1.setPhone(rs.getString("phone"));
                    s1.setAddress(rs.getString("address"));
                    s1.setSex(rs.getBoolean("sex"));
                    list1.add(s1);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                ConnectDB.closeConnection(conn1);
            }

//            return list;
            ConnectDB.closeConnection(conn1);
        }
        return s;
    }

    ;

    @Override
    public boolean save(Student student) {
        Connection conn = null;
        conn = ConnectDB.getConnection();
        PreparedStatement pre = null;
        try {
            if (findById(student.getId()) == null) {
                // thêm  mới
                pre = conn.prepareStatement(
                        "Insert into Student(name,phone,address,sex)" +
                                " values(?,?,?,?) ");
                pre.setString(1, student.getName());
                pre.setString(2, student.getPhone());
                pre.setString(3, student.getAddress());
                pre.setBoolean(4, student.isSex());

            } else {
//                cập nhật
                pre = conn.prepareStatement(
                        "update student " +
                                "set name = ?," +
                                "phone = ?," +
                                "address= ?," +
                                "sex = ? where id = ?");
                pre.setString(1, student.getName());
                pre.setString(2, student.getPhone());
                pre.setString(3, student.getAddress());
                pre.setBoolean(4, student.isSex());
                pre.setInt(5, student.getId());
            }
            pre.executeUpdate();
        } catch (SQLException e) {
            return false;
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return true;

    }

    ;

    @Override
    public void deleteById(Integer id) {
        Connection conn = null;
        conn = ConnectDB.getConnection();
        try {
            PreparedStatement pre = conn.prepareStatement(
                    "delete from Student where id = ?");
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }
}

