create database `quanlybanhang` ;
use `quanlybanhang`;


create table `LOAISP`
(
MaLSP nvarchar(4) not null primary key ,
TenLSP nvarchar(30) not null ,
Ghichu nvarchar(100) not null
);
-- insert into `LOAISP` value (1 , 'IPHONE','ĐIỆN THOAI THÔNG MINH');
-- insert into `LOAISP` value (2 , 'LAPTOP/PC','MÁY TÍNH / LAPTOP THÔNG MINH');

create table `SANPHAM` 
(
MaSP nvarchar(4) not null  primary key  ,
MaLSP nvarchar(4) not null  ,
TenSP nvarchar(50)not null  ,
Donvitinh nvarchar(10)not null  ,
Ghichu nvarchar(100) 
);
-- insert into `SANPHAM` value (1 , 1 ,'IPhone 12 Mini', 1 , '128Gb');
-- insert into `SANPHAM` value (2 , 1 ,'IPhone 15 Promax', 1 , '512Gb');
-- insert into `SANPHAM` value (3 , 2 ,'IPhone 14 Pro', 1 , '1TB');
-- insert into `SANPHAM` value (4 , 2 ,'IPhone 14 Pro Max', 1 , '512GBTB');

create table `KHACHANG` 
(
MaKh nvarchar(4) not null primary key  ,
TenKH nvarchar(30)not null  ,
Diachi nvarchar(50)  ,
Ngaysimh date   ,
SoDT nvarchar(15) unique 
);
SET SQL_SAFE_UPDATES=OFF;
-- insert into `KHACHANG` value ( 1,'MChauXink' , '12AB Thanh Đa, p27, Bình Thạnh, HCM', '1997-01-26', '0848260197') ;
-- insert into `KHACHANG` value ( 2,'DKhangXau' , '1F/1D Bình Đông, p14, Q8, HCM', '1996-05-27','0896627596') ;
-- insert into `KHACHANG` value ( 3,'HSonMap' , '77 Lê Trung Nghĩa, Tân Bình, HCM', '1998-1-25','0123456789') ;
UPDATE  `KHACHANG` set SoDT = '0345451538' where TenKH = 'MChauXink'  ;
create table `NHANVIEN`
(
MaNV nvarchar(4) not null primary key  ,
Hoten nvarchar(30)not null  ,
Gioitinh enum ('Nam','Nu') not null ,
Diachi nvarchar(50)not null  ,
Ngaysinh datetime not null ,
Dienthoai nvarchar(15) not null unique , 
Email text(30) not null  ,
Noisinh nvarchar(20) ,
Ngayvaolam datetime not null ,
MaNQL nvarchar(4) not null
); 
-- insert into `NHANVIEN` value ('NV02', 'Hùnghx' , 'Nam' , ' 77 Lê Trung Nghĩa' ,'1998-12-10 12:00:00' ,' 1545454002151' , 'HungN@gmail.com' , 'Nghệ An', '2020-10-06 12:00:00',1) ;
-- insert into `NHANVIEN` value ('NV01', 'Hùnghx' , 'Nam' , ' 779 Lê Thị Nghĩa' ,'1990-1-10 12:00:00' ,' 01549846565' , 'HungH@gmail.com' , 'HCM', '2020-10-06 12:00:00',1) ;
-- delete from `NHANVIEN` where MaNV like '1' ;
create table `NHACUNGCAP` 
(
MaNCC nvarchar(5) not null primary key  ,
TenNCC nvarchar(50) not null , 
Diachi nvarchar(50) not null ,
Dienthoai nvarchar(15) not null ,
Email nvarchar(30) not null ,
Website nvarchar(30) 
);
-- insert into `NHACUNGCAP` value ('KC01', 'KC Company' , '12Ab Thanh Đa, p27 ,Bình Thạnh, HCM' , '0848260197','kc@mail.com', 'http://kc.com' );
-- insert into `NHACUNGCAP` value ('CK01', 'CK Coop' , '538 Nam Kì Khởi Nghĩa , p10 ,Phú Nhuận, HCM' , '04545489879','ck@mail.com', 'http://ck.com' );
-- delete from `NHACUNGCAP` where MaNCC like '2' ;
create table `PHIEUNHAP`
(
SoPN nvarchar(5)not null  , 
MaNV nvarchar(4) not null ,
MaNCC nvarchar(5) not null ,
Ngaynhap datetime not null default now() ,
Ghichu nvarchar(100) ,
primary key (MaNV,SoPN, MaNCC)
);
-- insert into `PHIEUNHAP` value ('PN03', 'NV02' , 'CK01' , '2023-7-11 12:00:00' , 'Đơn mua hàng');

create table `CTPHIEUNHAP`
(
MaSP nvarchar(4) not null ,
SoPN nvarchar(5) not null ,
Soluong smallint not null default 0 ,
Gianhap decimal(10,2) not null check ( Gianhap >0 ) ,
primary key (MaSP , SoPN)
);
-- insert into `CTPHIEUNHAP` value ('3' , 'PN02' , 35,  2000000 );

create table `PHIEUXUAT`
(
SoPX nvarchar(5) not null primary key  ,
MaNV nvarchar(4) not null ,
MaKH nvarchar(4) not null ,
Ngayban datetime not null ,
Ghichu text 
);
-- insert into `PHIEUXUAT` value ('PX02' , 'NV01' ,'2' ,'2023-01-15 16:00:00', 'Mua hàng');

