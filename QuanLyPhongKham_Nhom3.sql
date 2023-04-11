﻿USE MASTER
go
drop DATABASE if exists QUANLYPHONGKHAM_NHOM3
GO
CREATE DATABASE QUANLYPHONGKHAM_NHOM3
GO
USE QUANLYPHONGKHAM_NHOM3

CREATE TABLE KHOA (
	MaKhoa nvarchar(45) primary key not null,
	TenKhoa nvarchar(145) not null
)
GO
CREATE TABLE PHONG (
	MaPhong varchar(15)  primary key not null,
	TenPhong nvarchar(45) not null,
	GiaPhong float null,
	SoGiuong int not null,
	LoaiPhong nvarchar(45) not null
)
GO
CREATE TABLE NHANVIEN(
	MaNV nchar(15) primary key not null,
	HoTenNV nvarchar(45) not null,
	GioiTinh bit not null,
	NgaySinh date not null,
	DiaChi nvarchar(200) not null,
	Email nvarchar(45) not null,
	CMND nchar(12) not null,
	ChuyenNganh nvarchar(45) not null,
	ChucVu  nvarchar(15) not null,
	TrinhDo nvarchar(45) not null,
	HinhAnhNV varchar(15)  null,
	NgayVaoLam date not null,
	MaKhoa nvarchar(45) not null,
	SDT nchar(10) not null,
	MaPhong varchar(15) not null,
	CONSTRAINT FK_NHANVIEN_KHOA FOREIGN KEY (MaKHoa) REFERENCES KHOA (MaKhoa),
	CONSTRAINT FK_NHANVIEN_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong)

)
GO
CREATE TABLE TAIKHOAN (
	ID INT IDENTITY PRIMARY KEY,
	MaNV nchar(15)not null,
	 MatKhau nvarchar(35) not null,
	 ChucVu nvarchar(45) not null,
	 GhiNhoMK nchar(45) not null,
	 QRCode varchar(300)  null
)
ALTER TABLE TAIKHOAN
ADD 	CONSTRAINT FK_TAIKHOAN_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)
GO

GO
CREATE TABLE THUOC (
	MaThuoc nchar(15) primary key not null,
	TenThuoc nvarchar(145) not null,
	CachDung nvarchar(45) not null,
	LoaiThuoc nvarchar(45) not null,
	SoLuong int not null,
	DonVi nvarchar(20) not null,
	DonGia float not null,
	NgayNhap date not null,
	NgaySX date not null,
	HSD date not null,
	MaNV nchar(15) not null
)
ALTER TABLE THUOC
ADD CONSTRAINT FK_THUOC_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)

GO
CREATE TABLE DICHVU (
	MaDV nchar(15) primary key not null,
	TenDV nvarchar(45),
	PhiDV float not null,
	MaNV nchar(15)not null,
	TrangThaiDV nvarchar(25) not null,
)
ALTER TABLE DICHVU
ADD CONSTRAINT FK_DICHVU_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)

GO




GO
CREATE TABLE BENHNHAN (
	MaBN nchar(15) primary key not null,
	HoTenBN nvarchar(45) not null,
	GioiTinh bit not null,
	DiaChi nvarchar(145) not null,
	CCCD varchar(15) not null,
	NgaySinh date not null,
	SDTBN nchar(10) not null,
	BaoHiem nvarchar(35) not null,
	NgheNghiep nvarchar(45) not null,
	DanToc nvarchar(20) not null,
	DauHieuBenh nvarchar(65) not null,
	NgayKham date not null,
	HinhAnhBN varchar(15)  null,
	SDT nchar(10) not null,
)
--ALTER TABLE BENHNHAN
--ADD
--CONSTRAINT FK_BENHNHAN_TAIKHOAN FOREIGN KEY (SDT) REFERENCES TAIKHOAN (SDT)


GO
CREATE TABLE DANHSACHDICHVU(
	ID int IDENTITY(1,1) primary key not null,
	NgayDK date not null,
	TrangThai varchar(5) not null,
	MaDV nchar(15)  not null,
	MaBN nchar(15) not null
)
ALTER TABLE DANHSACHDICHVU
ADD
CONSTRAINT FK_DSDICHVU_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN),
CONSTRAINT FK_DSDICHVU_DICHVU FOREIGN KEY (MaDV) REFERENCES DICHVU (MaDV)


GO
CREATE TABLE HOADONTHUOC (
	MaDT nchar(15) primary key not null,
	ChuanDoan nvarchar(45) not null,
	NgayXuat date not null,
	MaBN nchar(15) not null,
	MaNV nchar(15) not null,
	CONSTRAINT FK_HOADT_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN)

)

ALTER TABLE HOADONTHUOC
ADD CONSTRAINT FK_HOADT_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)

GO
CREATE TABLE DOANHTHU (
	MaDThu nchar(15) primary key not null,
	Ngay date not null,
	TienVienPhi float not null,
)
GO

CREATE TABLE VIENPHI (
	MaVP nchar(15) primary key not null,
	GiaTien float not null,
	MaDT nchar(15)  null ,
	MaNV nchar(15) not null,
	MaBN nchar(15) not null,
	MaDThu nchar(15) null,
	CONSTRAINT  FK_VIENPHI_HDTHUOC FOREIGN KEY (MaDT) REFERENCES HOADONTHUOC (MaDT),
	CONSTRAINT  FK_VIENPHI_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN),
	CONSTRAINT  FK_VIENPHI_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
	CONSTRAINT FK_VIENPHI_DOANHTHU FOREIGN KEY (MaDThu) REFERENCES DOANHTHU(MaDThu)
)

GO 
CREATE TABLE PHIEUKHAM (
	MaPK nchar(15) primary key not null,
	NgayKham date not null,
	DauHieuBenh nvarchar(65) not null,
	GioKham varchar(20) not null,
	HoTenBN nvarchar(45) not null,
	HoTenNV nvarchar(45) not null,
	MaPhong varchar(15) not null,
	MaBN nchar(15) not null,
	MaNV nchar(15) not null
)
ALTER TABLE PHIEUKHAM	
ADD	CONSTRAINT  FK_PHIEUKHAM_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
	CONSTRAINT  FK_PHIEUKHAM_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN),
	CONSTRAINT  FK_PHIEUKHAM_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong)

GO

CREATE TABLE NHACUNGCAP (
	MaNCC nchar(15) primary key not null,
	TenNCC nvarchar(45) not null,
	SDTNCC nchar(10) not null,
	DiaChiNCC nvarchar(145) not null
)
GO

 CREATE TABLE LOAITHIETBI (
	MaLoaiTB nchar(15) primary key not null,
	SoLuong int not null,
	TenLoaiThietBi nvarchar(45) not null,
	MaNV nchar(15) not null
 )
 ALTER TABLE LOAITHIETBI
 	ADD CONSTRAINT  FK_LOAITHIETBI_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)

GO 
CREATE TABLE THIETBI (
	MaTB nchar(15) primary key not null,
	TenTB nvarchar(45) not null,
	NgayNhap date not null,
	GiaTB float not null,
	HSD date not null,
	MaPhong varchar(15)not null,
	MaNCC nchar(15) not null,
	MaLoaiTB nchar(15) not null,
	CONSTRAINT  FK_THIETBI_NCC FOREIGN KEY (MaNCC) REFERENCES NHACUNGCAP (MaNCC),
	CONSTRAINT  FK_THIETBI_LOAITHIETBI FOREIGN KEY (MaLoaiTB) REFERENCES LOAITHIETBI (MaLoaiTB)

)
ALTER TABLE THIETBI
ADD
	CONSTRAINT  FK_THIETBI_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong)


GO
CREATE TABLE CHITIEU (
	MaCT nchar(15) primary key not null,
	NguonTien float not null,
	SoTienChiRa float not null,
	Ngay date not null,
	MaNV nchar(15) not null,
	MaTB nchar(15) not null,
	CONSTRAINT  FK_CHITIEU_THIETBI FOREIGN KEY (MaTB) REFERENCES THIETBI (MaTB),

)
 ALTER TABLE CHITIEU
 ADD CONSTRAINT  FK_CHITIEU_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV)

GO

CREATE TABLE LICHKHAM (
	MaLichKham nchar(15)primary key not null,
	LichHen date not null,
	HoTen nvarchar(45) null,
	Tuoi int not null,
	GioiTinh bit not null,
	SDT varchar(10) not null,
	LyDoKham nvarchar(45) null,
	LoaiHen nvarchar(45) not null,
	GhiChu nvarchar(145) null,
	TinhTrang nvarchar(45) null,
	MaNV nchar(15) not null,
	MaBN nchar(15)  null,
)
ALTER TABLE LICHKHAM 
ADD
	CONSTRAINT  FK_LICHKHAM_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
	CONSTRAINT  FK_LICHKHAM_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN)

GO

CREATE TABLE BENHAN  (
	MaBA nchar(15) not null primary key,
	HoTenBN nvarchar(45) not null,
	HoTenNV nvarchar(45) not null,
	NgayKham date not null,	
	DauHieuBenh nvarchar(65) not null,
	XetNghiem nvarchar(65)  null ,
	ChuanDoan nvarchar(65) not null ,
	GhiChu nvarchar(100) null,
	MaNV nchar(15)  null,
	MaBN nchar(15)  null,
	MaVP nchar(15)  null,
	MaLichKham nchar(15) null,	
	MaDT nchar(15)  null,
	MaPhong varchar(15) null	
)

ALTER TABLE BENHAN
ADD
	CONSTRAINT  FK_BENHAN_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
	CONSTRAINT  FK_BENHAN_BENHNHAN FOREIGN KEY (MaBN) REFERENCES BENHNHAN (MaBN),
	CONSTRAINT  FK_BENHAN_PHONG FOREIGN KEY (MaPhong) REFERENCES PHONG (MaPhong),
	CONSTRAINT  FK_BENHAN_LICHKHAM FOREIGN KEY (MaLichKham) REFERENCES LICHKHAM (MaLichKham),
	CONSTRAINT  FK_BENHAN_HOADONTHUOC FOREIGN KEY (MaDT) REFERENCES HOADONTHUOC (MaDT),
	CONSTRAINT  FK_BENHAN_VIENPHI FOREIGN KEY (MaVP) REFERENCES VIENPHI (MaVP)
GO
CREATE TABLE HOADONCHITIET (
	MaHDCT varchar(15) primary key not null,
	SoLuong int not null,
	LieuDung nvarchar(65) not null,
	MaThuoc nchar(15) not null,
	MaDT nchar(15) not null,
	CONSTRAINT  FK_HDCT_HDT FOREIGN KEY (MaDT) REFERENCES HOADONTHUOC (MaDT),
	CONSTRAINT  FK_HDCT_THUOC FOREIGN KEY (MaThuoc) REFERENCES THUOC (MaThuoc)

)




INSERT INTO KHOA VALUES
('K1',N'Khoa Nội'),
('K2',N'Khoa Ngoại'),
('K3',N'Khoa Phụ Sản'),
('K4',N'Khoa Nhi'),
('K5',N'Khoa truyền nhiễm'),
('K6',N'Khoa Chuẩn đoán hình ảnh'),
('K7',N'Khoa Xét nghiệm'),
('K8',N'Khoa Nội soi'),
('K9',N'Khoa Dược'),
('K10',N'Khoa Dinh dưỡng')

INSERT INTO PHONG VALUES
('P001',N'Phòng tiếp nhận bênh nhân',NULL,7,N'Tiêu chuẩn'),
('P002',N'Phòng tiếp nhận bênh nhân',NULL,3,N'VIP'),
('P003',N'Phòng cấp cứu',500000.00,2,N'VIP'),
('P004',N'Phòng mổ',700000.00,2,N'Tiêu chuẩn'),
('P005',N'Phòng mổ',1500000.00,2,N'VIP'),
('P006',N'Phòng tiếp nhận bênh nhân',NULL,7,N'Tiêu chuẩn'),
('P007',N'Phòng hồi sức',1000000.00,10,N'Phòng tiện ích Siêu nhân'),
('P008',N'Phòng hồi sức',300000.00,10,N'Tiêu chuẩn'),
('P009',N'Phòng phẫu thuật',700000.00,2,N'Tiêu chuẩn'),
('P010',N'Phòng phẫu thuật',1500000.00,2,N'VIP'),
('P011',N'Phòng khoa phụ sản',300000.00,6,N'Thường'),
('P012',N'Phòng chuyên khoa nội',150000.00,7,N'Thường'),
('P013',N'Phòng chuyên khoa nội',300000.00,3,N'VIP'),
('P014',N'Phòng chuyên khoa nội',300000.00,3,N'VIP'),
('P015',N'Phòng khám dinh dưỡng',100000.00,12,N'Thường'),
('P016',N'Phòng khám dinh dưỡng',200000.00,3,N'VIP'),
('P017',N'Phòng khám dinh dưỡng',200000.00,3,N'VIP'),
('P018',N'Phòng khám dinh dưỡng',200000.00,3,N'VIP'),
('P019',N'Khoa ngoại',150000.00,10,N'Thường'),
('P020',N'Khoa ngoại',300000.00,3,N'VIP'),
('P021',N'Khoa ngoại',300000.00,2,N'VIP'),
('P022',N'Khoa Nội soi',200000.00,12,N'Thường'),
('P023',N'Khoa Nội soi',350000.00,3,N'VIP'),
('P024',N'Khoa Nội soi',350000.00,3,N'VIP'),
('P025',N'Khoa Dược',100000.00,7,N'Tiêu chuẩn'),
('P026',N'Khoa Dược',200000.00,2,N'VIP'),
('P027',N'Khoa Nhi',300000.00,9,N'Thường'),
('P028',N'Khoa Nhi',400000.00,2,N'VIP'),
('P029',N'Phòng khám bệnh truyền nhiễm',100000.00,9,N'Tiêu chuẩn'),
('P030',N'Phòng khám bệnh truyền nhiễm',200000.00,2,N'VIP'),
('P031',N'Phòng Chuẩn đoán hình ảnh',200000.00,9,N'Thường'),
('P032',N'Phòng xét nghiệm',300000.00,12,N'Thường'),
('P033',N'Phòng xét nghiệm',450000.00,3,N'VIP')
select*from PHONG

