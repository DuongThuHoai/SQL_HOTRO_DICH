﻿﻿create database BTL

drop table nhanuoc
create table NHANUOC
(
maqd char(10) not null primary key,
tientc int,
hoancanh nvarchar(100),
ngaynn date,
);

drop table NHAHAOTAM
create table NHAHAOTAM
(
manht char(10) not null primary key,
sdt int,
tennht nvarchar (100),
dcnht nvarchar(30),
loai nvarchar (10),
slnguoi_dahotro int,
sotienht int,
ngayht date
);

drop table HANGHOA
create table HANGHOA
(
mah char(10) primary key not null,
tenh nvarchar(20),
soluong char(10),
dv nvarchar (10),
dongia int
);

drop table DONVIXA
create table DONVIXA
(
maxa char(10) not null primary key,
tenxa nvarchar(50),
sotienx int,
soluongx nvarchar (20),
mah char (10) foreign key references hanghoa (mah),
maqd char (10) foreign key references nhanuoc(maqd),
manht char (10) foreign key references nhahaotam(manht)
);

drop table DOITUONGHOTRO
create table DOITUONGHOTRO
(
manguoinhan char(10) not null primary key,
tenngnhan nvarchar (50),
dc_ngnhan nvarchar(30),
soluonght char(20),
sotien_nhan int,
mah char(10) foreign key references hanghoa(mah),
maqd char(10) foreign key references nhanuoc(maqd),
manht char (10) foreign key references nhahaotam(manht)
);

drop table BENHVIEN
create table BENHVIEN
(
mabv char (10) not null primary key,
tenbv nvarchar (100) not null,
sotienbv int,
mah char (10) not null foreign key references hanghoa (mah),
soluongbv int,
maqd char (10) not null foreign key references nhanuoc(maqd),
manht char (10) not null foreign key references nhahaotam(manht)
);

drop table BACSI
create table BACSI
(
mabs char (10) not null primary key,
tenbs nvarchar (50),
sdt int,
gioitinh nvarchar (3),
ngsinh date,
luong int,
tienthuong int,
mabv char (10) foreign key references benhvien (mabv)
);

drop table DVVANCHUYEN
create table DVVANCHUYEN
(
madv char (10) not null primary key,
tendv nvarchar (100),
ngayvc date,
tenh nvarchar(30),
maqd char (10) foreign key references nhanuoc(maqd),
manht char (10) foreign key references nhahaotam(manht)
);

insert into NHANUOC 
values ('NN01', 50000000, N'hộ nghèo và cận nghèo', '6/2/2020'),
	   ('NN02', 60000000, N'hộ gia đình đang cách ly', '3/2/2020'),
	   ('NN03', 70000000, N'Bệnh viện có bệnh nhân đang mắc bệnh', '3/8/2020'),
	   ('NN04', 45000000, N'hộ gia đình có người đang được chữa trị', '4/25/2020'),
	   ('NN05', 40000000, N'hộ gia đình cần được giúp đỡ đột xuất', '5/3/2020'),
	   ('NN06', 20000000, N'bệnh viện có bệnh nhân đang cách ly', '8/1/2020')

insert into NHAHAOTAM 
values ('HT01', '5612', N'Hội chữ thập đỏ', N'Hà Nội', N'Tổ chức', 21, 50000000, '2/3/2020'),
	   ('HT02', '4123', N'Quỹ từ thiện UPS', N'TP.HCM', N'Tổ chức', 18, 30000000, '2/13/2020'),
	   ('HT03', '9812', N'Nguyễn Đức Cảnh', N'Thái Bình', N'Cá nhân', 13, 10000000, '3/4/2020'),
	   ('HT04', '5242', N'CTy Đầu tư và phát triển HK', N'Quảng Ninh', N'Cá nhân', 23, 30000000, '1/4/2020'),
	   ('HT05', '5234', N'KOPO', N'Nhật Bản', N'Tổ chức', 20, 40000000, '3/4/2020'),
	   ('HT06', '5184', N'VINGROUP', N'Hà Nội', N'Tổ chức', 30, 40000000, '5/4/2020')

