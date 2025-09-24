create database bandienthoai

CREATE TABLE Dangky (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL
);

CREATE TABLE DienThoai (
    MaDienThoai INT PRIMARY KEY IDENTITY(1,1),  -- Mã điện thoại tự tăng
    TenDienThoai NVARCHAR(100) NOT NULL,        -- Tên điện thoại
    HangSanXuat NVARCHAR(50) NOT NULL,          -- Hãng sản xuất (ví dụ: Samsung, Apple)
    GiaBan DECIMAL(18, 2) NOT NULL,             -- Giá bán
    SoLuongTon INT NOT NULL,                    -- Số lượng tồn kho
    MoTa NVARCHAR(255),                         -- Mô tả thêm (tùy chọn)
    NgayNhap DATE NOT NULL,                     -- Ngày nhập hàng
    BaoHanh INT NOT NULL                        -- Thời gian bảo hành (tháng)
);

INSERT INTO DienThoai (TenDienThoai, HangSanXuat, GiaBan, SoLuongTon, MoTa, NgayNhap, BaoHanh)
VALUES
(N'iPhone 14 Pro Max 128GB', N'Apple', 29990000, 50, N'Hàng mới chính hãng', '2024-01-10', 12),
(N'iPhone 13 256GB', N'Apple', 21990000, 30, N'Mẫu cũ nhưng vẫn mạnh', '2024-01-12', 12),
(N'iPhone 12 64GB', N'Apple', 15990000, 20, N'Dành cho nhu cầu cơ bản', '2023-12-05', 12),
(N'Samsung Galaxy S24 Ultra', N'Samsung', 28990000, 40, N'Camera đỉnh cao', '2024-02-01', 24),
(N'Samsung Galaxy A54', N'Samsung', 8490000, 60, N'Máy tầm trung, pin tốt', '2024-03-15', 18),
(N'Samsung Galaxy Z Flip5', N'Samsung', 22990000, 15, N'Máy gập công nghệ mới', '2024-01-20', 12),
(N'Xiaomi 13T Pro', N'Xiaomi', 13990000, 25, N'Cấu hình mạnh giá tốt', '2024-01-25', 18),
(N'Xiaomi Redmi Note 12', N'Xiaomi', 4990000, 80, N'Phổ thông, bền bỉ', '2023-11-10', 12),
(N'POCO X5 Pro', N'Xiaomi', 7490000, 40, N'Dành cho game thủ tầm trung', '2024-02-10', 18),
(N'Oppo Find N3', N'Oppo', 26990000, 10, N'Máy gập cao cấp', '2024-03-01', 12),
(N'Oppo Reno10 5G', N'Oppo', 9990000, 35, N'Thiết kế sang trọng', '2024-02-28', 12),
(N'Oppo A58', N'Oppo', 4990000, 45, N'Dành cho học sinh', '2023-12-20', 12),
(N'Vivo V27e', N'Vivo', 6990000, 30, N'Máy mỏng nhẹ, selfie đẹp', '2024-01-30', 12),
(N'Vivo Y36', N'Vivo', 5490000, 50, N'Pin lớn, sạc nhanh', '2024-03-10', 12),
(N'Realme C55', N'Realme', 3990000, 70, N'Giá rẻ, hiệu năng tốt', '2023-11-25', 12),
(N'Realme 11 Pro+', N'Realme', 10990000, 20, N'Màn hình cong đẹp', '2024-02-05', 12),
(N'Asus ROG Phone 7', N'Asus', 23990000, 10, N'Máy chuyên game', '2024-02-15', 24),
(N'OnePlus 11', N'OnePlus', 18990000, 15, N'Mượt và cao cấp', '2024-01-18', 12),
(N'Nokia G22', N'Nokia', 3490000, 40, N'Máy phổ thông bền', '2023-12-28', 12),
(N'Nokia X30', N'Nokia', 8990000, 25, N'Máy trung cấp, Android thuần', '2024-01-22', 12),
(N'Itel A70', N'Itel', 1990000, 90, N'Máy siêu rẻ cho người lớn tuổi', '2024-03-12', 6),
(N'Tecno Spark 10 Pro', N'Tecno', 3990000, 60, N'Cấu hình ổn trong tầm giá', '2023-12-30', 6),
(N'iPhone SE 2022', N'Apple', 10990000, 18, N'Nhỏ gọn, chip mạnh', '2024-01-17', 12),
(N'Samsung Galaxy M14', N'Samsung', 4290000, 55, N'Pin 6000mAh, 5G', '2024-03-04', 12),
(N'Xiaomi 12T', N'Xiaomi', 11990000, 28, N'Máy mạnh, sạc siêu nhanh', '2024-01-27', 18),
(N'Realme Narzo 50A', N'Realme', 3490000, 45, N'Máy giá rẻ cho học sinh', '2023-12-18', 12),
(N'Vivo Y02s', N'Vivo', 2990000, 70, N'Pin ổn, giá mềm', '2023-11-15', 12),
(N'Asus Zenfone 10', N'Asus', 16990000, 12, N'Máy nhỏ cao cấp', '2024-01-08', 24),
(N'OnePlus Nord CE 3', N'OnePlus', 8490000, 30, N'Hiệu năng ổn, sạc nhanh', '2024-02-25', 12),
(N'Honor X8a', N'Honor', 5990000, 33, N'Màn hình lớn, camera tốt', '2024-03-08', 12);


CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY IDENTITY(1,1),        -- Mã đơn hàng tự tăng
    TenKhachHang NVARCHAR(100) NOT NULL,            -- Tên khách hàng
    SoDienThoai NVARCHAR(15) NOT NULL,              -- Số điện thoại khách
    DiaChi NVARCHAR(255) NOT NULL,                  -- Địa chỉ giao hàng
    MaDienThoai INT NOT NULL,                       -- Mã điện thoại (FK từ bảng DienThoai)
    SoLuong INT NOT NULL,                           -- Số lượng mua
    NgayDatHang DATE NOT NULL DEFAULT GETDATE(),    -- Ngày đặt hàng
    FOREIGN KEY (MaDienThoai) REFERENCES DienThoai(MaDienThoai)
);