INSERT INTO NHANVIEN VALUES
('yta01',N'Phạm Quang Huy',1,'1998-03-01',N'Đường Giải Phóng, Phường Tân Lợi, Thành phố Buôn Ma Thuật, Đắk LắK',N'huy98@gmail.com','064123248734',N'Khoa Nhi',N'Y tá',N'Đại học','ythuy.png','2020-12-03','K4','0909331232','P028'), 
('bsi05',N'Nguyễn Văn Hà',1,'1998-01-09',N'Xuân Phong, Xã Hợp Phong, Huyện Cao Phong, Hòa Bình',N'nguyenha12@gmail.com','053091038491',N'Khoa Nhi',N'Bác sĩ',N'Đại học','bsha.png','2020-03-12','K4','0904071234','P028'),
('bsi02',N'Chu Văn Thái Sơn',1,'1978-12-12',N'Văn Nhuệ, Ân Thi - Hưng Yên',N'thaison12@gmail.com','084357821234',N'Khoa Nội',N'Bác sĩ',N'Đại học','bsson.png','2018-01-09','K1','0908765437','P012'),
('yta11',N'Lê Thị Quỳnh Nhi',0,'1987-02-18',N'Phường 24, Quận Bình Thạnh, TP.HCM',N'quynhnhi@gmail.com','093647346747',N'Khoa Nội',N'Y tá',N'Cao đẳng','ytnhi.png','2020-03-12','K1','0355204677','P012'),
('bsi03',N'Hoàng Trung Hiếu',1,'1978-12-12',N'Xã Đức Hòa Đông, Huyện Đức Hòa,Long An',N'trunghieu02@gmail.com','077523901123',N'Khoa Nội soi',N'Bác sĩ',N'Cử nhân khoa học y tế','bshieu.png','2019-12-03','K8','0932012782','P022'),
('yta12',N'Nguyễn Phạm Mai Quỳnh',0,'1999-03-12',N'885 Trường Chinh, P.Tây Thạnh, Q.Tân Phú',N'maiquynh@gmail.com','064125367562',N'Khoa Nội soi',N'Y tá',N'Đại học','ytquynh.png','2018-03-18','K8','0923674674','P022'),
('bsi04',N'Lê Văn Quân',1,'1968-10-03',N'Vàm Bi, Xã Trường Long, Huyện Phong Điền, Cần Thơ',N'lequan12@gmail.com','064127437289',N'Khoa Dược',N'Bác sĩ',N'Đại học','bsquan.png','2020-03-12','K9','0977128239','P025'),
('yta07',N'Trần Anh Lực',1,'1977-02-07',N'Phường Phước Ninh, Quận Hải Châu',N'tranluc02@gmail.com','026423784726',N'Khoa Dược',N'Y tá',N'Đại học','ytluc.png','2020-07-12','K9','0905731835','P025'),
('yta06',N'Nguyễn Thị Thu Hiền',0,'2001-01-09',N'43 đường  Nguyễn Chí Diểu, Phường An Hải Bắc, Quận Sơn Trà, Đà Nẵng',N'thuhien02@gmail.com','091023462374',N'Khoa xét nghiệm',N'Y tá',N'Cao Đẳng','ythien.png','2019-07-19','K7','0977108583','P033'),
('bsi08',N'Ngô Ngọc Huy',1,'1998-01-09',N'Phường Thạc Gián, Quận Thanh Khê, Đà nẵng',N'ngochuy3@gmail.com','012734623746',N'Khoa xét nghiệm',N'Bác sĩ',N'Đại học','bshuy.png','2020-12-23','K7','0346790933','P033'),
('bsi09',N'Nguyễn Thị Minh Tâm',0,'1973-03-12',N'74 Lý Tế Xuyên, Linh Đông,Thủ Đức',N'minhtam@gmail.com','064126346736',N'Khoa Phụ sản',N'Bác sĩ',N'Đại học','bstam.png','2018-01-17','K3','0926347894','P011'),
('yta10',N'Nguyễn Thị Hồng',0,'1978-01-02',N'Phường 10, Quận Gò Vấp, Tp.HCM',N'hong@gmail.com','084378467432',N'Khoa Phụ sản',N'Y tá',N'Đại học','ythong.png','2020-02-11','K3','0356488345','P011'),
('bsi13',N'Nguyễn Hồng Hội',1,'1988-03-09',N'Bùi Đinh Túy, P21, Q.Bình Thạnh',N'honghoi@gmail.com','028367461783',N'Khoa Ngoại',N'Bác sĩ',N'Đại học','bshoi.png','2019-03-12','K2','0783745628','P021'),
('yta14',N'Lý Thị Hồng Vân',0,'1998-01-09',N'940 Lạc Long Quân, Phường 8, Tân Bình',N'hongvan@gmail.com','053091038491',N'Khoa Ngoại',N'Y tá',N'Đại học','ytvan.png','2017-07-12','K2','0364782356','P021'),
('bsi15',N'Nguyễn Thị Tuyết Nhi',0,'1999-07-23',N'Đường Phú Nhuận, Quận 7',N'tuyetnnhi@gmail.com','074674675789',N'Khoa Truyền Nhiễm',N'Bác sĩ',N'Đại học','bstuyetnhi.png','2020-03-12','K5','0784673674','P030'),
('yta16',N'Trần Thị Thu Hiền',0,'1987-08-12',N'Phường long Thạnh, Thị xã Tân Châu, An Giang',N'thuhien02@gmail.com','064236748934',N'Khoa Truyền Nhiễm',N'Y tá',N'Đại học','ytthuhien.png','2015-10-01','K5','0374567239','P030'),
('bsi17',N'Bùi Công Tháp',1,'2001-03-22',N'Phường Kim Liên',N'congthap@gmail.com','0678956453',N'Khoa xét nghiệm',N'Bác sĩ',N'Cao Đẳng','bsthap.png','2021-01-27','K7','0456734334','P032'),
('bsi18',N'Phạm Công Nguyên',1,'1975-07-30',N'Phường Tân Phong, Quân 7',N'congnguyen@gmail.com','093456797812',N'Khoa Dinh Dưỡng',N'Bác sĩ',N'Tiến sĩ y khoa','bsnguyen.png','2020-03-12','K10','0983678400','P017'),
('yta19',N'Đinh Thị Nga',0,'1999-06-12',N'Phường 10,Quận 11, Tp.HCM',N'nga@gmail.com','046736456789',N'Khoa Dinh dưỡng',N'Y tá',N'Đại học','ytnga.png','2020-03-12','K10','0978256378','P017'),
('bsi20',N'Đinh Thị Thùy Dương',0,'1999-06-25',N'Phường Dịch Vọng, Quận Cầu Giấy',N'thuyduong05@gmail.com','034782356378',N'Khoa Chuẩn đoán hình ảnh',N'Bác sĩ',N'Cử nhân','bsduong.png','2020-03-12','K6','0937846746','P031'),
('yta21',N'Ngô Thị Điểm',0,'1968-06-12',N'Đường Huỳnh Tấn Phát, Phường Bình Thuận Quận 7, TP.HCM',N'diem06@gmail.com','096797834673',N'Khoa Chuẩn đoán hình ảnh',N'Y tá',N'Đại học','ytdiem.png','2020-03-12','K6','0346783712','P031')
select * from NHANVIEN

INSERT INTO NHANVIEN VALUES
('bsi',N'Phạm Quang Huy',1,'1998-03-01',N'Đường Giải Phóng, Phường Tân Lợi, Thành phố Buôn Ma Thuật, Đắk LắK',N'huy98@gmail.com','064123248734',N'Khoa Nhi',N'Y tá',N'Đại học','ythuy.png','2020-12-03','K4','0909331232','P028') 

INSERT INTO TAIKHOAN VALUES 

('yta01','yta001',N'Y tá','Yes',''),
('bsi08','bsi008',N'Bác sĩ','Yes',''),
('bsi02','bsi002',N'Bác sĩ','Yes',''),
('bsi03','bsi003',N'Bác sĩ','No',''),
('bsi04','bsi004',N'Bác sĩ','No',''),
('yta12','yta012',N'Y tá','Yes',''),
('yta11','yta003',N'Y tá','No',''),
('bsi05','bsi005',N'Bác sĩ','Yes',''),
('bsi17','bsi017',N'Bác sĩ','No',''),
('yta12','yta021',N'Y tá','Yes',''),
('yta21','yta005',N'Y tá','No',''),
('yta06','yta006',N'Y tá','No',''),
('bsi20','bsi007',N'Bác sĩ','No',''),
('yta07','yta007',N'Y tá','Yes',''),
('bsi08','bsi008',N'Bác sĩ','No',''),
('yta16','yta016',N'Y tá','No',''),
('bsi09','bsi009',N'Bác sĩ','Yes',''),
('bsi13','bsi013',N'Bác sĩ','No',''),
('yta10','yta009',N'Y tá','Yes',''),
('bsi20','bsi020',N'Bác sĩ','No',''),
('yta19','yta019',N'Y tá','No','')

--INSERT INTO TAIKHOAN VALUES 
--('yta22','bql001',N'Ban quản lý','Yes','')


INSERT INTO THUOC VALUES
('TH001',N'Amoxcillin',N'Uống',N'Nhóm thuốc kháng sinh',860,N'Hộp',120.000,'2021-11-28','2021-02-17','2023-12-27','yta21'),
('TH002',N'Aspirin',N'Uống',N'Nhóm thuốc kháng viêm',678,N'Hộp',180.000,'2021-10-12','2020-08-15','2024-11-01','yta19'),
('TH003',N'Ampicillin',N'Uống',N'Nhóm thuốc kháng sinh',540,N'Vỉ',14.000,'2020-06-03','2020-01-17','2023-09-13','yta14'),
('TH004',N'Clopheniramin',N'Uống',N'Kháng histamin',456,N'Hộp',30.000,'2021-06-03','2021-04-23','2024-10-09','yta10'),
('TH005',N'Paracetamol',N'Uống',N'Giảm đau hạ sốt',1234,N'Hộp',38.000,'2020-12-23','2019-11-12','2022-12-30','yta06'),
('TH006',N'Men vi sinh',N'Uống',N'Nhóm tiêu hóa',564,N'Hộp',500.000,'2021-08-03','2020-10-23','2023-09-30','yta07'),
('TH007',N'Aciclovir',N'Uống',N'Kháng virus',346,N'Tuýp',17.000,'2021-05-02','2020-12-12','2023-03-16','yta12'),
('TH008',N'Hidrasec',N'Uống',N'Nhóm trị tiêu chảy',780,N'Hộp',85.000,'2020-04-15','2019-10-28','2023-02-27','yta11'),
('TH009',N'Smecta',N'Uống',N'Nhóm trị tiêu chảy',235,N'Hộp',114.000,'2021-05-02','2020-07-12','2023-08-16','yta11'),
('TH010',N'Aciclovir',N'Uống',N'Nhóm giảm co thắt',255,N'Hộp',75.000,'2021-11-09','2020-09-13','2023-05-16','yta01'),
('TH011',N'Nước mắt nhân tạo Systane',N'Uống',N'Nhóm thuốc nhỏ mắt',150,N'Hộp',74.000,'2021-03-12','2020-06-20','2023-02-12','yta19'),
('TH012',N'Nacl 0,9%',N'nhỏ mắt',N'Nhóm thuốc nhỏ mắt',429,N'Hộp',11.806,'2020-10-11','2019-06-30','2022-12-28','yta21'),
('TH013',N'Darktarin',N'Bôi',N'Nhóm thuốc bôi lỡ miệng',385,N'Tuýp',55.000,'2020-09-12','2019-12-03','2023-09-27','yta14'),
('TH014',N'Mouthpast',N'Bôi',N'Nhóm thuốc bôi lỡ miệng',129,N'Hộp',33.000,'2021-02-23','2020-11-09','2023-10-13','yta19'),
('TH015',N'Salonpas',N'Dán',N'Nhóm dán – bôi giảm đau',398,N'Hộp',22.000,'2021-05-17','2020-06-04','2023-04-24','yta21'),
('TH016',N'Dạ hương',N'Rửa',N'Nhóm nước rửa phụ khoa',250,N'Hộp',38.000,'2020-04-29','2020-05-25','2023-01-18','yta12'),
('TH017',N'Lactacyd',N'Rửa',N'Nhóm nước rửa phụ khoa',398,N'Hộp',68.000,'2021-08-19','2020-08-09','2023-12-09','yta06'),
('TH018',N'Dán con cọp',N'Dán',N'Nhóm dán – bôi giảm đau',108,N'Hộp',47.000,'2021-07-23','2020-11-12','2023-08-23','yta07'),
('TH019',N'Biotin Collagen 30',N'Dán',N'Nhóm thực phẩm chức năng',450,N'Hộp',270.000,'2021-02-27','2019-11-25','2023-05-24','yta10'),
('TH020',N'Omega 3 Fish Oil – Softgels',N'Dán',N'Nhóm thực phẩm chức năng',569,N'Hộp',768.000,'2021-09-12','2020-09-08','2023-12-28','yta14')




