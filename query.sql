1. 
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang;

2.
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
WHERE DonGia >= 62;

3.
SELECT NhaCungCap.MaNCC, NhaCungCap.TenNCC, MatHang.MaMH, MatHang.TenMH, MatHang.DonViTinh, MatHang.DonGia
FROM MatHang
INNER JOIN NhaCungCap ON MatHang.MaNCC = NhaCungCap.MaNCC
WHERE NhaCungCap.MaNCC IN (4, 2);

4. 
SELECT NhaCungCap.MaNCC, NhaCungCap.TenNCC, NhaCungCap.DiaChi, MatHang.MaMH, MatHang.TenMH, MatHang.DonViTinh, MatHang.DonGia
FROM MatHang
INNER JOIN NhaCungCap ON MatHang.MaNCC = NhaCungCap.MaNCC
WHERE NhaCungCap.DiaChi LIKE '%TP.HCM%';

5.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, KhachHang.MaKH, KhachHang.TenKH, MatHang.MaMH, MatHang.TenMH, ChiTietDDH.SoLuong
FROM DonDatHang
INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
WHERE DonDatHang.NgayDH BETWEEN '1997-01-01' AND '1997-01-31';

6.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.NgayGiao, NhanVien.MaNV, CONCAT(NhanVien.HoLot, ' ', NhanVien.TenNV) AS HoTenNV
FROM DonDatHang
INNER JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE MONTH(DonDatHang.NgayDH) = 2 AND YEAR(DonDatHang.NgayDH) = 1997;

7.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.MaKH, KhachHang.TenKH, NhanVien.MaNV, CONCAT(NhanVien.HoLot, ' ', NhanVien.TenNV) AS HoTenNV
FROM DonDatHang
INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
INNER JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE DonDatHang.NgayGiao < '1997-03-01' AND NhanVien.MaNV IN (4, 5);

8.
SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
FROM NhanVien
WHERE Phai = 'M';

9.
SELECT MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNViec
FROM NhanVien
WHERE NgayNViec BETWEEN '1991-07-01' AND '1992-11-30' AND LuongCB < 300;

10.
SELECT MaNV, HoLot, TenNV, Phai, DiaChiNV
FROM NhanVien
WHERE (Phai = 'F' AND DiaChiNV LIKE '%Q1%') OR Phai = 'M';

11.
SELECT NhanVien.MaNV, NhanVien.HoLot, NhanVien.TenNV, DonVi.MaDV, DonVi.TenDV, ChamCong.Thang, ChamCong.Nam, ChamCong.NgayCong
FROM NhanVien
INNER JOIN ChamCong ON NhanVien.MaNV = ChamCong.MaNV
INNER JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
WHERE ChamCong.Thang = 1 AND ChamCong.Nam = 1999 AND ChamCong.NgayCong < 25;

12.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.NgayGiao, NhanVien.MaNV, CONCAT(NhanVien.HoLot, ' ', NhanVien.TenNV) AS HoTenNV, NhanVien.Phai
FROM DonDatHang
INNER JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE NhanVien.Phai = 'F';

13.
SELECT MaDDH, NgayDH, NgayGiao, MaKH, DATEDIFF(NgayGiao, NgayDH) AS ThoiGian
FROM DonDatHang
WHERE DATEDIFF(NgayGiao, NgayDH) <= 15;

14.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, ChiTietDDH.MaMH, MatHang.TenMH, ChiTietDDH.SoLuong, MatHang.DonGia, ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia) AS ThanhTien
FROM DonDatHang
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH;

15.
SELECT YEAR(NgayDH) AS Nam, QUARTER(NgayDH) AS Quy, NgayDH, MaDDH, MaKH, TenKH, MaNV, CONCAT(HoLot, ' ', TenNV) AS TenNV
FROM DonDatHang
INNER JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
WHERE YEAR(NgayDH) = 1997 AND QUARTER(NgayDH) = 1;

16.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, MatHang.MaMH, MatHang.TenMH
FROM DonDatHang
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
WHERE MatHang.MaMH IN (1, 3, 5, 7);

17.
SELECT MaTP, COUNT(*) AS TongsoKH
FROM KhachHang
GROUP BY MaTP;

18.
SELECT NhanVien.MaDV, DonVi.TenDV, COUNT(*) AS TongSoNV
FROM NhanVien
INNER JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
GROUP BY NhanVien.MaDV, DonVi.TenDV;

19.
SELECT YEAR(NgayDH) AS Nam, MaKH, TenKH, COUNT(*) AS TongSoDDH
FROM DonDatHang
INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
GROUP BY YEAR(NgayDH), MaKH, TenKH;

