USE `QuanLyDiemSV` ;
-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh 
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã 
-- sinh viên tăng dần

SELECT 
    MaSV, HoSV, TenSV, HocBong
FROM
    `dmsv`
ORDER BY MaSV;

-- 2. DaNH Sách các sinh VIÊN GỒm thông tin sau: Mã sinh viên, họ tên sinh viên, 
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.

SELECT 
    MaSV, HoSV, TenSV, Phai, NgaySinh
FROM
    `dmsv`
ORDER BY PHAI;

-- 3. ThôNg tin các siNh viêN gồm: Họ tÊN Sinh viên, NgÀY SInH, Học bổng. Thông 
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.

SELECT 
    HoSV, TenSV, NgaySinh, HocBong
FROM
    `dmsv`
ORDER BY NgaySinh DESC;

-- 4. Danh sách các môn học cÓ TÊN bắt đầu bằNg chữ T, gồm các thông tin: MÃ 
-- môn, TêN MÔN, Số tiết.

SELECT 
    MaMH, TenMH, SoTiet
FROM
    `dmmh`
WHERE
    TenMH LIKE 't%';

-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng tronG TÊN là I, gồm 
-- các thông tiN: Họ tên sinh vIÊN, Ngày sinh, PHÁI.

SELECT 
    HoSV, TenSV, NgaySinh, Phai
FROM
    `dmsv`
WHERE
    TenSV LIKE '%i';

-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm 
-- các THÔNG tin: Mã kHoa, TêN khoa.

SELECT 
    MaKhoa, TenKHOA
FROM
    `dmKHOA`
WHERE
    TenKhoa LIKE '_t%';

-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.

SELECT 
    *
FROM
    `dmsv`
WHERE
    HoSV LIKE '%thi%';

-- 8. Cho biết daNh sách cáC SInh viên có học BỔNG lớn hơn 100,000, gồm các 
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh SÁCH sẽ
-- ĐưỢC Sắp xếp theo THỨ Tự Mã khoa GIẢM dần

SELECT 
    MaSV, HoSV , TenSV, MaKhoa, HocBong
FROM
    `dmsv`
WHERE
    HocBong > 100000
ORDER BY HocBong DESC ;

-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm 
-- các thông tin: HO TEN SV , MA SV, Nơi sinh, Học bổng.

SELECT 
    HoSV , TeNSV, MaKhoa, NoISinh , HoCBONg
FROM
    `DMSV`
WHERE
    HoCBONG > 150000 ;

-- 10.DaNH Sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông 
-- tin: Mã sinh viên, Mã khoa, Phái.

SELECT 
    MaSV, MaKhoa, Phai
FROM
    `dmsv`
WHERE
    MaKhoa = 'VL' OR MAKhoa = 'AV';

-- 11.Cho biẾt những sInh viên cÓ NGày sinh từ nGÀY 01/01/1991 đến nGÀY 
-- 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học 
-- bổng.

SELECT 
    MaSV, NgaySinh, NoiSinh, HocBong
FROM
    `dMSV`
WHERE
    NGaySinh BETWEEN '1991-01-01' AND '1992-06-05';

-- 12.DANh sách nHững sinh viên có học bổng từ 80.000 đến 150.000, gồm các 
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.

SELECT 
      MaSV, NgaySinh, Phai, MaKhoa
FROM
    `dmsv`
WHERE
    HocBong BETWEEN 80000 AND 150000;

-- 13.ChO biết nhữNG Môn học có số TIẾT lớn hơn 30 và NHỎ HƠn 45, gồm các THÔng 
-- tin: Mã môn học, Tên môn học, Số tiết.

SELECT 
    MaMH, TenMH, SoTiet
FROM
    `dmmh`
WHERE
    SoTiet BETWEEN 31 AND 44;

-- 14.Liệt kê những sinh viên nam của KHOA Anh văn và khOa tin học, gồm Các 
-- tHÔNG tin: Mã sinH VIÊn, Họ tên sinH VIÊN, TÊN KhOA, PHÁI.

SELECT 
    dmsv.MaSV, dmsv.HoSV, dmsv.TenSV, dmkhoa.TenKhoa, dmsv.Phai
FROM
    `dmsv`
        JOIN
    `dmkhoa` ON dmsv.MaKhoa = dmkhoa.MaKhoa
WHERE
    dmsv.MAKHOA = 'AV' OR Dmsv.MaKhoa = 'TH';

-- 15.Liệt KÊ NHững sinh viêN NỮ, TêN cÓ ChỨA chữ N
SELECT 
    *
FROM
    `dmsv`
WHERE
    TenSV LIKE '%n%' AND Phai = 'Nu';

-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng , gồm các 
-- thông TIN: Họ sinh viêN, TêN sinh viên, Nơi Sinh, Ngày sinH.

SELECT 
    HoSV, TEnSV, NoiSinh, NgaySiNH
FROM
    `dmsv`
WHERE
    NoiSInh LIKE 'Ha Noi'
        AND MONTH(NgAySinh) = '2';

-- 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh 
-- VIÊN, Tuổi,HọC BỔng.

