<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<%--Navbar--%>
<div>
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Active</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
    </ul>
</div>

<br>
<br/>
<main>
    <h3 style=" text-align: center">Students List</h3>
    <div style="display: flex; justify-content: center; gap: 10px">
        <select style="width: fit-content" class="form-select" aria-label="Default select example">
            <option selected>Sort</option>
            <option value="1">Increase</option>
            <option value="2">Decrease</option>
        </select>
        <select style="width: fit-content" class="form-select" aria-label="Default select example">
            <option selected>Catagories</option>
            <option value="1">Name</option>
            <option value="2">Age</option>
        </select>
        <button type="button" class="btn btn-success  btn-sm ">Search</button>
    </div>
    <br>
    <table class="table table-success table-striped">
        <thead>
        <tr>
            <th scope="col"></th>
            <th scope="col">Name</th>
            <th scope="col">Phone</th>
            <th scope="col">Address</th>
            <th scope="col">Sex</th>
            <th scope="col">Age</th>
            <th scope="col">Action</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Cadie Nguyen</td>
            <td>0345451538</td>
            <td>Quan Binh Thanh, TPHCM</td>
            <td>Female</td>
            <td>18</td>
            <td>
                <button type="button" class="btn btn-success  btn-sm ">Edit</button>
                <button type="button" class="btn btn-success  btn-sm">Remove</button>
            </td>

        </tr>
        <tr>
            <th scope=" row
                ">2
            </th>
            <td>Pollux Khang</td>
            <td>0896627596</td>
            <td>Quan 8 , TPHCM</td>
            <td>male</td>
            <td>30</td>
            <td>
                <button type="button" class="btn btn-success  btn-sm">Edit</button>
                <button type="button" class="btn btn-success  btn-sm">Remove</button>
            </td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Link Lansda</td>
            <td>0848260197</td>
            <td>Quan Binh Thanh, TPHCM</td>
            <td>Female</td>
            <td>3</td>
            <td>
                <button type="button" class="btn btn-success  btn-sm">Edit</button>
                <button type="button" class="btn btn-success  btn-sm ">Remove</button>
            </td>
        </tr>
        </tbody>
    </table>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>