insert into HANGHOA 
values ('H01', N'Gạo', 500, 'Kg', 21000),
	   ('H02', N'Trứng', 300, N'Quả', 3000),
       ('H03',N'Khẩu trang', 20000, N'Hộp', 60000),
       ('H04', N'Rau', 300, 'Bó', 7000),
       ('H05', N'Thuốc', 2000, N'Hộp', 200000),
       ('H06', N'Dụng cụ y tế', 800, N'Dụng cụ', 250000)

insert into DONVIXA (maxa, tenxa, sotienx, mah, soluongx, maqd, manht)
values ('X01', 'NN', 50000000, 'H01', 200, 'NN01', 'HT01'),
	   ('X02', 'TT', 30000000, 'H02', 100, 'NN02', 'HT02'),
       ('X03', 'HH', 40000000, 'H03', 90, 'NN03', 'HT03'),
	   ('X04', 'MT', 50000000, 'H04', 150, 'NN04', 'HT04'),
	   ('X05', 'QQ', 20000000, 'H05', 100, 'NN05', 'HT05'),
	   ('X06', 'LL', 45000000, 'H06', 100, 'NN06', 'HT06')

insert into DOITUONGHOTRO (manguoinhan, tenngnhan, dc_ngnhan, sotien_nhan, mah, soluonght, maqd, manht)
values ('DT01', 'AA', 'NN', 10000000, 'H01', 100, 'NN01', 'HT01'),
	   ('DT02', 'BB', 'TT', 8000000, 'H02', 50, 'NN02', 'HT02'),
       ('DT03', 'CC', 'HH', 2000000, 'H04', 10, 'NN03', 'HT03'),
	   ('DT04', 'DD', 'MT', 5000000, 'H03', 50, 'NN04', 'HT04'),
	   ('DT05', 'EE', 'QQ', 5000000, 'H05', 50, 'NN05', 'HT05'),
	   ('DT06', 'MM', 'LL', 4500000, 'H06', 50, 'NN06', 'HT06')

insert into BENHVIEN (mabv, tenbv, sotienbv, mah, soluongbv, maqd, manht)
values ('BV01', 'HN', 30000000, 'H01', 200, 'NN01', 'HT01'),
	   ('BV02', 'HT', 40000000, 'H02', 150, 'NN02', 'HT02'),
	   ('BV03', 'TH', 50000000, 'H03', 10500, 'NN03', 'HT03'),
	   ('BV04', 'PK', 10000000, 'H04', 140, 'NN04', 'HT04'),
	   ('BV05', 'CT', 20000000, 'H05', 1850, 'NN05', 'HT05'),
	   ('BV06', 'CC', 30000000, 'H06', 650, 'NN06', 'HT06')

insert into BACSI (mabs, tenbs, sdt, gioitinh, ngsinh, luong, mabv)
values ('BS01', N'Nguyễn Thành Nam', 7434, 'Nam', '4/2/1959', 10000000, 'BV01'),
       ('BS02', N'Mai Ngọc Bảo', 92811, N'Nữ', '5/8/1967', 40000000, 'BV02'),
	   ('BS03', N'Trịnh Cao Nguyên', 3284, 'Nam', '3/9/1983', 20000000, 'BV03'),
	   ('BS04',	N'Trần Hạo Hiên', 2824, 'Nam', '2/6/1974', 30000000, 'BV04'),
	   ('BS05',	N'Trần Nhật Hoa', 2590, N'Nữ', '4/9/1961', 12000000, 'BV05'),
	   ('BS06',	N'Nguyễn Thu Thủy', 26124, N'Nữ', '4/1/1969', 37000000, 'BV06')