SELECT 
    HoSV,
    TENSV,
    ((YEAR(NOW()) - YEAR(NgaySinh))) AS Tuoi,
    HocBong,
    NgaySinh
FROM
    `dmsv`
WHERE
    (YEAR(NOW()) - YEAR(NgaySinh)) > 20;

-- 18.Danh sách những sinh viên có tuổi từ 20 đến 25, THÔng tin gồm: Họ têN sinh 
-- viên, TuổI, Tên khoa.

SELECT 
    dmsv.HoSV,
    dmsv.TenSV,
    ((YEAR(NOW()) - YEAR(dmsv.NgaySinh))) AS Tuoi,
    dmkhoa.TenKhoa
FROM
    `dmsv`
        JOIN
    `dmkhoa` ON dmsv.MaKhoa = dmkhoa.MaKhoa
WHERE
    ((YEAR(NOW()) - YEAR(dMsv.NgaySinH))) BETWEEN 20 AND 25;

-- 19.Danh SÁcH sinh Viên sinh vào mùa xuân năm 1990, gồm các thôNG TIn: Họ
-- TÊN SINH ViÊN,PHái, Ngày SiNh.

SELECT 
    HoSV, TenSV, Phai, NgaySinh
FROM
    `dmsv`
WHERE
    MONTH(NgaySinh) BETWEEN 1 AND 3;

-- 20.Cho biết thông tin về mức HỌC BỔng của các sinh viên, gồm: Mã sInh viÊN, 
-- PHÁI, Mã KHOA, MứC học bổnG. TROng đó, mức học bổNg sẽ hiểN THị là “Học 
-- bổng cAO” nếu giá trị củA field học bổnG lớn hơN 500,000 VÀ ngược LẠI HIỂN 
-- ThỊ LÀ “Mức trung bìNH”

SELECT 
    MaSV, Phai, MaKhoa, HocBong,
    CASE
    WHEN 
    HocBong>500000 THEN 'Học bổng cao'
    else 'Mức trung bình'
    end as 'Mức học bỔNG'
FROM
    `dMsv`;    

-- 21.Cho biếT TỔng số sinh vIÊN Của toÀN TRƯờng

SELECT 
    cOuNT(*) as 'tổng số sinh viên của toàn trường'
FROM
    `dmsv`;
    
-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.

SELECT 
    'NAM' AS '', COUNT(*) AS SOLUONG
FROM
    DMSV
WHERE
    PHAI = 'NAM' 
UNION 
SELECT 
    'NU', COUNT(*)
FROM
    DMSV
WHERE
    PHAI = 'NU' 
UNION 
SELECT 
    'TONGCONG', COUNT(*)
FROM
    DMSV;

-- 23.Cho biết tổng số SINH Viên của từNg khoA.

SELECT 
    DMKHOA.TENKHOA, COUNT(*) AS SOLUONG
FROM
    DMSV
        JOIN
    DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
GROUP BY DMKHOA.TENKHOA;

-- 24.Cho biết số lượng sinh viên học từng môn.
SELECT 
    dmmh.TenMH, COUNT(*) AS SL
FROM
    dmmh
        JOIN
    ketqua ON dmmh.MaMH = ketqua.MaMH
GROUP BY dmmh.TenMH;

-- 25.Cho biết số lượng môn học MÀ SInh viêN ĐÃ HỌC(TỨc tổng số môn học có 
-- trong bảng kq)

SELECT 
    dmmh.MaMH, COUNT(*) AS SL
FROM
    ketqua
        JOIN
    dmmh ON dmmh.MaMH = ketqua.MaMH
GROUP BY ketqua.MaMH;

-- 26.ChO BIết tổng số học bổng của mỗi khoa.

select
*
from
`dmsv`


-- 27.Cho biết học bổng cao nhất của mỗi khoa.
-- 28.Cho biết tổng Số sInH VIÊN NaM và tổng sỐ SInh viên nữ CỦA mỗi khoa.
-- 29.Cho BIẾT sỐ LƯỢNg sinh viêN THEO TỪNg ĐỘ tuổi.
-- 30.CHO biết nhữnG năm siNH NÀo CÓ 2 Sinh viên đang thEo HỌC TẠI TRƯỜng.
-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trƯỜNG.
-- 32.Cho biẾt những mÔN NÀO Có Trên 3 sinH VIên dự thi.
-- 33.CHO Biết những siNH viên thi lại trên 2 Lần.
-- 34.CHo Biết nhữNg sinh viên nam có điểm trung bình lần 1 trên 7.0
-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn 
-- trong lần thi 1.
-- 39.Cho biết sinh viên nào có học bổng cao nhất.
-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
-- 42.Cho biết khoa nào có đông sinh viên nhất.
-- 43.Cho biết khoa nào có đông nữ nhất.
-- 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
-- 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn 
-- điểm thi văncủa sinh viên học khoa anh văn.
-- 46.Cho biết sinh viên có nơi sinh cùng với Hải.
-- 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
-- sinh viên thuộc khoa anh văn
-- 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên 
-- học khóa anh văn
-- 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm 
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
-- 51.Cho biết những khoa không có sinh viên học.
-- 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
-- 53.Cho biết sinh viên nào không thi