20.
SELECT YEAR(NgayDH) AS Nam, MaDDH, MaKH, NgayDH, NgayGiao, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTri
FROM DonDatHang
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
GROUP BY YEAR(NgayDH), MaDDH, MaKH, NgayDH, NgayGiao;

21.
SELECT YEAR(NgayDH) AS Nam, MaKH, TenKH, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTien
FROM DonDatHang
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
GROUP BY YEAR(NgayDH), MaKH, TenKH;

22.
SELECT Nam, MaKH, TenKH, TongTienMax
FROM (
    SELECT YEAR(NgayDH) AS Nam, MaKH, TenKH, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTienMax, 
           RANK() OVER (PARTITION BY YEAR(NgayDH) ORDER BY SUM(SoLuong * DonGia * (1 - GiamGia)) DESC) AS rk
    FROM DonDatHang
    INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    INNER JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
    WHERE YEAR(NgayDH) = 1998
    GROUP BY YEAR(NgayDH), MaKH, TenKH
) AS tongtien_rank
WHERE rk = 1;

23.
SELECT Nam, MaMH, TenMH, TongTienMax
FROM (
    SELECT YEAR(NgayDH) AS Nam, MaMH, TenMH, SUM(SoLuong * DonGia * (1 - GiamGia)) AS TongTienMax, 
           RANK() OVER (PARTITION BY YEAR(NgayDH) ORDER BY SUM(SoLuong * DonGia * (1 - GiamGia)) DESC) AS rk
    FROM DonDatHang
    INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    INNER JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE YEAR(NgayDH) = 1997
    GROUP BY YEAR(NgayDH), MaMH, TenMH
) AS tongtien_rank
WHERE rk = 1;

24.
SELECT KhachHang.MaKH, KhachHang.TenKH, KhachHang.DiaChi, 
       COUNT(DonDatHang.MaDDH) AS SoDDH, COUNT(DonDatHang.MaDDH) * 2 AS SoLichTang
FROM KhachHang
LEFT JOIN DonDatHang ON KhachHang.MaKH = DonDatHang.MaKH
GROUP BY KhachHang.MaKH, KhachHang.TenKH, KhachHang.DiaChi;

25.
SELECT NhanVien.MaDV, DonVi.TenDV, MONTH(NgayNViec) AS Thang, SUM(LuongCB) AS TongLuong
FROM NhanVien
INNER JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
WHERE YEAR(NgayNViec) = 1999
GROUP BY NhanVien.MaDV, DonVi.TenDV, MONTH(NgayNViec);

26.
SELECT MaDV, TenDV, Thang, TongLuongMax
FROM (
    SELECT NhanVien.MaDV, DonVi.TenDV, MONTH(NgayNViec) AS Thang, SUM(LuongCB) AS TongLuongMax, 
           RANK() OVER (PARTITION BY NhanVien.MaDV, DonVi.TenDV, MONTH(NgayNViec) ORDER BY SUM(LuongCB) DESC) AS rk
    FROM NhanVien
    INNER JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
    WHERE YEAR(NgayNViec) = 1999
    GROUP BY NhanVien.MaDV, DonVi.TenDV, MONTH(NgayNViec)
) AS tongluong_rank
WHERE rk = 1;

27.
CREATE TABLE LuuDDH AS
SELECT DonDatHang.MaDDH, DonDatHang.MaKH, DonDatHang.NgayDH, DonDatHang.NgayGiao, 
       ChiTietDDH.MaMH, ChiTietDDH.SoLuong, ChiTietDDH.GiamGia
FROM DonDatHang
INNER JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
WHERE YEAR(NgayDH) IN (1997, 1998, 1999);

28.
DELETE FROM LuuDDH
WHERE YEAR(NgayDH) = 1997;

29.
UPDATE LuuDDH
SET GiamGia = GiamGia + 0.02
WHERE YEAR(NgayDH) = 1999;

30.
CREATE TABLE Luong9901 AS
SELECT 1 AS Thang, 1999 AS Nam, MaNV, CONCAT(HoLot, ' ', TenNV) AS HoTen, LuongCB, NgayCong, LuongCB * NgayCong AS Luong
FROM NhanVien;

31.
UPDATE Luong9901
SET Luong = CASE 
            WHEN Phai = 'M' AND NgayCong > 20 THEN Luong * 1.1
            WHEN Phai = 'F' AND NgayCong > 20 THEN Luong * 1.2
            ELSE Luong
            END;

32.
SELECT *
FROM MatHang
WHERE MaMH NOT IN (
    SELECT DISTINCT MaMH
    FROM ChiTietDDH
    INNER JOIN DonDatHang ON ChiTietDDH.MaDDH = DonDatHang.MaDDH
    WHERE NgayDH BETWEEN '1997-05-01' AND '1998-05-01'
);