insert into DVVANCHUYEN (madv, tendv, ngayvc, tenh, maqd, manht)
values ('VC01', 'HL', '5/2/2020', N'Gạo, rau', 'NN01', 'HT01'),
	   ('VC02', 'DT', '3/5/2020', N'Khẩu trang', 'NN02', 'HT02'),
	   ('VC03', 'HR', '4/7/2020', N'Thuốc', 'NN03', 'HT03'),
	   ('VC04', 'PK', '3/26/2020', N'Gạo, trứng', 'NN04', 'HT04'),
	   ('VC05', 'TC', '4/23/2020', N'Dụng cụ y tế', 'NN05', 'HT05'),
	   ('VC06', 'YY', '4/21/2020', N'Dụng cụ y tế', 'NN06', 'HT06')

select *
from NHANUOC;
select * 
from NHAHAOTAM;
select *
from HANGHOA;
select *
from DONVIXA;
select *
from DOITUONGHOTRO;
select *
from BENHVIEN;
select *
from BACSI 
select *
from DVVANCHUYEN;

/*tạo 1 view để tổng hợp thông tin người nhận được hỗ trợ gồm tên người nhận, hoàn cảnh 
cùng với số tiền tổng = tiền trợ cấp của nhà nước + tiền của nhà hảo tâm rồi trừ cho số lượng hàng nhân đơn giá , 
tên hàng của 2 bên nhà nước và nhà hảo tâm , tongtienht = slng_dahotro * sotienht là tổng tiền mà nhà hảo tâm bỏ ra cứu trợ*/
create view tonghop 
as
select top (99.99) percent DOITUONGHOTRO.tenngnhan, NHANUOC.hoancanh, NHANUOC.tientc, HANGHOA.tenh, 
(NHANUOC.tientc + NHAHAOTAM.sotienht ) - (HANGHOA.soluong * HANGHOA.dongia) as thanhtien_tong, 
NHAHAOTAM.slnguoi_dahotro * NHAHAOTAM.sotienht as tongtien_ht
from NHAHAOTAM, NHANUOC, HANGHOA, DOITUONGHOTRO
where DOITUONGHOTRO.mah = HANGHOA.mah and DOITUONGHOTRO.maqd = NHANUOC.maqd and DOITUONGHOTRO.manht = NHAHAOTAM.manht
order by thanhtien_tong desc 
select * from tonghop

/* tạo 1 view thống kê tên hàng, tổng tiền = soluong*dongia, ngày vận chuyển và ngày hỗ trợ 
trong đó ta lấy ra top của 60 % theo ngày vận chuyển tăng dần */

create view  van_chuyen
as
select top (60) percent DVVANCHUYEN.tenh, hanghoa.soluong*hanghoa.dongia as tong_tien, dc_ngnhan, ngayvc, ngayht 
from DOITUONGHOTRO, DVVANCHUYEN, NHAHAOTAM, HANGHOA
where DVVANCHUYEN.manht = NHAHAOTAM.manht and DOITUONGHOTRO.manht = NHAHAOTAM.manht and DOITUONGHOTRO.mah = HANGHOA.mah  
order by ngayvc asc
select * from van_chuyen

/* tạo 1 trigger khi cập nhật trường số lượng mà số lượng nhập vào nhân với đơn giá của mã hàng đó không được 
vượt quá 50,000,000VNĐ, nếu thì in ra 'Quá số tiền cho phép'
*/

create trigger capnhat
on hanghoa for update  
as
if update(soluong)
begin
	if (select soluong*dongia from inserted )>=50000000
		begin
			print N'Quá số tiền cho phép!';
			rollback tran
		end
	else 
		begin 
			print N'Update thành công!' 
		end
end
	update HANGHOA set soluong = 300 where mah = 'H03'

/* tạo 1 trigger không được phép xóa những bác sĩ có tuổi lớn hơn 25*/
create trigger xoa_tt
on bacsi for delete
as
begin
	declare @count int = 0
	select @count = count(*) from deleted
	where year(getdate()) - year(deleted.ngsinh) > 25
	if(@count > 0)
	begin
		print N'Không được phép xóa!'
		rollback tran
		end
end
delete from BACSI where mabs = 'BS06'