INSERT INTO DICHVU VALUES
('DV01',N'Xét nghiệm máu',1500000.00,'yta07',N'đang hoạt động'),
('DV02',N'Xét nghiệm tế bào màu ngoại vi',1500000.00,'yta07',N'đang hoạt động'),
('DV03',N'Chup XQuang',350000.00,'yta07',N'đang hoạt động'),
('DV04',N'Siêu âm thai',500000.00,'yta07',N'đang hoạt động'),
('DV05',N'Siêu âm tử cung',620000.00,'yta07',N'đang hoạt động'),
('DV06',N'Siêu âm tuyến giáp',650000.00,'yta07',N'đang hoạt động'),
('DV07',N'Siêu âm ổ bụng',700000.00,'yta07',N'đang hoạt động'),
('DV08',N'Tư vấn dinh dưỡng',200000.00,'yta07',N'đang hoạt động'),
('DV09',N'Truyền nước, vitamin',250000.00,'yta07',N'đang hoạt động'),
('DV10',N'Thuê xe lăn',100.000,'yta07',N'đang hoạt động'),
('DV11',N'Băng bột',150000.00,'yta07',N'đang hoạt động'),
('DV12',N'Xét tổng phân tích nước tiểu',250000.00,'yta07',N'đang hoạt động'),
('DV13',N'Tiêm thuốc',350000.00,'yta07',N'đang hoạt động'),
('DV14',N'Nắn khớp, chỉnh hình',120000.00,'yta07',N'đang hoạt động')
INSERT INTO DICHVU VALUES
('DV47',N'Chụp Xquang Blondeau',300000.0,'yta07',N'đang hoạt động')
select * from DICHVU
--INSERT INTO BENHNHAN VALUES
--('BN01',N'Lương Thị Huế',0,N'Chưprông - Gia Lai','0465731274',N'Có',N'Sinh viên',N'Tày',N'Đau bụng phải','hue.png','0932012782'),
--('BN02',N'Mạc Vương Phi',0,N'Quận 7 - TP.HCM','0936456345',N'Có',N'Sinh viên',N'Kinh',N'Lên hạch sau tai','phi.png','0346790933'),
--('BN03',N'Trần Thị Hoa',0,N'Tân Chánh Hiệp,Quận 12,TP.HCM','0571208382',N'Không',N'Công nhân',N'Mường',N'Trật khớp vai','','0937846746'),
--('BN04',N'Phạm Xuân Trường',1,N'Trung Mỹ Tây,Quận 12,TP.HCM','0523431243',N'Có',N'Công nhân',N'Kinh',N'Đau bụng kéo dài,chán ăn','truong.png','0932012782'),
--('BN05',N'Lê Thị Ánh Giao',0,N'Bình Tân-Hồ Chí Minh','0919288187',N'Có',N'Giáo viên',N'H-Mông',N'Khám thai định kì','','0926347894'),
--('BN06',N'Nguyễn Thị Ngọc Lan',0,N'Phường 10,Quận 11, Tp.HCM','0465310980',N'Không',N'Nông dân',N'Kinh',N'Suy nhược cơ thể','lan.png','0983678400'),
--('BN07',N'Đặng Thị Tuyết Dư',0,N'Phường Bình Thuận Quận 7, TP.HCM','0989712903',N'Có',N'Thợ may',N'Kinh',N'Đau đầu kéo dài, sốt','du.png','0937846746'),
--('BN08',N'Huỳnh Minh Khai',1,N'Cầu Săn máu, Biên Hòa','0933441989',N'Có',N'Ca sĩ',N'Kinh',N'Đau hai bên thái dương','khai.png','0977128239'),
--('BN09',N'Đoàn Thị Hồng Hạnh',0,N'Cao Bằng','0981128436',N'Có',N'Còn nhỏ',N'Kinh',N'Nhiệt miệng','hanh.png','0904071234'),
--('BN10',N'Nguyễn Thị Mơ',0,N'Bình Phước','0123426749',N'Không',N'Buôn bán',N'Kinh',N'Khám phụ khoa','','0977128239'),
--('BN11',N'Hoàng Hải Yến',0,N'Phường 10, Quận Gò Vấp, Tp.HCM','0439128458',N'Có',N'Kỹ sư',N'Dao',N'Tiêu chảy','yen.png','0908765437'),
--('BN12',N'Trương Văn Hải',1,N' Thị xã Tân Châu, An Giang','0398472128',N'Có',N'Nông dân',N'Kinh',N'Đau mắt','','0908765437'),
--('BN13',N'Ngô Thị Chung',0,N'Ân Thi - Hưng Yên','0989687122',N'CKhông',N'Nông dân',N'Kinh',N'Dấu hiệu bệnh quai bị','','0784673674'),
--('BN14',N'Hoàng Tiến Dũng',1,N'Cầu Giấy - Hà Nội','0912098763',N'Có',N'Cầu Thủ',N'Kinh',N'Gãy chân','','0937846746'),
--('BN15',N'Vàng A Tánh',1,N'Sơn La','0109374672',N'Có',N'nông dân',N'Mường',N'Mẩn đỏ, ngứa','','0784673674'),
--('BN16',N'Trần Xuân Trường',1,N'An Giang','0120194672',N'Không',N'Buôn',N'Kinh',N'Khó nuốt, ,ợ chua','','0932012782'),
--('BN17',N'Vũ Duy Quý',1,N'Long An','0856236734',N'Có',N'Grap',N'Kinh',N'Bất thường ở dưới niêm mạc','quy.png','0932012782'),
--('BN18',N'Lê Xuân Thành',1,N'Bà rịa-Vũng Tàu, Biên','0919847563',N'Có',N'Khảo cổ',N'Kinh',N'Ho thắt','','0983678400'),
--('BN19',N'Đào Tiến Đạt',1,N'Sóc Trăng','0374129847',N'Có',N'Tester',N'Kinh',N'Biếng ăn, ăn không ngon','','0983678400'),
--('BN20',N'Nguyễn Tiến Phát',1,N'Iaga-Gia Lai','0812098374',N'Có',N'Nhà báo',N'Kinh',N'Đau bụng dữ dội, đột ngột','','0784673674')


INSERT INTO BENHNHAN VALUES
('BN01',N'Lương Thị Huế',0,N'Chưprông - Gia Lai','027812342318','2003-09-28','0465731274',N'Có',N'Sinh viên',N'Tày',N'Đau bụng phải','2021-09-12','hue.png','0932012782'),
('BN898',N'Lương Thị Huế',0,N'Chưprông - Gia Lai','027812342318','2003-09-28','0465731274',N'Có',N'Sinh viên',N'Tày',N'Đau bụng phải','2021-09-12','hue.png','0932012782'),
('BN02',N'Mạc Vương Phi',0,N'Quận 7 - TP.HCM','098787567342','2002-01-09','0936456345',N'Có',N'Sinh viên',N'Kinh',N'Lên hạch sau tai','2022-09-11','phi.png','0346790933'),
('BN03',N'Trần Thị Hoa',0,N'Tân Chánh Hiệp,Quận 12,TP.HCM','064321289045','1998-03-12','0571208382',N'Không',N'Công nhân',N'Mường',N'Trật khớp vai','2022-03-21','hoa.png','0937846746'),
('BN04',N'Phạm Xuân Trường',1,N'Trung Mỹ Tây,Quận 12,TP.HCM','098321267856','1982-02-03','0523431243',N'Có',N'Công nhân',N'Kinh',N'Đau bụng kéo dài,chán ăn','2021-04-20','truong.png','0932012782'),
('BN05',N'Lê Thị Ánh Giao',0,N'Bình Tân-Hồ Chí Minh','045789567675','1979-09-09','0919288187',N'Có',N'Giáo viên',N'H-Mông',N'Khám thai định kì','2020-02-19','giao.png','0926347894'),
('BN06',N'Nguyễn Thị Ngọc Lan',0,N'Phường 10,Quận 11, Tp.HCM','089234674567','1977-07-02','0465310980',N'Không',N'Nông dân',N'Kinh',N'Suy nhược cơ thể','2022-04-19','lan.png','0983678400'),
('BN07',N'Đặng Thị Tuyết Dư',0,N'Phường Bình Thuận Quận 7, TP.HCM','045345789654','1985-04-05','0989712903',N'Có',N'Thợ may',N'Kinh',N'Đau đầu kéo dài, sốt','2021-05-26','du.png','0937846746'),
('BN08',N'Huỳnh Minh Khai',1,N'Cầu Săn máu, Biên Hòa','043427654538','1999-12-03','0933441989',N'Có',N'Ca sĩ',N'Kinh',N'Đau hai bên thái dương','2021-06-12','khai.png','0977128239'),
('BN09',N'Đoàn Thị Hồng Hạnh',0,N'Cao Bằng','045367125234','2019-02-18','0981128436',N'Có',N'Còn nhỏ',N'Kinh',N'Nhiệt miệng','2022-01-09','hanh.png','0904071234'),
('BN10',N'Nguyễn Thị Mơ',0,N'Bình Phước','067859293456','1974-11-03','0123426749',N'Không',N'Buôn bán',N'Kinh',N'Khám phụ khoa','2022-09-15','mo.png','0977128239'),
('BN11',N'Hoàng Hải Yến',0,N'Phường 10, Quận Gò Vấp, Tp.HCM','063412348790','1998-03-23','0439128458',N'Có',N'Kỹ sư',N'Dao',N'Tiêu chảy','2022-05-29','yen.png','0908765437'),
('BN12',N'Trương Văn Hải',1,N' Thị xã Tân Châu, An Giang','045634095678','1967-12-09','0398472128',N'Có',N'Nông dân',N'Kinh',N'Đau mắt','2022-01-28','hai.png','0908765437'),
('BN13',N'Ngô Thị Chung',0,N'Ân Thi - Hưng Yên','034512891205','1986-12-04','0989687122',N'CKhông',N'Nông dân',N'Kinh',N'Dấu hiệu bệnh quai bị','2022-03-28','chung.png','0784673674'),
('BN14',N'Hoàng Tiến Dũng',1,N'Cầu Giấy - Hà Nội','054365792456','1997-03-29','0912098763',N'Có',N'Cầu Thủ',N'Kinh',N'Gãy chân','2022-06-12','dung.png','0937846746'),
('BN15',N'Vàng A Tánh',1,N'Sơn La','067534127856','1978-09-12','0109374672',N'Có',N'nông dân',N'Mường',N'Mẩn đỏ, ngứa','2021-9-12','','0784673674'),
('BN16',N'Trần Xuân Trường',1,N'An Giang','065673925912','1972-12-24','0120194672',N'Không',N'Buôn',N'Kinh',N'Khó nuốt, ,ợ chua','2022-4-25','truong.png','0932012782'),
('BN17',N'Vũ Duy Quý',1,N'Long An','023719045923','2001-12-28','0856236734',N'Có',N'Grap',N'Kinh',N'Bất thường ở dưới niêm mạc','2021-06-12','quy.png','0932012782'),
('BN18',N'Lê Xuân Thành',1,N'Bà rịa-Vũng Tàu, Biên','076120358717','1978-12-04','0919847563',N'Có',N'Khảo cổ',N'Kinh',N'Ho thắt','2021-12-13','thanh','0983678400'),
('BN19',N'Đào Tiến Đạt',1,N'Sóc Trăng','083421874523','1999-09-19','0374129847',N'Có',N'Tester',N'Kinh',N'Biếng ăn, ăn không ngon','2021-05-25','dat.png','0983678400'),
('BN20',N'Nguyễn Tiến Phát',1,N'Iaga-Gia Lai','091239453869','1986-03-14','0812098374',N'Có',N'Nhà báo',N'Kinh',N'Đau bụng dữ dội, đột ngột','2021-06-12','','0784673674')


SET IDENTITY_INSERT DANHSACHDICHVU OFF

INSERT INTO DANHSACHDICHVU VALUES
('2022-09-11',N'Yes','DV01','BN02'),
('2022-03-21',N'Yes','DV03','BN03'),
('2020-02-19',N'No','DV04','BN05'),
('2021-06-12',N'Yes','DV03','BN17'),
('2022-06-12',N'No','DV10','BN14'),
('2021-04-20',N'No','DV08','BN04'),
('2022-06-12',N'Yes','DV11','BN14'),
('2020-02-19',N'Yes','DV05','BN10'),
('2021-05-25',N'No','DV08','BN19'),
('2021-05-26',N'Yes','DV09','BN07'),
('2022-05-29',N'Yes','DV09','BN11')

SET IDENTITY_INSERT DANHSACHDICHVU ON 