create table `CTPHIEUXUAT`
(
SoPX nvarchar(5) not null ,
MaSP nvarchar(4) not null ,
Soluong  smallint not null check (Soluong>=0) ,
Giaban decimal(10,2) not null check (Giaban >=0 ) ,
primary key (SoPX ,MaSP )
);
-- insert into `CTPHIEUXUAT` value ('PX02', 1 , 4, 5000000);

alter table SANPHAM
ADD constraint fk_MaLSP  foreign key (MaLSP) references LOAISP (MaLSP) ;

alter table PHIEUNHAP
ADD constraint  fk_PN_MaNV foreign key (MaNV) references NHANVIEN (MaNV) ;

alter table PHIEUNHAP
ADD constraint fk_PN_MaNCC foreign key (MaNCC) references NHACUNGCAP (MaNCC) ;

alter table CTPHIEUNHAP 
ADD constraint fk_CTPN_SoPN foreign key (SoPN) references PHIEUNHAP (SoPN) ;

alter table CTPHIEUNHAP 
ADD constraint fk_CTPN_MaSP foreign key (MaSP) references SANPHAM (MaSP) ;

alter table PHIEUXUAT 
ADD constraint fk_PX_SoPX foreign key (MaKH) references KHACHANG (MaKH) ;

alter table PHIEUXUAT 
ADD constraint fk_PX_MaNV foreign key (MaNV) references NHANVIEN (MaNV) ;

alter table CTPHIEUXUAT 
ADD constraint fk_CTPX_MaKH foreign key (SoPX) references PHIEUXUAT (SoPX) ;

alter table CTPHIEUXUAT 
ADD constraint fk_CTPX_MaSP foreign key (MaSP) references SANPHAM (MaSP) ;

-- Bài 6: Dùng lệnh SELECT lấy dữ liệu từ các bảng
-- 1. Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên 
-- nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp 
-- theo tuổi.


-- 2. Liệt kê các hóa đơn nhập hàng trong tháng 6/2018, gồm thông tin số phiếu 
-- nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày
-- nhập hàng, ghi chú.


-- 3. Liệt kê tất cả sản phẩm có đơn vị tính là chai, gồm tất cả thông tin về sản 
-- phẩm.
-- 4. Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu 
-- nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá 
-- nhập, thành tiền.
-- 5. Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm 
-- thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, 
-- email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
-- 6. Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin: 
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, 
-- đơn vị tính, số lượng, giá bán, doanh thu.
-- 7. Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm 
-- tất cả thông tin của khách hàng)
-- 8. Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018 gồm các 
-- thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên 
-- sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
-- 9. Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số 
-- phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.

select * from PHIEUXUAT px join CTPHIEUXUAT ct on px.SoPX = ct.SoPX
JOIN KHACHANG kh on kh.MaKH = px.MaKH
group by CTct.SpPX

-- 10. Cho biết tổng số chai nước xả vải Comfort đã bán trong 6 tháng đầu năm 
-- 2018. Thông tin hiển thị: tổng số lượng.
-- 11.Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: 
-- tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
-- 12.Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm 
-- thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số 
-- lượng.
-- 13.Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin 
-- hiển thị gồm: tháng, doanh thu.
-- 14.Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các 
-- thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, 
-- tổng trị giá.
-- 15.Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin 
-- gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán 
-- hàng, ngày bán, trị giá.


-- 16.Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân 
-- viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số 
-- lượng.
-- 17.Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/2018, 
-- thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị 
-- tính, số lượng, đơn giá, thành tiền.
-- 18.Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018, thông tin 
-- gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính. 
-- 19.Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong 
-- quý 2/2018, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số 
-- điện thoại. 
-- 20.Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 
-- 2018. 
-- 21.Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng.
-- 22.Cho biết mã nhân viên, tên nhân viên, tên khách hàng kể cả những nhân viên 
-- không đại diện bán hàng.
-- 23.Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
-- 24.Cho biết mã nhân viên, tên nhân viên, số năm làm việc của những nhân viên 
-- có thâm niên cao nhất.
-- 25.Hãy cho biết họ tên của những nhân viên đã đến tuổi về hưu (nam:60 tuổi, 
-- nữ: 55 tuổi)
-- 26.Hãy cho biết họ tên của nhân viên và năm về hưu của họ. 
-- 27.Cho biết tiền thưởng tết dương lịch của từng nhân viên. Biết rằng - thâm 
-- niên <1 năm thưởng 200.000 - 1 năm <= thâm niên < 3 năm thưởng 
-- 400.000 - 3 năm <= thâm niên < 5 năm thưởng 600.000 - 5 năm <= thâm 
-- niên < 10 năm thưởng 800.000 - thâm niên >= 10 năm thưởng 1.000.000
-- 28.Cho biết những sản phẩm thuộc ngành hàng Hóa mỹ phẩm
-- 29.Cho biết những sản phẩm thuộc loại Quần áo.
-- 30.Cho biết số lượng sản phẩm loại Quần áo.
-- 31.Cho biết số lượng loại sản phẩm ngành hàng Hóa mỹ phẩm.
-- 32.Cho biết số lượng sản phẩm theo từng loại sản phẩm