/*tạo 1 stored procedure để tự động thêm mã bác sĩ tiếp theo theo tứ tự tăng dần*/
--drop proc 
create proc mabs_tieptheo
as begin
	declare @mabs char(10)='BS01'
	declare @i int 
	set @i = 1
	while exists(select mabs from BACSI where @mabs = mabs)
	begin
		set @i = @i + 1
		set @mabs = 'BS' + REPLICATE('0', 2 - len(cast(@i as char))) + cast(@i as char)
		-- replicate là lệnh tạo chuỗi lặp 00 
	end
	print  N'Mã bác sĩ tiếp theo : '+ @mabs
end
exec mabs_tieptheo
/*
tạo 1 stored procedure dùng để them dữ liệu vào bảng hàng hóa với điều kiện là mah không được trùng 
và số lượng hàng không được quá 700 
*/
create proc  capnhat_hh (@mah char(10), @tenh nvarchar(20), @soluong int, @dv nvarchar, @dongia int)
as
begin
if(exists(select * from HANGHOA where @mah = mah))
	print N'ohh no ! Mã bị trùng mất rồi!'
else
begin
	if(select soluong from HANGHOA where @soluong = soluong)>=700
		print N'Quá số lượng cho phép!'
	else
		insert into HANGHOA values (@mah, @tenh, @soluong, @dv, @dongia)
end
end
exec capnhat_hh 'H08', null, 900, null, null

/*Tạo 1 function đưa ra các thông tin tên đv, tên xã, tên hàng, số lượng, đơn giá, tổng tiền = (dongia*soluong) + 150,000đ
-150,000đ là tiền thuê xe , ngày vận chuyển, ngày vận chuyển rơi vào thứ mấy, nếu ngày vận chuyển vào thứ năm in ra có mưa 
còn lại là nắng, khoảng cách giữa các ngày nhà nước ra quyết định và nhà hảo tâm hỗ trợ */
create function thongtin_hh ()
returns @bang1 table (tendv nvarchar(100), tenxa nvarchar(50), tenhang nvarchar(30), soluong int, dongia int, tongtien float,
ngayvanchuyen date, Thu_ngayvc nvarchar(20), du_bao_tt nvarchar(60), khoangcach_nn int, khoangcach_ht int)
as begin
insert into @bang1
select DVVANCHUYEN.tendv, DONVIXA.tenxa, DVVANCHUYEN.tenh, HANGHOA.soluong, HANGHOA.dongia, 
(dongia * soluong) + 150000,
DVVANCHUYEN.ngayvc,
case datepart(WEEKDAY, ngayvc)
when 2 then N'Thứ hai' 
when 3 then N'Thứ Ba' 
when 4 then N'Thứ Tư' 
when 5 then N'Thứ Năm' 
when 6 then N'Thứ Sáu' 
when 7 then N'Thứ Bảy' 
when 1 then N'Chủ Nhật' end,
case datepart(WEEKDAY, ngayvc)
when 2 then N'Trời nắng' 
when 3 then N'Trời nắng' 
when 4 then N'Trời nắng' 
when 5 then N'Có mưa, chú ý cẩn thận' 
when 6 then N'Trời nắng' 
when 7 then N'Trời nắng' 
when 1 then N'Trời nắng' end,
datediff(dd, ngayvc, ngaynn),
datediff(dd, ngayvc, ngayht)
from (((DONVIXA  inner join HANGHOA  on DONVIXA.mah = HANGHOA.mah) inner join NHANUOC on DONVIXA.maqd = NHANUOC.maqd)
inner join NHAHAOTAM on DONVIXA.manht = NHAHAOTAM.manht) inner join DVVANCHUYEN on NHANUOC.maqd = DVVANCHUYEN.maqd
and NHAHAOTAM.manht = DVVANCHUYEN.manht
return 
end
select * from dbo.thongtin_hh()