INSERT INTO HOADONTHUOC VALUES
('DT01',N'Suy giảm miễn dịch','2021-09-12','BN01','bsi03'),
('DT02',N'Bệnh cúm','2021-05-26','BN07','bsi08'),
('DT03',N'Trật khớp vai','2022-03-21','BN03','bsi20'),
('DT04',N'Rối loạn miễn dịch','2021-04-20','BN02','bsi08'),
('DT05',N'Suy dinh dưỡng thai nhi','2021-07-09','BN04','bsi03'),
('DT06',N'Sốt xuất huyết','2020-02-19','BN05','bsi09'),
('DT07',N'Suy giảm miễn dịch','2021-07-09','BN06','bsi18'),
('DT08',N'Stress','2021-06-12','BN08','bsi04'),
('DT09',N'Nhiệt miệng','2022-01-09','BN09','bsi05'),
('DT10',N'Viêm phụ khoa','2022-09-15','BN10','bsi04'),
('DT11',N'Tiêu chảy cấp','2022-05-29','BN11','bsi02'),
('DT12',N'Đau mắt đỏ','2022-01-28','BN12','bsi02'),
('DT13',N'Quai bị','2022-03-28','BN13','bsi15'),
('DT14',N'Gãy xương chân','2022-06-12','BN14','bsi20'),
('DT15',N'Dị ứng hải sản','2021-9-12','BN15','bsi15'),
('DT16',N'Trào ngược dạ dày','2021-07-09','BN16','bsi04'),
('DT17',N'U dưới niêm','2021-06-12','BN17','bsi03'),
('DT18',N'Hen suyễn','2021-12-13','BN18','bsi18'),
('DT19',N'Rối loạn tiêu hóa','2021-05-25','BN19','bsi18'),
('DT20',N'Co thắt đại tràng','2021-06-12','BN20','bsi15')

INSERT INTO VIENPHI VALUES 
('VP01',1000000.00,'DT01','yta19','BN01',NULL),
('VP02',4500000.00,'DT02','yta19','BN07',NULL),
('VP03',700000.00,'DT03','yta19','BN03',NULL),
('VP04',550000.00,'DT04','yta19','BN02',NULL),
('VP05',1550000.00,'DT05','yta19','BN04',NULL),
('VP06',600000.00,'DT06','yta19','BN05',NULL),
('VP07',820000.00,'DT07','yta19','BN06',NULL),
('VP08',370000.00,'DT08','yta19','BN08',NULL),
('VP09',4550000.00,'DT09','yta19','BN09',NULL),
('VP10',300000.00,'DT11','yta19','BN11',NULL),
('VP11',550000.00,'DT12','yta19','BN12',NULL),
('VP12',120000.00,'DT13','yta19','BN13',NULL),
('VP13',800000.00,'DT14','yta19','BN14',NULL),
('VP14',450000.00,'DT15','yta19','BN15',NULL),
('VP15',2300000.00,'DT16','yta19','BN16',NULL),
('VP16',700000.00,'DT17','yta19','BN17',NULL),
('VP17',950000.00,'DT18','yta19','BN18',NULL),
('VP18',1000000.00,'DT19','yta19','BN19',NULL),
('VP19',1800000.00,'DT20','yta19','BN20',NULL)


INSERT INTO PHIEUKHAM  VALUES
('PK01','2021-09-12',N'Khó tiêu, đau bụng','08:30:00',N'Lương Thị Huế',N'Hoàng Trung Hiếu','P012','BN01','bsi03'),
('PK02','2022-09-11',N'Khó tiêu, đau bụng','09:40:00',N'Mạc Vương Phi',N'Ngô Ngọc Huy','P012','BN02','bsi08'),
('PK03','2022-03-21',N'Khó tiêu, đau bụng','10:30:00',N'Trần Thị Hoa',N'Đinh Thị Thùy Dương','P031','BN03','bsi20'),
('PK04','2021-04-20',N'Khó tiêu, đau bụng','09:00:00',N'Phạm Xuân Trường',N'Hoàng Trung Hiếu','P013','BN04','bsi03'),
('PK05','2020-02-19',N'Khó tiêu, đau bụng','10:30:00',N'Lê Thị Ánh Giao',N'Nguyễn Thị Minh Tâm','P011','BN05','bsi09'),
('PK06','2022-04-19',N'Khó tiêu, đau bụng','07:30:00',N'Nguyễn Thị Ngọc Lan',N'Lê Xuân Thành','P017','BN06','bsi18'),
('PK07','2021-05-26',N'Khó tiêu, đau bụng','08:15:00',N'Đặng Thị Tuyết Dư',N'Huỳnh Minh Khai','P031','BN07','bsi08'),
('PK08','2021-06-12',N'Khó tiêu, đau bụng','09:15:00',N'Huỳnh Minh Khai',N'Hoàng Trung Hiếu','P031','BN08','bsi05'),
('PK09','2022-01-09',N'Khó tiêu, đau bụng','09:50:00',N'Đoàn Thị Hồng Hạnh',N'Lê Thị Ánh Giao','P027','BN09','bsi05'),
('PK10','2022-09-15',N'Khó tiêu, đau bụng','10:10:00',N'Nguyễn Thị Mơ',N'Phạm Xuân Trường','P011','BN10','bsi04'),
('PK11','2022-05-29',N'Khó tiêu, đau bụng','08:00:00',N'Hoàng Hải Yến',N'Hoàng Trung Hiếu','P013','BN11','bsi02'),
('PK12','2022-01-28',N'Khó tiêu, đau bụng','14:30:00',N'Trương Văn Hải',N'Trần Thị Hoa','P014','BN12','bsi02'),
('PK13','2022-03-28',N'Khó tiêu, đau bụng','11:30:00',N'Ngô Thị Chung',N'Vàng A Tánh','P029','BN13','bsi15')
SELECT * FROM BENHNHAN
SELECT * FROM NHANVIEN

INSERT INTO NHACUNGCAP VALUES
('NCC01','CPT Sutures','0283822222',N'Số 8 Đường Đào Trí, Phú Thuận, Quận 7, Hồ Chí Minh'),
('NCC02','CTCP Vinamed','0243844326',N'89 Lương Định Của, Đống Đa, Hà Nộ'),
('NCC03','Thiết bị y tế 24h','0393838126',N'41A Thái Thị Bôi, P. Chính Gián, Q.Thanh Khê, Đà Nẵng'),
('NCC04','Hanoi IEC','0844362303',N'54/34/12 Bạch Đằng, P.2, Q. Tân Bình, TP. HCM'),
('NCC05','CP trang thiết bị kỹ thuật y tế TP.HCM','0283839099',N'252–254 Cống Quỳnh, P. Phạm Ngũ Lão, Quận 1, Tp.HCM'),
('NCC06','Thiết bị y tế Hoàng Lộc M.E','0283839965',N'K5/ K300 Cộng Hòa , Phường 12 , Quận Tân Bình , Tp HCM'),
('NCC07','Metech','0903455229',N'Tầng 1 Nhà A,Số 85 Lương Định Của, Phương Mai, Đống Đa, Hà Nội'),
('NCC08','Hoa Đà Medical','0902333345',N'162 Lò Siêu, Phường 12, quận 11, Tp Hồ Chí Minh')

INSERT INTO LOAITHIETBI VALUES 
 ('L01TB',10,N'Máy phân tích','yta01'),
 ('L02TB',10,N'Kính hiển vi','yta12'),
('L03TB',8,N'Bộ đếm','yta12'),
('L04TB',40,N'Xe lăn, xe điện','yta14'),
('L05TB',60,N'Giường bệnh','yta14'),
('L06TB',100,N'Xe tập,nạn, gậy','yta14'),
('L07TB',47,N'Kéo','yta14'),
('L08TB',36,N'Nệm','yta14'),
('L09TB',10,N'Bơm insulin','yta14'),
('L10TB',4,N'Máy hút ','yta01'),
('L11TB',10,N'Máy phun sương','yta12'),
('L12TB',15,N'Máy lạnh','yta12'),
('L13TB',30,N'Máy tính','yta12'),
('L14TB',20,N'Máy in','yta12'),
('L15TB',4,N'Máy Xquang','yta01'),
('L16TB',17,N'Máy photo','yta12'),
('L17TB',13,N'Máy chẩn đoán','yta01'),
('L18TB',10,N'Máy xet nghiệm','yta01'),
 ('L19TB',10,N'Máy siêu âm','yta01'),
('L20TB',3,N'Máy Thở oxy','yta12'),
('L21TB',15,N'Bình Oxy','yta12'),
('L22TB',1000,N'Kim tiêm','yta12'),
('L23TB',10,N'Băng gạt','yta14'),
 ('L24TB',5,N'Máy laser','yta01'),
  ('L25TB',30,N'Ống thí nghiệm','yta14'),
   ('L26TB',3,N'Máy chiếu','yta12')


