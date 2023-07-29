#câu 1
DELIMITER $$
CREATE FUNCTION TongDoanhThuNam1997()
RETURNS INT
AS
BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = 1997;

    RETURN `TongDoanhThu`;
END;$$
SELECT TongDoanhThuNam1997() AS TongDoanhThu1997;


#câu 2
DELIMITER $$
CREATE FUNCTION TongDoanhThuTheoNam(`Nam` INT)
RETURNS INT
BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE YEAR(DDH.NgayDH) = `Nam`;

    RETURN `TongDoanhThu`;
END;$$

SELECT TongDoanhThuTheoNam(1997) AS TongDoanhThu;

#câu 3
DELIMITER $$
CREATE FUNCTION TongThanhTienTheoMaDDH(`MaDDH` CHAR(5))
RETURNS INT
BEGIN
    DECLARE `TongThanhTien` INT;

    SELECT SUM(SoLuong * DonGia * (1 - GiamGia)) into `TongThanhTien`
    FROM ChiTietDDH CT
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE CT.MaDDH = `MaDDH`;

    RETURN `TongThanhTien`;
END;$$
SELECT TongThanhTienTheoMaDDH('ABC01') AS TongThanhTien;


#câu 4
DELIMITER $$
CREATE FUNCTION TongDoanhThuTheoMaNV(`MaNV` INT)
RETURNS INT
BEGIN
    DECLARE `TongDoanhThu` INT;

    SELECT  SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) into `TongDoanhThu`
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DDH.MaNV = `MaNV`;

    RETURN `TongDoanhThu`;
END;$$

SELECT TongDoanhThuTheoMaNV(1) AS TongDoanhThu;


#câu 5
#cau 5.1
DELIMITER $$
CREATE PROCEDURE TongDoanhThuNam1997
BEGIN
    SELECT SUM(CT.SoLuong * MH.DonGia * (1 - CT.GiamGia)) AS TongDoanhThu
    FROM DonDatHang DDH
    JOIN ChiTietDDH CT ON DDH.MaDDH = CT.MaDDH
    JOIN MatHang MH ON CT.MaMH = MH.MaMH
    WHERE DATEPART(YEAR, DDH.NgayDH) = 1997;
END;$$
EXEC TongDoanhThuNam1997;