/*Tạo 1 function đưa ra thông tin bao gồm mã Bs, Tên bác sĩ, giới tính, Tuổi, ngày sinh rơi vào thứ mấy và đã tới tuổi nghỉ
hưu hay chưa - nam trên 59 nghỉ hưu, nữ trên 54 tuổi nghỉ hưu */
create function tuoi_sn_bs()
returns @bang table (Ma_bs char(10), Ten nvarchar(50), Gioitinh nvarchar(3), Tuoi int, Thu nvarchar(20), Nghi_huu nvarchar(60))
as begin
insert into @bang
select mabs, tenbs, gioitinh, 
DATEDIFF(YYYY, ngsinh, GETDATE()),
case datepart(WEEKDAY, ngsinh)
when 2 then N'Thứ hai' 
when 3 then N'Thứ Ba' 
when 4 then N'Thứ Tư' 
when 5 then N'Thứ Năm' 
when 6 then N'Thứ Sáu' 
when 7 then N'Thứ Bảy' 
when 1 then N'Chủ Nhật' end,
case
	when DATEDIFF(YYYY, ngsinh, GETDATE()) >= 60 and gioitinh = N'Nam' then N'Đã tới tuổi nghỉ hưu'
	when DATEDIFF(YYYY, ngsinh, GETDATE()) < 60 and gioitinh = N'Nam' then N'Chưa tới tuổi nghỉ hưu'
	when DATEDIFF(YYYY, ngsinh, GETDATE()) >= 55 and gioitinh = N'Nữ' then N'Đã tới tuổi nghỉ hưu'
	when DATEDIFF(YYYY, ngsinh, GETDATE()) < 55 and gioitinh = N'Nữ' then N'Chưa tới tuổi nghỉ hưu'
end
from BACSI
 return 
 end
 select * from dbo.tuoi_sn_bs() 

/*transaction cập nhật số tiền trong bảng đơn vị xã tương ywsng với số lượng người được hỗ trợ */
select * from DONVIXA 

begin tran 
	update DONVIXA set sotienx = soluongx * 300000 where sotienx < (soluongx * 300000)
waitfor delay '00:00:05'
rollback tran

begin tran 
 if (select (soluonght+sotienht) from NHAHAOTAM, NHANUOC, DOITUONGHOTRO)

/*
begin tran 
set tran isolation level read committed
select * from DONVIXA
commit tran
*/

 begin tran 
 if exists(select * from BACSI where mabs in (select mabs from BACSI) )
	begin 
		declare @bv_cu char(10)
		select @bv_cu = mabv from  BACSI where mabs = 'BS01'
		update BACSI set mabv = 'BV02' where mabs = 'BS01'
		select @bv_cu = mabv from  BACSI where mabs = 'BS02'
		update BACSI set mabv = 'BV01' where mabs = 'BS02'
		commit tran
	end 
 else 
	print N'Không có BS01'
	rollback tran

/*Phân quyền bảo mật*/
sp_addlogin 'thu', 'thu'
exec sp_grantdbaccess 'thu', 'thu'
sp_addrole 'hoai'
sp_addrolemember 'hoai', 'thu'
grant all  on nhanuoc to hoai -- cấp tất cả quyền cho user 'thu' trong bảng NHANUOC, NHAHAOTAM, DVVANCHUYEN, HANGHOA
grant all  on NHAHAOTAM to hoai
grant all  on HANGHOA to hoai
grant all  on DVVANCHUYEN to hoai
grant all on tuoi_sn_bs to hoai
grant all on thongtin_hh to hoai
grant all on capnhat_hh to hoai
grant all on mabs_tieptheo to hoai
grant all on tonghop to hoai
grant all on van_chuyen to hoai

grant select on doituonghotro to hoai --cấp quyền select cho bảng doituonghotro
grant select,update  on donvixa  to hoai 
grant select,insert on bacsi to hoai -- cấp quyền insert  cho bảng BACSI
grant select on benhvien to hoai 

sp_revokedbaccess 'thu'
sp_droprole 'hoai'
sp_droplogin 'thu'