INSERT INTO THIETBI VALUES 
('TB01',N'Máy phân tích khí máu', '2015-01-23',8403030.00,'2030-12-12','P032','NCC04','L01TB'),
('TB29',N'Máy phân tích huyết học', '2015-01-23',5673030.00,'2025-07-30','P033','NCC04','L01TB'),
('TB02',N'Máy phân tích hoá học', '2015-01-23',13563030.00,'2027-08-1','P029','NCC04','L01TB'),
('TB03',N'Máy phân tích điện giải', '2015-01-23',10103030.00,'2030-12-12','P030','NCC04','L01TB'),
('TB04',N'Máy phân tích đông máu', '2015-01-23',7773030.00,'2025-01-01','P032','NCC04','L01TB'),
('TB05',N'Máy phân tích nước tiểu', '2015-01-23',10903030.00,'2035-09-28','P032','NCC04','L01TB'),
('TB06',N'Máy XQuang ', '2016-12-12',156903030.00,'2038-12-31','P023','NCC02','L15TB'),
('TB07',N'Kính hiển vi', '2015-09-19',5003030.00,'2035-05-05','P012','NCC02','L02TB'),
('TB08',N'Máy siêu âm', '2016-12-09',30903030.00,'2033-11-11','P011','NCC02','L19TB'),
('TB09',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P019','NCC01','L13TB'),
('TB10',N'Giường', '2015-02-01',703030.00,'2035-12-06','P003','NCC06','L05TB'),
('TB11',N'Giường', '2015-02-01',703030.00,'2035-07-15','P011','NCC06','L05TB'),
('TB12',N'Giường', '2015-02-01',703030.00,'2035-12-21','P007','NCC06','L05TB'),
('TB13',N'Xe lăn', '2016-10-11',603030.00,'2035-01-31','P031','NCC03','L04TB'),
('TB14',N'Xe điện', '2016-10-11',3903030.00,'2035-05-25','P031','NCC03','L04TB'),
('TB15',N'Nạn', '2015-05-18',303030.00,'2035-02-01','P031','NCC07','L06TB'),
('TB16',N'xe lăn', '2016-10-11',903030.00,'2035-10-11','P031','NCC03','L04TB'),
('TB17',N'Máy in', '2015-01-15',8903030.00,'2035-09-09','P031','NCC01','L14TB'),
('TB18',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P001','NCC01','L13TB'),
('TB19',N'Giường', '2015-02-01',703030.00,'2035-12-06','P004','NCC06','L05TB'),
('TB20',N'Giường', '2015-02-01',703030.00,'2035-12-06','P005','NCC06','L05TB'),
('TB21',N'Giường', '2015-02-01',703030.00,'2035-12-06','P027','NCC06','L05TB'),
('TB22',N'Giường', '2015-02-01',703030.00,'2035-12-21','P017','NCC06','L05TB'),
('TB23',N'Giường', '2015-02-01',703030.00,'2035-12-21','P018','NCC06','L05TB'),
('TB24',N'Giường', '2015-02-01',703030.00,'2035-12-21','P009','NCC06','L05TB'),
('TB25',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P002','NCC01','L13TB'),
('TB26',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P032','NCC01','L13TB'),
('TB27',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P026','NCC01','L13TB'),
('TB28',N'Máy tính', '2015-01-10',14903030.00,'2025-03-13','P013','NCC01','L13TB')



insert into LICHKHAM VALUES
('LK0001','2021-09-12',N'Lương Thị Huế',40,1,'0465731274',N'Đau bụng phải',N'Hẹn Khám Bệnh',N'',N'Chưa Xử Lý','bsi03','BN01'),
('LK0002','2022-09-11',N'Mạc Vương Phi',36,0,'0936456345',N'Lên hạch sau tai',N'Hẹn Khám Bệnh',N'',N'Chưa Xử Lý','bsi08','BN02'),
('LK0003','2022-07-12',N'Hoàng Tiến Dũng',27,1,'0912098763',N'',N'Hẹn Tái Khám',N'',N'Đã Xử Lý','bsi20','BN14'),
('LK0004','2022-05-25',N'Trần Xuân Trường',55,1,'0120194672','',N'Hẹn tái khám',N'',N'Chưa Xử Lý','bsi03','BN16'),
('LK0005','2022-03-21',N'Trần Thị Hoa',41,0,'0571208382',N'Trật khớp vai',N'Hẹn Khám Bệnh',N'',N'Chưa Xử Lý','bsi20','BN03'),
('LK0006','2021-04-20',N'Phạm Xuân Trường',43,1,'0523431243',N'Đau bụng kéo dài,chán ăn',N'Hẹn Khám Bệnh',N'',N'Đã Xử Lý','bsi03','BN04'),
('LK0007','2020-02-19',N'Lê Thị Ánh Giao',63,0,'0919288187',N'Khám thai định kì',N'Hẹn Khám Bệnh',N'',N'Chưa Xử Lý','bsi09','BN05'),
('LK0008','2021-06-04',N'Đặng Thị Tuyết Dư',37,0,'0989712903','',N'Hẹn Tái Khám',N'',N'Chưa Xử Lý','bsi08','BN07'),
('LK0009','2022-04-19',N'Nguyễn Thị Ngọc Lan',45,0,'0465310980',N'Suy nhược cơ thể',N'Hẹn Khám Bệnh',N'',N'Đã Xử Lý','bsi18','BN06'),
('LK0010','2022-04-26',N'Ngô Thị Chung',25,0,'0989687122','',N'Hẹn đọc kết quả',N'',N'Chưa Xử Lý','bsi15','BN13'),
('LK0011','2021-06-20',N'Vũ Duy Quý',35,1,'0856236734','',N'Hẹn tái khám',N'',N'Đã Xử Lý','bsi03','BN17'),
('LK0012','2021-06-20',N'Nguyễn Tiến Phát',20,1,'0812098374','',N'Hẹn tái khám',N'',N'Đã Xử Lý','bsi15','BN20'),
('LK0013','2021-05-30',N'Đào Tiến Đạt',27,1,'0374129847','',N'Hẹn tái khám',N'',N'Đã Xử Lý','bsi18','BN19'),
('LK0014','2021-12-20',N'Lê Xuân Thành',20,1,'0919847563','',N'Hẹn tái khám',N'',N'Đã Xử Lý','bsi18','BN18'),
('LK0015','2022-01-09',N'Đoàn Thị Hồng Hạnh',25,1,'0981128436',N'Nhiệt miệng',N'Hẹn Khám bệnh',N'',N'chưa Xử Lý','bsi05','BN09'),
('LK0016','2021-09-22',N'Vàng A Tánh',36,1,'0109374672',N'',N'Hẹn tái khám',N'',N'chưa Xử Lý','bsi15','BN15')


INSERT INTO BENHAN VALUES
('BA01',N'Lương Thị Huế',N'Ngô Ngọc Huy','2020-03-25',N'Đau bụng phải',null,N'Đau ruột thừa',null,'bsi08','BN01','VP01','LK0001','DT01','P012'),
('BA02',N'Hoàng Tiến Dũng',N'Đinh Thị Thùy Dương','2022-06-12',N'Gãy chân',N'Xét nghiệm chụp XQuang',N'Gãy xương Chân',NULL,'bsi20','BN14','VP13','LK0003','DT14','P031'),
('BA03',N'Ngô Thị Chung',N'Nguyễn Thị Tuyết Nhi','2022-03-28',N'Quai bị',NULL,N'Sâu răng',NULL,'bsi15','BN13','VP12','LK0010','DT13','P029'),
('BA04',N'Trần Xuân Trường',N'Hoàng Trung Hiếu','2022-4-25',N'Khó nuốt,ợ chua',NULL,N'Viêm loét dạ dày',NULL,'bsi03','BN16','VP15','LK0008','DT16','P023'),
('BA05',N'Vũ Duy Quý',N'Hoàng Trung Hiếu','2021-06-12',N'Bất thường ở dưới niêm mạc',N'Siêu âm',N'Viêm niêm mạc',NULL,'bsi03','BN17','VP16','LK0011','DT17','P024'),
('BA06',N'Nguyễn Tiến Phát',N'Nguyễn Thị Tuyết Nhi','2021-06-12',N'Đau bụng dữ dội, đột ngột',N'Siêu âm',N'Đau bụng do nhiệt nóng, táo bón',NULL,'bsi15','BN20','VP19','LK0012','DT20','P029'),
('BA07',N'Đào Tiến Đạt',N'Phạm Công Nguyên','2021-05-25',N'Biếng ăn, ăn không ngon',NULL,N'Lười ăn',NULL,'bsi18','BN19','VP08','LK0013','DT08','P015'),
('BA08',N'Lê Xuân Thành',N'Phạm Công Nguyên','2021-12-13',N'Ho thắt',NULL,'AMIDAN',NULL,'bsi18','BN18','VP09','LK0014','DT09','P018'),
('BA09',N'Hoàng Tiến Dũng',N'Phạm Công Nguyên','2021-9-12',N'Gãy chân',N'Xét nghiệm chụp XQuang',N'Gãy xương Chân',NULL,'bsi18','BN14','VP09','LK0016','DT15','P029')


INSERT INTO HOADONCHITIET VALUES
('CT01',3,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH001','DT01'),
('CT02',2,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH020','DT01'),
('CT03',4,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH005','DT02'),
('CT04',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH003','DT02'),
('CT05',2,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH001','DT03'),
('CT06',1,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH020','DT03'),
('CT07',2,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH020','DT04'),
('CT08',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH020','DT05'),
('CT09',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH005','DT06'),
('CT10',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH006','DT06'),
('CT11',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH003','DT06'),
('CT12',3,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH019','DT07'),
('CT13',1,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH020','DT07'),
('CT14',2,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH003','DT08'),
('CT15',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH013','DT09'),
('CT16',3,N'2 viên/ ngày,Uống (sáng, tối) sau ăn','TH019','DT09'),
('CT17',1,N'Rửa ngày 3 lần','TH020','DT10'),
('CT18',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH009','DT11'),
('CT19',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH012','DT12'),
('CT20',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH002','DT13'),
('CT21',3,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH019','DT14'),
('CT22',2,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH001','DT14'),
('CT23',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH019','DT15'),
('CT24',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH003','DT16'),
('CT25',1,N'3 viên/ngày, Uống (sáng, trưa, tối) sau ăn','TH007','DT17'),
('CT26',1,N'Uống 1 viên sau khi ăn no','TH004','DT18'),
('CT27',1,N'Uống 1 viên sau khi ăn no','TH006','DT19'),
('CT28',1,N'Uống 1 viên sau khi ăn no','TH010','DT20'),
('CT29',1,N'Uống 1 viên sau khi ăn no','TH001','DT20')
select*from dichvu

-- FUNCTION 

-- 1FUNC_TIENTHUOC
GO
DROP FUNCTION IF EXISTS FUNC_TIENTHUOC
GO
CREATE FUNCTION FUNC_TIENTHUOC (@MaDT nchar(15)) returns float
AS
BEGIN	
	return(SELECT   SUM(HDCT.SoLuong * THUOC.DonGia) as 'Gia'
	FROM  HOADONCHITIET  HDCT JOIN THUOC ON  HDCT.MaThuoc = THUOC.MaThuoc
	GROUP BY MaDT HAVING MaDT = @MaDT)
END 
GO
SELECT DBO.FUNC_TIENTHUOC ('DT14')


-- 2 
SELECT*FROM HOADONCHITIET WHERE MaDT = 'DT01'
select*from THUOC 

-- * FUNC_TIENDICHVU * ---

GO
DROP FUNCTION IF EXISTS FUNC_TIENDICHVU
GO
CREATE FUNCTION FUNC_TIENDICHVU (@MaBN nchar(15)) returns float
AS
BEGIN
	
	DECLARE @TIENDICHVU FLOAT
	SELECT @TIENDICHVU =  SUM(PhiDV)
	FROM  DANHSACHDICHVU  DS JOIN DICHVU ON DICHVU.MaDV = DS.MaDV WHERE DS.TrangThai = 'No'
	GROUP BY PHIDV , MaBN, DS.MaDV HAVING MaBN = @MaBN
	RETURN @TIENDICHVU
END
GO
SELECT DBO.FUNC_TIENDICHVU ('BN14') AS N'GIÁ'

SELECT *FROM DICHVU
SELECT*FROM DANHSACHDICHVU


-- FUNC_TONGVIENPHI ---
GO
DROP FUNCTION IF EXISTS FUNC_TONGVIENPHI
GO
create FUNCTION FUNC_TONGVIENPHI (@MaBN nchar(15))
returns FLOAT
AS
BEGIN 
	DECLARE @TONG1 FLOAT
	DECLARE @TONG2 FLOAT
	DECLARE @TONG3 FLOAT 
	DECLARE @TONG FLOAT
		SELECT @TONG1 = SUM(HDCT.SoLuong * THUOC.DonGia)
		FROM    THUOC JOIN HOADONCHITIET HDCT ON  HDCT.MaThuoc = THUOC.MaThuoc 
					  JOIN HOADONTHUOC DT ON HDCT.MaDT = DT.MaDT 
				WHERE MaBN =@MaBN
		  GROUP BY HDCT.MaDT
		SELECT @TONG2 =  SUM(PhiDV)
		FROM  DANHSACHDICHVU  DS JOIN DICHVU ON DICHVU.MaDV = DS.MaDV WHERE DS.TrangThai = 'No'
		GROUP BY PHIDV , MaBN, DS.MaDV HAVING MaBN = @MaBN
		SELECT @TONG3 =  SUM(GiaPhong)
		FROM  Phong  P  JOIN BENHAN BA ON P.MaPhong = BA.MaPhong  
		GROUP BY GiaPhong  , MaBN  HAVING MaBN = @MaBN
		SELECT @TONG =@TONG1 + @TONG2 + @TONG3 

	   RETURN @TONG
END
GO


SELECT  * FROM PHONG 
SELECT  * FROM BENHNHAN
SELECT  * FROM BENHAN

SELECT DBO.FUNC_TONGVIENPHI ('BN14') AS 'TIEN VIEN PHI'
SELECT DBO.FUNC_TIENDICHVU ('BN14') AS N'GIÁ'
SELECT DBO.FUNC_TIENTHUOC ('DT14') AS N'GIÁ'
GO
select * from VIENPHI
-- FUNCTION_CHITIENTHUOC
GO
DROP FUNCTION IF EXISTS FUNC_CHITIENTHUOC
GO
CREATE FUNCTION FUNC_CHITIENTHUOC (@MaThuoc nchar(15)) returns float
AS
BEGIN
	-- TRẢ VỀ SỐ TIỀN MUA CỦA TỪNG LOẠI THUỐC
	DECLARE @TIENCHI FLOAT
	SELECT @TIENCHI =  SUM(SoLuong * DonGia)
	FROM  THUOC  WHERE MaThuoc = @MaThuoc
	RETURN @TIENCHI
END
GO
SELECT DBO.FUNC_CHITIENTHUOC ('TH001') AS N'GÍA'


-- FUNCTION_ TÍNH TIỀN MUA THIẾT BỊ THEO LOAI THIẾT BỊ
GO
DROP FUNCTION IF EXISTS FUNC_CHITIENTHIETBI
GO
CREATE FUNCTION FUNC_CHITIENTHIETBI (@MaLoaiTB nchar(15)) returns float
AS
BEGIN
	DECLARE @CHITB FLOAT
	SELECT @CHITB = sum(tb.GiaTB) from LOAITHIETBI ltb join THIETBI tb 
	on  ltb.MaLoaiTB = tb.MaLoaiTB
	where ltb.MaLoaiTB = @MaLoaiTB
    group by tb.MaLoaiTB 
	RETURN @CHITB
END
GO
SELECT DBO.FUNC_CHITIENTHIETBI ('L01TB') AS N'GÍA'
SELECT *FROM THIETBI
sELECT*FROM LOAITHIETBI



-- tìm kiếm cbo_tenDv
GO
DROP PROC IF EXISTS SP_DVDK
GO
CREATE PROC SP_DVDK @TenDV nchar(15)
AS
BEGIN 
     SELECT  ID, NgayDK,TrangThai,TenDV,MaBN FROM DANHSACHDICHVU join DICHVU on DICHVU.MaDV =  DANHSACHDICHVU.MaDV
	 
	 GROUP BY ID, NgayDK,TrangThai,TenDV,MaBN HAVING TenDV = @TenDV

END
exec SP_DVDK 'Siêu âm thai'
SELECT*FROM DICHVU

-- tìm kiếm cbo_TrangThai
GO
DROP PROC IF EXISTS SP_TrangThaiDK
GO
CREATE PROC SP_TrangThaiDK @TrangThai nchar(15)
AS
BEGIN 
     SELECT  ID, NgayDK,TrangThai,TenDV,MaBN FROM DANHSACHDICHVU join DICHVU on DICHVU.MaDV =  DANHSACHDICHVU.MaDV
	 
	 GROUP BY ID, NgayDK,TrangThai,TenDV,MaBN HAVING TrangThai = @TrangThai

END
exec SP_TrangThaiDK 'Yes'
SELECT*FROM DICHVU

-- THỐNG KÊ LƯỢNG THUỐC THEO NĂM
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_DaBantheonam
GO
CREATE PROC SP_ThongKe_LuongThuoc_DaBantheonam @NAM INT
AS
BEGIN 
SELECT C.MaThuoc , TenThuoc, SUM(C.SoLuong) as SL , D.NgayXuat    FROM HOADONCHITIET C INNER JOIN HOADONTHUOC D ON C.MaDT = D.MaDT inner join THUOC T ON C.MaThuoc = T.MaThuoc  GROUP BY T.MaThuoc, C.MaThuoc , TenThuoc, D.NgayXuat HAVING YEAR ( NgayXuat) = @NAM
END

EXEC SP_ThongKe_LuongThuoc_DaBantheonam ' 2021'
-- THỐNG KÊ LƯỢNG THUỐC  THEO THÁNG VÀ NĂM
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_DaBan_khongtheothang 
GO
CREATE PROC SP_ThongKe_LuongThuoc_DaBan_khongtheothang 
AS
BEGIN 
SELECT C.MaThuoc , TenThuoc, SUM(C.SoLuong) as SL , D.NgayXuat    FROM HOADONCHITIET C INNER JOIN HOADONTHUOC D ON C.MaDT = D.MaDT inner join THUOC T ON C.MaThuoc = T.MaThuoc  GROUP BY T.MaThuoc, C.MaThuoc , TenThuoc, D.NgayXuat 
END

EXEC SP_ThongKe_LuongThuoc_DaBan_khongtheothang



--THỐNG KÊ SỐ LƯỢNG LOẠI THIẾT BỊ 
GO
DROP PROC IF EXISTS SP_TK_TB
GO
CREATE PROC SP_TK_TB @MaLoaiTB nchar(15)
AS
BEGIN 
     SELECT  MaTB , TenTB, NgayNhap, LOAITHIETBI.MaLoaiTB FROM THIETBI TB JOIN LOAITHIETBI  ON TB.MaLoaiTB = LOAITHIETBI.MaLoaiTB
	 WHERE LOAITHIETBI.MaLoaiTB = @MaLoaiTB
	 GROUP BY LOAITHIETBI.MaLoaiTB, TB.MaTB, TB.TenTB,TB.NgayNhap

END
exec SP_TK_TB 'L01TB'
--THỐNG KÊ thiets bị theo loaitb
GO
DROP PROC IF EXISTS SP_ThongKe_ThietBi_LoaiTB
GO
CREATE PROC SP_ThongKe_ThietBi_LoaiTB 
AS
BEGIN 
SELECT  MaLoaiTB , TenLoaiThietBi  , SoLuong FROM LOAITHIETBI  
END
select*from THIETBI
select*from LOAITHIETBI
EXEC SP_ThongKe_ThietBi_LoaiTB
select * from loaithietbi
-- THỐNG KÊ SỐ LƯỢNG NHẬP VỀ ( THEO THÁNG )
GO
DROP PROC IF EXISTS SP_ThongKe_ThietBi_NhapVe
GO
CREATE PROC SP_ThongKe_ThietBi_NhapVe @THANG INT , @NAM INT
AS
BEGIN 
SELECT  B.MaLoaiTB , TenLoaiThietBi  , SoLuong, NgayNhap  FROM LOAITHIETBI L INNER JOIN THIETBI B ON L.MaLoaiTB = B.MaLoaiTB  GROUP BY B.MaLoaiTB , TenLoaiThietBi  , SoLuong, NgayNhap HAVING MONTH(NgayNhap) =  @THANG  and YEAR ( NgayNhap) = @NAM
END

EXEC SP_ThongKe_ThietBi_NhapVe 1, 2015

--THỐNG KÊ LƯỢNG THUỐC ĐÃ BÁN
GO
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_DaBan
GO
CREATE PROC SP_ThongKe_LuongThuoc_DaBan @THANG INT , @NAM INT
AS
BEGIN 
SELECT C.MaThuoc , TenThuoc, SUM(C.SoLuong) as SL , D.NgayXuat    FROM HOADONCHITIET C INNER JOIN HOADONTHUOC D ON C.MaDT = D.MaDT inner join THUOC T ON C.MaThuoc = T.MaThuoc  GROUP BY T.MaThuoc, C.MaThuoc , TenThuoc, D.NgayXuat HAVING MONTH(NgayXuat) =  @THANG  and YEAR ( NgayXuat) = @NAM
END

EXEC SP_ThongKe_LuongThuoc_DaBan  7, 2021

-- THỐNG KẾ SỐ LƯỢNG THUỐC CÒN LẠI
GO
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_ConLai
GO
CREATE PROC SP_ThongKe_LuongThuoc_ConLai
AS
BEGIN 
SELECT MaThuoc , TenThuoc,SoLuong, DonVi from THUOC   GROUP BY MaThuoc , TenThuoc, SoLuong, DonVi
END

EXEC SP_ThongKe_LuongThuoc_ConLai


-- THỐNG KÊ SỐ NGƯỜI DÙNG DỊCH VỤ THEO THÁNG
--GO
--DROP PROC IF EXISTS SP_ThongKe_DangKyDichVu
--GO
--CREATE PROC SP_ThongKe_DangKyDichVu  @THANG INT , @NAM INT
--AS
--BEGIN 
--SELECT D.MaDV, V.TenDV, COUNT(D.MABN) AS SL    FROM DICHVU V  INNER JOIN DANHSACHDICHVU D ON V.MaDV = D.MaDV GROUP BY  D.MaDV, V.TenDV, NgayDK HAVING MONTH(NgayDK) =  @THANG  and YEAR ( NgayDK) = @NAM
--END

--EXEC SP_ThongKe_DangKyDichVu  6, 2022

-- THỐNG KÊ NHÂN VIÊN THEO CHỨC VỤ
GO
DROP PROC IF EXISTS SP_ThongKe_NhanVien_ChucVu
GO
CREATE PROC SP_ThongKe_NhanVien_ChucVu
AS
BEGIN 
SELECT ChucVu , count(ChucVu) AS N'SỐ LƯỢNG' from NHANVIEN GROUP BY ChucVu
END

EXEC SP_ThongKe_NhanVien_ChucVu

-- THỐNG KÊ NHÂN VIÊN THEO CHUYEN KHOA
GO
DROP PROC IF EXISTS SP_ThongKe_NhanVien_ChuyenKhoa
GO
CREATE PROC SP_ThongKe_NhanVien_ChuyenKhoa
AS
BEGIN 
SELECT   TenKhoa ,count(ChucVu) AS N'SỐ LƯỢNG' from NHANVIEN inner join KHOA on NHANVIEN.MaKhoa = KHOA.MaKhoa GROUP BY NHANVIEN.MaKhoa, TenKhoa
END

EXEC SP_ThongKe_NhanVien_ChuyenKhoa

-- THỐNG KÊ CHI TIEU THEO THÁNG
GO
DROP PROC IF EXISTS SP_ThongKe_ChiTieu
GO
CREATE PROC SP_ThongKe_ChiTieu  @THANG INT , @NAM INT
AS
BEGIN 
SELECT NguonTien , SoTienChiRa, Ngay from CHITIEU group by   NguonTien , SoTienChiRa, Ngay HAVING MONTH(Ngay) =  @THANG  and YEAR ( Ngay) = @NAM
END

EXEC SP_ThongKe_ChiTieu  6, 2022

-- THỐNG KÊ DOANH THU THEO NGÀY THÁNG NĂM
GO
DROP PROC IF EXISTS SP_ThongKe_DoanhThu
GO
CREATE PROC SP_ThongKe_DoanhThu  @NGAY DATE
AS
BEGIN 
SELECT  Ngay , TienVienPhi from DOANHTHU group by   Ngay , TienVienPhi HAVING Ngay = @NGAY
END

EXEC SP_ThongKe_DoanhThu '2020-01-01'
--
GO
DROP PROC IF EXISTS SP_ThongKe_NhanVien_ChuyenKhoa
GO
CREATE PROC SP_ThongKe_NhanVien_ChuyenKhoa @CHUCVU NVARCHAR(15)
AS
BEGIN 
select  ChucVu ,TenKhoa, COUNT(ChucVu)AS N'SỐ LƯỢNG' From NHANVIEN N INNER JOIN KHOA K ON N.MaKhoa = K.MaKhoa GROUP BY ChucVu,TenKhoa,K.MaKhoa HAVING ChucVu = @CHUCVU  ORDER BY K.MaKhoa ASC 
END
--
GO
DROP PROC IF EXISTS SP_ThongKe_DangKyDichVu_Theothangnam
GO
CREATE PROC SP_ThongKe_DangKyDichVu_Theonam   @NAM INT
AS
BEGIN 
SELECT D.MaDV, V.TenDV, COUNT(D.MABN) AS SL    FROM DICHVU V  INNER JOIN DANHSACHDICHVU D ON V.MaDV = D.MaDV GROUP BY  D.MaDV, V.TenDV, NgayDK HAVING  YEAR ( NgayDK) = @NAM
END

EXEC SP_ThongKe_DangKyDichVu_Theonam   2022

DROP PROC IF EXISTS SP_ThongKe_DangKyDichVu
GO
CREATE PROC SP_ThongKe_DangKyDichVu  
AS
BEGIN 
SELECT D.MaDV, V.TenDV, COUNT(D.MABN) AS SL    FROM DICHVU V  INNER JOIN DANHSACHDICHVU D ON V.MaDV = D.MaDV GROUP BY  D.MaDV, V.TenDV, NgayDK 
END

EXEC SP_ThongKe_DangKyDichVu

GO
GO
DROP PROC IF EXISTS SP_ThongKe_DangKyDichVu_Theothangnam
GO
CREATE PROC SP_ThongKe_DangKyDichVu_Theothangnam  @THANG INT , @NAM INT
AS
BEGIN 
SELECT D.MaDV, V.TenDV, COUNT(D.MABN) AS SL    FROM DICHVU V  INNER JOIN DANHSACHDICHVU D ON V.MaDV = D.MaDV GROUP BY  D.MaDV, V.TenDV, NgayDK HAVING MONTH(NgayDK) =  @THANG  and YEAR ( NgayDK) = @NAM
END

EXEC SP_ThongKe_DangKyDichVu_Theothangnam  6, 2022
--
GO
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_ConLai
GO
CREATE PROC SP_ThongKe_LuongThuoc_ConLai
AS
BEGIN 
SELECT MaThuoc , TenThuoc,SoLuong, DonVi from THUOC   GROUP BY MaThuoc , TenThuoc, SoLuong, DonVi
END

EXEC SP_ThongKe_LuongThuoc_ConLai
--
GO
DROP PROC IF EXISTS SP_ThongKe_ThietBi_LoaiTB_theothangnam
GO
CREATE PROC SP_ThongKe_ThietBi_LoaiTB_theothangnam @thang int ,@nam int
AS
BEGIN 
SELECT MaTB, TenTB, NgayNhap, TenLoaiThietBi from THIETBI t inner join LOAITHIETBI l on t.MaLoaiTB = l.MaLoaiTB group by MaTB, TenTB, NgayNhap, TenLoaiThietBi having MONTH(NgayNhap)= @thang and YEAR(NgayNhap)= @nam
END
exec  SP_ThongKe_ThietBi_LoaiTB_theothangnam 2, 2015
--
GO
DROP PROC IF EXISTS SP_ThongKe_ThietBi_LoaiTB_theonam
GO
CREATE PROC SP_ThongKe_ThietBi_LoaiTB_theonam @nam int
AS
BEGIN 
SELECT MaTB, TenTB, NgayNhap, TenLoaiThietBi from THIETBI t inner join LOAITHIETBI l on t.MaLoaiTB = l.MaLoaiTB group by MaTB, TenTB, NgayNhap, TenLoaiThietBi having YEAR(NgayNhap)= @nam
END
exec  SP_ThongKe_ThietBi_LoaiTB_theonam 2015
--THONGKEBENHNHAN

DROP PROC IF EXISTS SP_ThongKe_BenhNhan
GO
CREATE PROC  SP_ThongKe_BenhNhan
AS
BEGIN
SELECT A.MABN, N.HoTenBN , COUNT(A.MaBN)AS N'Số lần khám' FROM BENHAN  A INNER JOIN BENHNHAN N ON A.MaBN = N.MaBN GROUP BY A.MaBN, N.HoTenBN 
END
go
EXEC SP_ThongKe_BenhNhan

--THONGKEBENHNHANTHEONAM
DROP PROC IF EXISTS SP_ThongKe_BenhNhan_TheoNam
GO
CREATE PROC  SP_ThongKe_BenhNhan_TheoNam  @NAM INT 
AS
BEGIN
SELECT A.MABN, N.HoTenBN, COUNT(A.MaBN)AS N'Số lần khám' FROM BENHAN  A INNER JOIN BENHNHAN N ON A.MaBN = N.MaBN GROUP BY A.MaBN, N.HoTenBN,A.NgayKham having YEAR(A.NgayKham) =@NAM
END

EXEC SP_ThongKe_BenhNhan_TheoNam 2022


--THONGKEBENHNHANTHEOTHANGNAM
DROP PROC IF EXISTS SP_ThongKe_BenhNhan_TheoThangNam
GO
CREATE PROC  SP_ThongKe_BenhNhan_TheoThangNam  @THANG INT ,@NAM INT 
AS
BEGIN
SELECT A.MABN, N.HoTenBN, COUNT(A.MaBN)AS N'Số lần khám' FROM BENHAN  A INNER JOIN BENHNHAN N ON A.MaBN = N.MaBN GROUP BY A.MaBN, N.HoTenBN,A.NgayKham having MONTH(A.NgayKham) =@THANG AND YEAR(A.NgayKham) =@NAM
END
go
EXEC SP_ThongKe_BenhNhan_TheoThangNam 4, 2022

--THONGKEBANHNHANTHEOMABN
DROP PROC IF EXISTS SP_ThongKe_BenhNhan_TheoMa
GO
CREATE PROC  SP_ThongKe_BenhNhan_TheoMa @MABN VARCHAR(10)
AS
BEGIN
SELECT A.MABN, N.HoTenBN, A.NgayKham,A.MaNV,V.HoTenNV,TenKhoa FROM BENHAN  A INNER JOIN BENHNHAN N ON A.MaBN = N.MaBN inner join NHANVIEN V  ON A.MaNV = V.MaNV INNER JOIN KHOA K ON V.MaKhoa = K.MaKhoa GROUP BY A.MABN, N.HoTenBN, A.NgayKham,A.MaNV,V.HoTenNV,TenKhoa HAVING A.MaBN = @MABN
END
go
EXEC SP_ThongKe_BenhNhan_TheoMa 'BN01'     


-- TRIGGER THÊM

-- THÊM LỊCH KHÁM
GO
Drop trigger if exists  TR_ADD_CALEANDY
GO
CREATE TRIGGER TR_ADD_CALEANDY ON LICHKHAM
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (MaLichKham,1,2) from LICHKHAM where MaLichKham  in (Select MaLichKham from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaLichKham,3,4) as int)+1) from LICHKHAM)
		Update LICHKHAM set MaLichKham = CONCAT(@macv,@maduoi) where MaLichKham in (Select MaLichKham from inserted)
END
INSERT INTO LICHKHAM VALUES
('LK','2021-09-12',N'Lương Thị Huế',40,1,'0465731274',N'Đau bụng phải',N'Hẹn Khám Bệnh',N'',N'Chưa Xử Lý','bsi03','BN01')

SELECT*FROM TAIKHOAN
DELETE FROM LICHKHAM where MaLichKham = 'LK17'

DELETE FROM BENHNHAN where MaBN = 'BN21'


-- DELETE
 DROP TRIGGER IF EXISTS TR_DELTE_CALEANDY;
 GO 
 CREATE TRIGGER TR_DELTE_CALEANDY ON LICHKHAM INSTEAD OF DELETE 
 AS
 BEGIN 
		DELETE FROM BENHAN WHERE MaBA IN (SELECT MaBA FROM deleted);
		DELETE FROM LICHKHAM WHERE MaLichKham IN (SELECT MaLichKham FROM deleted)
		
 END
 DELETE FROM LICHKHAM WHERE MaLichKham = 'LK0016'
 SELECT*FROM lichkham
-- ============================================= THUỐC
-- thêm THUỐC
Drop trigger if exists  TR_ADD_PRYMACICY
GO
CREATE TRIGGER TR_ADD_PRYMACICY ON THUOC
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (MaThuoc,1,3) from THUOC where MaThuoc  in (Select MaThuoc from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaThuoc,3,3) as int)+1) from THUOC)
		Update THUOC set MaThuoc = CONCAT(@macv,'0',@maduoi) where MaThuoc in (Select MaThuoc from inserted)
END
INSERT INTO THUOC VALUES
('TH000',N'Amoxcillin',N'Uống',N'Nhóm thuốc kháng sinh',860,N'Hộp',120.000,'2021-11-28','2021-02-17','2023-12-27','yta21')

SELECT*FROM THUOC
delete from THUOC WHERE MaThuoc = 'TH21'

-- DELETE THUOC
go
CREATE TABLE THUOC_DELETE (
	MaThuoc nchar(15) not null,
	TenThuoc nvarchar(45) not null,
	CachDung nvarchar(45) not null,
	LoaiThuoc nvarchar(45) not null,
	SoLuong int not null,
	DonVi nvarchar(20) not null,
	DonGia float not null,
	NgayNhap date not null,
	NgaySX date not null,
	HSD date not null,
	MaNV nchar(15) null,
	NgayXoa date not null
);

 DROP TRIGGER IF EXISTS TR_DELETE_PRYMACICY;
 GO 
 CREATE TRIGGER TR_DELETE_PRYMACICY ON THUOC INSTEAD OF DELETE 
 AS
 BEGIN 
 
		DELETE FROM THUOC WHERE MaThuoc  = null;
  
		INSERT INTO THUOC_DELETE SELECT D.* , NGAYXOA = GETDATE() FROM deleted D;
		DELETE FROM HOADONCHITIET WHERE MaThuoc IN (SELECT MaThuoc FROM deleted)
		DELETE FROM THUOC WHERE MaThuoc IN (SELECT MaThuoc FROM deleted);
 END
 SELECT*FROM THUOC
 select*from HOADONCHITIET
 DELETE FROM THUOC WHERE MaThuoc = 'TH012';
 select*from THUOC_DELETE
 
-- ======================================================= THIẾT BỊ

-- thêm THIẾT BỊ
Drop trigger if exists  TR_ADD_DEVICE
GO
CREATE TRIGGER TR_ADD_DEVICE ON THIETBI
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (MaTB,1,2) from THIETBI where MaTB  in (Select MaTB from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaTB,3,2) as int)+1) from THIETBI)
		Update THIETBI set MaTB = CONCAT(@macv,@maduoi) where MaTB in (Select MaTB from inserted)
END
INSERT INTO THIETBI VALUES
('TB00',N'Máy kiểm tra nói dối','2022-11-24',150000000,'2027-12-28','P029','NCC03','L01TB')

 select*from THIETBI
-- xoa THIETBI
go
CREATE TABLE THIETBI_DELETE (
	MaTB nchar(15) not null,
	TenTB nvarchar(45) not null,
	NgayNhap date not null,
	GiaTB float not null,
	HSD date not null,
	MaPhong varchar(15) not null,
	MaNCC nchar(15) not null,
	MaLoaiTB nchar(15),
	NgayXoa date not null
);


-- XÓA THIẾT BỊ
 DROP TRIGGER IF EXISTS TR_DELETE_DEVICE;
 GO 
 CREATE TRIGGER TR_DELETE_DEVICE ON THIETBI INSTEAD OF DELETE 
 AS
 BEGIN 
 
		DELETE FROM THIETBI WHERE MaLoaiTB  = null;
  
		INSERT INTO THIETBI_DELETE SELECT D.* , NGAYXOA = GETDATE() FROM deleted D;
		DELETE FROM CHITIEU WHERE MaTB IN (SELECT MaTB FROM DELETED)
		DELETE FROM THIETBI WHERE MaTB IN (SELECT MaTB FROM deleted);
 END
 DELETE FROM THIETBI WHERE MaTB = 'TB01';
 select*from THIETBI
 select * from  THIETBI_DELETE
 select*from LOAITHIETBI

 -- cách 2
 -- XÓA THIẾT BỊ
--GO
--DROP TRIGGER IF EXISTS TR_DELETE_DEVICE
--GO
--CREATE TRIGGER TR_DELETE_DEVICE 
--ON THIETBI
--INSTEAD OF DELETE 
--AS
	--DELETE FROM CHITIEU WHERE MaTB IN (SELECT MaTB FROM DELETED)
	--DELETE FROM THIETBI WHERE MaTB IN (SELECT MaTB FROM DELETED)


	--DELETE FROM THIETBI WHERE MaTB = 'TB29'
	--SELECT *FROM THIETBI
	--SELECT*FROM CHITIEU

 -- ===================================================== NHAN VIEN
-- TRIGGER THÊM NHÂN VIÊN

-- // cách 
drop trigger if exists  TR_ADD_SALARY
GO
CREATE TRIGGER TR_ADD_SALARY ON NHANVIEN
FOR INSERT AS
BEGIN
		declare @macv nvarchar(3) = (Select SUBSTRING(MaNV,1,3) from NHANVIEN where MaNV  in (Select MaNV from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaNV,4,2) as int)+1) from NHANVIEN)
		Update NHANVIEN set MaNV = CONCAT(@macv,@maduoi) where MaNV in (Select MaNV from inserted)
END

select*from NHANVIEN
select*from THIETBI


SELECT *FROM BENHNHAN


-- XÓA NHÂN VIÊN
drop trigger if exists  TR_DELETE_SALARY
go
CREATE TRIGGER TR_DELETE_SALARY ON NHANVIEN INSTEAD OF DELETE
AS
BEGIN
		DELETE From TAIKHOAN WHERE MaNV in (select MaNV from deleted)
			DECLARE @THUOC VARCHAR(15) = (select max(MaNV) from nhanvien where MaNV not in (select manv from THUOC) and MaNV like '%bsi%')
				UPDATE THUOC SET MaNV= @THUOC WHERE MANV IN (SELECT MANV FROM deleted )
				DELETE FROM CHITIEU WHERE MaNV IN (SELECT MANV FROM deleted)
				DELETE FROM LICHKHAM WHERE MaNV  IN (SELECT MANV FROM deleted)
					DECLARE @PHIEUKHAM VARCHAR(15) = (select max(MaNV) from nhanvien where MaNV not in (select manv from PHIEUKHAM) and MaNV like '%bsi%')
				UPDATE PHIEUKHAM SET MaNV= @PHIEUKHAM WHERE MANV IN (SELECT MANV FROM deleted )
					DECLARE @HOADON VARCHAR(15) = (select max(MaNV) from nhanvien where MaNV not in (select manv from HOADONTHUOC) and MaNV like '%yta%')
				UPDATE HOADONTHUOC SET MaNV= @HOADON WHERE MANV IN (SELECT MANV FROM deleted )
				DECLARE @DICHVU VARCHAR(15) =( select max(MaNV) from nhanvien where MaNV not in (select manv from DICHVU) and MaNV like '%yta%')
				UPDATE DICHVU SET MaNV= @HOADON WHERE MANV IN (SELECT MANV FROM deleted )
				DECLARE @VIENPHI VARCHAR(15) = (select max(MaNV) from nhanvien where MaNV not in (select manv from VIENPHI) and MaNV like '%yta%')
				UPDATE VIENPHI SET MaNV= @VIENPHI WHERE MANV IN (SELECT MANV FROM deleted )
					DECLARE @LOAITHIETBI VARCHAR(15) = (select max(MaNV) from nhanvien where MaNV not in (select manv from LOAITHIETBI) and MaNV like '%yta%')
				UPDATE LOAITHIETBI SET MaNV= @LOAITHIETBI WHERE MANV IN (SELECT MANV FROM deleted )
				DELETE FROM NHANVIEN WHERE MaNV in (select MaNV from deleted)
END
	
delete from NHANVIEN where MaNV = 'yta21'
select*from NHANVIEN

	 SELECT*FROM PHONG
-- ==============================================================PHONG

-- XÓA PHÒNG
GO
DROP TRIGGER IF EXISTS TR_DELETE_ROOM
GO
CREATE TRIGGER TR_DELETE_ROOM ON PHONG INSTEAD OF DELETE
AS
			BEGIN
			DECLARE @MAPHONG VARCHAR(15) = (SELECT MAX(MaPhong) FROM  PHONG WHERE MaPhong NOT IN (SELECT MaPhong FROM NHANVIEN ))
				UPDATE NHANVIEN SET MaPhong = @MAPHONG WHERE MaPhong IN (SELECT MaPhong FROM deleted )
				DECLARE @MATB VARCHAR(15) = (SELECT MAX(MaPhong) FROM  PHONG WHERE MaPhong NOT IN (SELECT MaPhong FROM THIETBI ))
				UPDATE THIETBI SET MaPhong = @MATB WHERE MaPhong IN (SELECT MaPhong FROM deleted )
				DECLARE @MBA VARCHAR(15) = (SELECT MAX(MaPhong) FROM  PHONG WHERE MaPhong NOT IN (SELECT MaPhong FROM BENHAN ))
				UPDATE BENHAN SET MaPhong = @MATB WHERE MaPhong IN (SELECT MaPhong FROM deleted )
				delete from PHONG WHERE MaPhong IN (SELECT MaPhong FROM deleted)
			END

			
-- THÊM PHÒNG
Drop trigger if exists  TR_ADD_ROOM
GO
CREATE TRIGGER TR_ADD_ROOM ON PHONG
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (MaPhong,1,1) from PHONG where MaPhong  in (Select MaPhong from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaPhong,2,3) as int)+1) from PHONG)
		Update PHONG set MaPhong = CONCAT(@macv,'0',@maduoi) where MaPhong in (Select MaPhong from inserted)
END
INSERT INTO PHONG VALUES
('P000',N'Phòng tiếp nhận bênh nhân',NULL,7,N'Tiêu chuẩn')
DELETE FROM PHONG where MaPhong = 'P34'
SELECT*FROM PHONG


-- ========================================== BENH NHAN

-- Thêm bệnh nhân
GO
Drop trigger if exists  TR_ADD_USER
GO
CREATE TRIGGER TR_ADD_USER ON BENHNHAN
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING(MaBN,1,2) from BENHNHAN where MaBN  in (Select MaBN from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaBN,3,2) as int)+1) from BENHNHAN)
		Update BENHNHAN set MaBN = CONCAT(@macv,@maduoi) where MaBN in (Select MaBN from inserted)
END
go


-- delete
DROP TRIGGER IF EXISTS TR_DELETES_HOADONTHUOC
GO
CREATE TRIGGER  TR_DELETES_HOADONTHUOC ON HOADONTHUOC INSTEAD OF DELETE
AS
BEGIN
				DELETE FROM BENHAN WHERE MaDT IN (SELECT MaDT FROM deleted)
				DELETE FROM VIENPHI WHERE MaDT IN(SELECT MaDT FROM deleted)
				DELETE FROM HOADONCHITIET WHERE MaDT IN (SELECT MaDT FROM deleted)
				DELETE FROM HOADONTHUOC WHERE  MaDT IN (SELECT MaDT FROM deleted)
END

DROP TRIGGER IF EXISTS TR_DELETE_USER
GO
CREATE TRIGGER TR_DELETE_USER ON BENHNHAN INSTEAD OF DELETE
AS
BEGIN
			DELETE FROM HOADONTHUOC WHERE MaBN IN (SELECT MaBN FROM deleted)
				DELETE FROM PHIEUKHAM WHERE MaBN IN (SELECT MaBN FROM deleted)
				DELETE FROM BENHAN WHERE MaBN IN (SELECT MaBN FROM deleted)
			DELETE FROM DANHSACHDICHVU WHERE MaBN IN (SELECT MaBN FROM deleted)
				DELETE FROM VIENPHI WHERE MaBN IN (SELECT MaBN FROM deleted)
						DELETE FROM LICHKHAM WHERE MaBN IN (SELECT MaBN FROM deleted)
				DELETE FROM BENHNHAN WHERE MaBN IN (SELECT MaBN FROM deleted)
END
delete FROM BENHNHAN WHERE MaBN  = 'BN21'
--SELECT*FROM BENHNHAN
--SELECT*fROM PHIEUKHAM
--SELECT*FROM BENHAN
--SELECT*fROM DANHSACHDICHVU
--SELECT*fROM LICHKHAM
--SELECT*FROM HOADONTHUOC
--select*from DICHVU

SET IDENTITY_INSERT DANHSACHDICHVU ON

--  = = = ==============================================================DICHVU
-- thêm DICHVU
gO
Drop trigger if exists  TR_ADD_BED
GO
CREATE TRIGGER TR_ADD_BED ON DICHVU
FOR INSERT AS
BEGIN
		declare @macv nvarchar(2) = (Select SUBSTRING (MaDV,1,2) from DICHVU where MaDV  in (Select MaDV from inserted) )
		declare @maduoi int = (Select max(cast(SUBSTRING(MaDV,3,2) as int)+1) from DICHVU)
		Update DICHVU set MaDV = CONCAT(@macv,@maduoi) where MaDV in (Select MaDV from inserted)
END
INSERT INTO DICHVU VALUES	
('DV',N'Soi da',15000000,'yta07',N'Đang hoạt động')
SELECT*FROM DICHVU

-- XOA DICHVU
CREATE TABLE DELETE_DICHVU
(
	MaDV nchar(15) not null,
	TenDV nvarchar(45) not null,
	PhiDV float not null,
	MaNV nchar(15) null,
	TrangThaiDV nvarchar(25) not null,
	NgayXoa date not null
)
GO 
DROP TRIGGER IF EXISTS TR_DELETE_SERVICE
GO
CREATE TRIGGER TR_DELETE_SERVICE
ON DICHVU
INSTEAD OF DELETE
AS
	 DELETE FROM DICHVU WHERE MaDV  = null;
  
	 INSERT INTO DELETE_DICHVU SELECT D.* , NGAYXOA = GETDATE() FROM deleted D;
	 DELETE FROM DANHSACHDICHVU WHERE MaDV IN (SELECT MaDV FROM DELETED)
	 DELETE FROM DICHVU WHERE MaDV IN (SELECT MaDV FROM DELETED)

delete from DICHVU WHERE MaDV = 'DV01'
SELECT *FROM DICHVU
SELECT*FROM DANHSACHDICHVU

select*from phieukham

TR_DELETE_DK_SERVICE

-- ====================================================== DANH SACH DICH VU


-- XOA DANHSACHDICHVU

DROP TRIGGER IF EXISTS TR_DELETE_DK_SERVICE
GO
CREATE TRIGGER TR_DELETE_DK_SERVICE
ON DANHSACHDICHVU
INSTEAD OF DELETE
AS
	 DELETE FROM DANHSACHDICHVU WHERE ID IN (SELECT ID FROM deleted)
	
go
delete from DANHSACHDICHVU WHERE ID = '1'
SELECT *FROM DICHVU
SELECT*FROM BENHNHAN
SELECT*FROM DANHSACHDICHVU

-- 
drop PROCEDURE if exists  VIEHDCT
go
CREATE PROCEDURE VIEHDCT  @MaDT NVARCHAr(10)
AS
BEGIN
SELECT MaHDCT,MaDT ,TenThuoc, HOADONCHITIET.SoLuong, DonGia,HOADONCHITIET.SoLuong*DonGia as Tien 
FROM HOADONCHITIET  
INNER JOIN THUOC
ON HOADONCHITIET.MaThuoc = THUOC.MaThuoc
where MaDT = @MaDT
END
select * from hoadonchitiet


INSERT INTO NHANVIEN VALUES
('bsi55',N'chiến',1,'1998-03-01',N'Đường Giải Phóng, Phường Tân Lợi, Thành phố Buôn Ma Thuật, Đắk LắK',N'huy98@gmail.com','064123248734',N'Khoa Nhi',N'Y tá',N'Đại học','huy.png','2020-12-03','K4','0909331232','P022')

select * from NHANVIEN
select * from TAIKHOAN

drop PROCEDURE if EXISTS LichSuBA
go
CREATE PROCEDURE LichSuBA  @MaBN NVARCHAr(10)
AS
BEGIN
SELECT BA.NgayKham ,BA.DauHieuBenh , BA.XetNghiem , ChuanDoan ,BA.HoTenNV, BA.GhiChu
FROM BENHNHAN BN
INNER JOIN BENHAN BA
ON BN.MaBN = BA.MaBN
where	BN.MaBN = @MaBN
END

execute LichSuBA 'BN14'


select * from VIENPHI

select * from PHIEUKHAM
delete from PHIEUKHAM where MaPk = 'PK02'

--INSERT INTO PHIEUKHAM  VALUES
--('PK02','2021-09-12',N'Khó tiêu, đau bụng','08:30:00','P012','BN01','bsi03')

select * from HOADONCHITIET
select * from THUOC
select * from THUOC_DELETE
select MAX(MaHDCT) from HOADONCHITIET
select * from HOADONTHUOC

INSERT INTO HoaDonChiTiet (MaHDCT , SoLuong , LieuDung , MaThuoc , MaDT) VALUES('CT31','3',N'Cả Ngày','TH020','DT99')

select * from THUOC
select * from hoadonthuoc
select * from hoadonchitiet

SELECT * FROM HOADONCHITIET

--select * from BENHNHAN WHERE MABN 

--SELECT BA.NgayKham ,BA.DauHieuBenh , BA.XetNghiem , ChuanDoan ,BA.HoTenNV, BA.GhiChu
--FROM BENHNHAN BN
--INNER JOIN THUOC BA

--ON BN.MaBN = BA.MaBN

drop PROCEDURE if EXISTS LichSuThuoc
go
CREATE PROCEDURE LichSuThuoc  @MaBN NVARCHAr(10)
AS
BEGIN
SELECT T.TenThuoc , HDCT.SoLuong , HDCT.LieuDung 
FROM BENHNHAN BN
INNER JOIN BENHAN BA
ON BN.MaBN = BA.MaBN INNER JOIN HOADONTHUOC HDT  ON  BA.MaDT = HDT.MaDT INNER JOIN HOADONCHITIET HDCT  ON  HDCT.MaDT = HDT.MaDT INNER JOIN THUOC T  ON  T.MaThuoc = HDCT.MaThuoc
where	BN.MaBN = @MaBN
END

execute LichSuThuoc 'BN01'

select * from PHIEUKHAM
--INSERT INTO NHANVIEN VALUES
--('yta33',N'Phạm Quang Huy',1,'1998-03-01',N'Đường Giải Phóng, Phường Tân Lợi, Thành phố Buôn Ma Thuật, Đắk LắK',N'huy98@gmail.com','064123248734',N'Khoa Nhi',N'Y tá',N'Đại học','huy.png','2020-12-03','K4','0909331232','P028')

--INSERT INTO PHIEUKHAM  VALUES
--('PK99','2021-09-12',N'Khó tiêu, đau bụng','08:30:00','P012','BN01','bsi03')


-- THỐNG KÊ LƯỢNG THUỐC  THEO THÁNG VÀ NĂM
DROP PROC IF EXISTS SP_ThongKe_BenhNhan_theothanggg 
GO
CREATE PROC SP_ThongKe_BenhNhan_theothanggg @THANG INT 
AS
BEGIN 
SELECT BN.HoTenBN , BN.DiaChi ,BA.ChuanDoan , BA.HoTenNV ,P.GiaPhong AS TienKham , BN.NgayKham   FROM BENHNHAN BN INNER JOIN BENHAN BA ON BN.MaBN = BA.MaBN inner join PHONG P ON P.MaPhong = BA.MaPhong where MONTH(BN.NgayKham) =  @THANG 
END

EXEC SP_ThongKe_BenhNhan_theothanggg 3 


DROP PROC IF EXISTS SP_ThongKe_BenhNhannnnn
GO
CREATE PROC SP_ThongKe_BenhNhannnnn  
AS
BEGIN 
SELECT BN.HoTenBN, BN.DiaChi ,BA.ChuanDoan , BA.HoTenNV ,P.GiaPhong AS TienKham , BN.NgayKham   FROM BENHNHAN BN INNER JOIN BENHAN BA ON BN.MaBN = BA.MaBN inner join PHONG P ON P.MaPhong = BA.MaPhong 
END
EXEC SP_ThongKe_BenhNhannnnn  
GO
DROP PROC IF EXISTS SP_ThongKe_LuongThuoc_DaBan
GO
CREATE PROC SP_ThongKe_LuongThuoc_DaBan @THANG INT , @NAM INT
AS
BEGIN 
SELECT C.MaThuoc , TenThuoc, SUM(C.SoLuong) as SL , D.NgayXuat    FROM HOADONCHITIET C INNER JOIN HOADONTHUOC D ON C.MaDT = D.MaDT inner join THUOC T ON C.MaThuoc = T.MaThuoc  GROUP BY T.MaThuoc, C.MaThuoc , TenThuoc, D.NgayXuat HAVING MONTH(NgayXuat) =  @THANG  and YEAR ( NgayXuat) = @NAM
END

EXEC SP_ThongKe_LuongThuoc_DaBan  7, 2021


--DROP PROC IF EXISTS SP_ThongKe_TiepNhan
--GO
--CREATE PROC SP_ThongKe_TiepNhan
--AS
--BEGIN 
--SELECT BN.HoTenBN , BA.HoTenNV ,P.GiaPhong AS TienKham , BN.NgayKham   FROM BENHNHAN BN INNER JOIN phieukham PK ON BN.MaBN = PK.MaBN inner join PHONG ON P.MaPhong = PK.MaPhong
--END
--EXEC SP_ThongKe_BenhNhan 


--select * from phieukham
--select * from PHONG
--select * from benhan
--select * from thietbi
--select * from DICHVU
select * from HOADONCHITIET


Drop trigger if exists  TR_ADD_MAHDCT
GO
CREATE TRIGGER TR_ADD_MAHDCT ON HOADONCHITIET
INSTEAD OF INSERT
AS
BEGIN
		declare @macv nvarchar(15) = (Select  MaHDCT  from inserted)
		declare @madau nvarchar(2) = 'CT'
		declare @maduoi int = (Select max(cast(SUBSTRING( MaHDCT ,3,2) as int)+1) from HOADONCHITIET)
		set	@macv   = CONCAT(@madau,@maduoi) 
		insert into HOADONCHITIET (MaHDCT,SoLuong,LieuDung,MaThuoc,MaDT) select MaHDCT = @macv, i.Soluong, i.LieuDung,i.MaThuoc,i.MaDT from inserted i where @macv not in (select MaHDCT from HOADONCHITIET )
		
END






-- ------------------------------------------------------------- -- 
--              Tính Tiền										--

DROP PROC IF EXISTS TIENTHUOC
GO
CREATE PROC TIENTHUOC @MaDT nchar(15)
AS
BEGIN 
SELECT  DISTINCT  SUM(HDCT.SoLuong * THUOC.DonGia )  AS GIA
	FROM  HOADONCHITIET  HDCT JOIN THUOC ON  HDCT.MaThuoc = THUOC.MaThuoc GROUP BY MaDT HAVING MaDT = @MaDT
END

EXEC TIENTHUOC  'DT14'

select * from benhan
-- ------------------------------------------------------------- -- 
DROP PROC IF EXISTS TIENDICHVU
GO
CREATE PROC TIENDICHVU  @MaBN nchar(15)
AS
BEGIN 
SELECT DISTINCT MaBN,  SUM(PhiDV)  AS GIADV 
	FROM  DANHSACHDICHVU  DS JOIN DICHVU ON DICHVU.MaDV = DS.MaDV where TrangThai = 'yes'
	GROUP BY PHIDV , MaBN HAVING MaBN = @MaBN
END

EXEC TIENDICHVU  'BN14'

-- ------------------------------------------------------------- -- 

DROP PROC IF EXISTS TIENKHAM
GO
CREATE PROC TIENKHAM  @MaBN nchar(15)
AS
BEGIN 
SELECT DISTINCT  SUM(GiaPhong) AS GiaPhong 
		FROM  Phong  P  JOIN BENHAN BA ON P.MaPhong = BA.MaPhong  
		GROUP BY GiaPhong , MaBN  HAVING MaBN = @MaBN
END

EXEC TIENKHAM  'BN14'

-- ------------------------------------------------------------- --


select * from benhnhan

