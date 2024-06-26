CREATE DATABASE PolyOEAsg;
GO
USE PolyOEAsg;
GO
-- Tạo bảng Users
CREATE TABLE Users (
    Username varchar(30) PRIMARY KEY,
    FullName nvarchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL,
    Email nvarchar(50) NOT NULL,
    Admin bit NOT NULL
);

-- Tạo bảng Videos
CREATE TABLE Videos (
    VideoId varchar(50) PRIMARY KEY,
    Title nvarchar(50) NOT NULL,
	Genre nvarchar(100) NOT NULL,
	Duration time NOT NULL ,
    Poster nvarchar(100) NOT NULL,
	VideoLink nvarchar(1500) NOT NULL,
    Views int NOT NULL,
    Description nvarchar(max) NULL,
    Active bit NOT NULL
);

-- Tạo bảng Favorites
CREATE TABLE Favourites (
    FavoriteId int identity(1,1) PRIMARY KEY,
    Username varchar(30) NOT NULL,
    VideoId varchar(50) NOT NULL,
    LikedDate date NOT NULL,
    CONSTRAINT FK_Favorites_Users FOREIGN KEY (Username) REFERENCES Users(Username),
    CONSTRAINT FK_Favorites_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId),
	--Mỗi user chỉ được yêu thích mỗi video một lần (tức là VideoId và UserId phải duy nhất)
	CONSTRAINT UC_Favourite_Video UNIQUE (Username, VideoId)
);

-- Tạo bảng Shares
CREATE TABLE Shares (
    ShareId int identity(1,1) PRIMARY KEY,
    Username varchar(30) NOT NULL,
    VideoId varchar(50) NOT NULL,
    Emails nvarchar(250) NOT NULL,
    SharedDate date NOT NULL,
    CONSTRAINT FK_Shares_Users FOREIGN KEY (Username) REFERENCES Users(Username),
    CONSTRAINT FK_Shares_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId)
);

-- Tạo bảng Comments
CREATE TABLE Comments (
    CommentId int identity(1,1) PRIMARY KEY,
    Username varchar(30) NOT NULL,
    VideoId varchar(50) NOT NULL,
    CommentText nvarchar(1000) NOT NULL,
    CommentDate datetime NOT NULL,
    CONSTRAINT FK_Comments_Users FOREIGN KEY (Username) REFERENCES Users(Username),
    CONSTRAINT FK_Comments_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId)
);

-- Tạo bảng Ratings
CREATE TABLE Ratings (
    RatingId int identity(1,1) PRIMARY KEY,
    Username varchar(30) NOT NULL,
    VideoId varchar(50) NOT NULL,
    Rating int NOT NULL,
    RatedDate datetime NOT NULL,
    CONSTRAINT FK_Ratings_Users FOREIGN KEY (Username) REFERENCES Users(Username),
    CONSTRAINT FK_Ratings_Videos FOREIGN KEY (VideoId) REFERENCES Videos(VideoId),
	CONSTRAINT UC_Ratings_Video UNIQUE (Username, VideoId) -- mỗi user chỉ được đánh giá mỗi video 1 lần
);

GO
-- Thêm dữ liệu mẫu vào bảng Users
INSERT INTO Users (Username, FullName, Password, Email, Admin) VALUES
('linhncpd07633', N'Nguyễn Chí Linh', '123', 'linhncpd07633@fpt.edu.vn', 0),
('trangle', N'Lê Quỳnh Trang', '123', 'lethiquynhtrang1902@gmail.com', 0),
('linhnguyen', N'Linh Lì Lợm', '123', 'linhli2k4@gmail.com', 0),
('admin', N'Admin', '123', 'linhncpd07633@fpt.edu.vn', 1);

-- Thêm dữ liệu mẫu vào bảng Videos
INSERT INTO Videos (VideoId, Title, Genre, Duration, Poster, VideoLink, Views, Description, Active) VALUES
('SLA_VAM', N'Vĩnh An Mộng', N'Trung quốc đại lục, Kiếm hiệp, Lãng mạn, Cổ trang', '00:43:41', 'uploads/SLA_VAM.jpg', 'https://www.youtube.com/embed/BuhmBC40igo?si=WP8jK6F008Psrpy7', 1000, N'Tại kinh đô Vĩnh An, con kênh đào phía Tây thành bị sập khiến đô quan thượng thư Thẩm Văn Kỳ phụ trách công trình phải chịu tội sau một đêm, lâm vào cảnh lao tù. Tổ vỡ trứng cũng tan tành, hai cô con gái của Thẩm gia là Thẩm Nhiễm và Thẩm Chân cũng lần lượt sa lầy. Nhất là cô con gái út Thẩm Chân xưa nay được nuôi dưỡng nơi khuê các, không rành thế sự, giờ đây phải lang thang đầu đường, khó tự bảo vệ bản thân. Lúc này đình úy Lục Thời Nghiên phụ trách điều tra vụ án cũng bối rối vì thường xuyên mơ thấy mình và một nữ tử bí ẩn có quan hệ dây mơ rễ má. Sau khi xác minh, nữ tử bí ẩn xuất hiện trong mơ không ai khác chính là Thẩm Chân, con gái của tội thần. Lục Thời Nghiên từng bước tiếp cận cô, cũng từng bước đi về phía vận mệnh bí ẩn. Xoay quanh vụ án kênh đào phía Tây thành, cả hai cùng trải qua sinh tử, trao nhau lòng tin, cắm sâu rễ tình. Lục Thời Nghiên cũng không phụ sự phó thác, điều tra ra chân tướng vụ án dưới sự giúp đỡ của Thẩm Chân. Thế nhưng, kẻ chủ mưu thực sự lại đang âm thầm tiếp cận hai người.', 1),
('SLB_DPH', N'Dữ Phượng Hành', N'Thần thoại, Lãng mạn, Hài hước', '00:45:07', 'uploads/SLB_DPH.jpg', 'https://www.youtube.com/embed/uNEuUuSvhd4?si=D-w1NXUhtuJIJ5dD', 1800, N'Dữ Phượng Hành là một tác phẩm tiên hiệp đáng xem, hội tụ toàn tinh hoa đỉnh cao. Phim nhanh chóng trở thành bậc nhất trong năm 20241. Dựa trên tiểu thuyết nổi tiếng Bổn Vương Ở Đây, bộ phim xoay quanh tình yêu bị cấm cản giữa Thẩm Ly (nữ vương của Ma giới) và Hành Chỉ (vị thần thượng cổ duy nhất còn lại của Thiên Ngoại Thiên). Thẩm Ly bị thương nặng và trốn xuống nhân gian, nơi cô gặp Hành Chỉ và bắt đầu một cuộc sống đầy thú vị. Dữ Phượng Hành đã kết thúc với một kết cục trọn vẹn, để lại ấn tượng sâu sắc cho khán giả4. Nếu bạn yêu thích tiên hiệp và tình yêu đầy cảm xúc, hãy xem bộ phim này! ', 1),
('SLC_KFPD', N'Kungfu Panda', N'Hoạt hình, Hành động, Hài hước, Thiếu nhi', '01:30:20', 'uploads/SLC_KFPD.jpg', 'https://www.youtube.com/embed/1ns0Osj9bHg?si=_tQptI9TXhknizgt', 1800, N'REVIEW PHIM KUNGFU PANDA PHẦN 1 || SAKURA REVIEW Công phu Gấu Trúc - Kung Fu Panda (2008) là câu chuyện về Po là một chú gấu trúc to béo, ham ăn và mê môn võ kungfu. Trong một ngày hội, lời tiên tri từ xưa đã giúp Po có thể thực hiện ước mơ của mình. Po được học với sư phụ Shifu và nhóm Ngũ Hùng. Nhưng vấn đề ở chỗ cậu chàng lại là kẻ lười biếng nhất thung lũng Thanh Bình. Và rồi mọi chuyện hoàn toàn thay đổi khi con báo tuyết gian ác Tai Lung trốn thoát khỏi tù. Hắn ráo riết lên kế hoạch tấn công thung lũng. Và người anh hùng được chọn để chiến đấu chống lại Tai Lung, không ai khác chính là Po béo. Một đội ngũ hùng hậu những bậc thầy kungfu được huy động để hướng dẫn Po những miếng võ cơ bản nhất…', 1),
('SLD_CDMLCT', N'Cô đi mà lấy chồng tôi', N'Hàn quốc, Review phim, Kịch tính, Cảm động', '00:44:10', 'uploads/SLD_CDMLCT.jpg', 'https://www.youtube.com/embed/oYpZi3M9LZ4?si=S_5EqHTMQQ2Sgdn5', 1800, N'Kể về một bệnh nhân ung thư 37 tuổi Ji-won, cô bước vào gặp chồng và đồng thời là bạn thân của cô. Ji-won nhận ra rằng cuộc đời của mình đã đầy rẫy những lời nói dối. Điều tồi tệ hơn là cô phải trải qua cái chớt bi thảm dưới tay chính người chồng của mình.', 1),
('SLE_SLTK', N'Sau lời từ khước', N'Âm nhạc, Tình cảm, Cảm động', '00:04:11', 'uploads/SLE_SLTK.jpg', 'https://www.youtube.com/embed/Ta6yfXa2mDY?si=SzuUbLwgVhDhBEru', 1800, N'Phim xoay quanh cuộc sống của nữ chính tên Mai (Phương Anh Đào), nhân viên mát-xa gần 40 tuổi, tình cờ gặp nhạc công Dương (Tuấn Trần) và được anh săn đón. Tự ti bản thân, Mai không đủ dũng khí đón nhận tình cảm của chàng trai kém cô 7 tuổi. So với 2 bộ phim Nhà bà Nữ và Bố già, Mai của Trấn Thành ít nhận ý kiến trái chiều nhất.', 1),
('SLF_TVDT', N'Tây vực dị thú', N'Phim lẻ, Hành động, Viễn tưởng, Thần bí', '01:19:00', 'uploads/SLF_TVDT.jpg', 'https://www.youtube.com/embed/pWdcQ1NxBdI?si=R7bJpKg9GPN4Sry9', 1800, N'West Barbarian Beast - Bộ phim là cậu truyện về tiểu đội Chấn Ma Ti dũng cảm đánh bại tà giáo Vãng Sinh Giáo Tây Vực và Thú Chủ của bộ tộc Tây Phương vào năm thứ 40 của vương triều Đại Triệu. Đây là sự rèn luyện trưởng thành của các thành viên Chấn Ma Ti gồm Tiêu Chấn, Ninh Vô Mưu, Hoa Vô Thường, Quan Sấm. Đây là một trong bộ phim cổ trang kiếm hiệp hay nhất Trung Quốc với nhiều lời khen ngợi cả về hình ảnh lẫn cốt chuyện. Kính mong các bạn đón xem!', 1);
-- Thêm dữ liệu mẫu vào bảng Favorites
INSERT INTO Favourites (Username, VideoId, LikedDate) VALUES
('linhnguyen', 'SLB_DPH', '2024-04-01'),
('trangle', 'SLB_DPH', '2024-04-02'),
('linhncpd07633', 'SLB_DPH', '2024-04-01');

-- Thêm dữ liệu mẫu vào bảng Shares
INSERT INTO Shares (Username, VideoId, Emails, SharedDate) VALUES
('linhnguyen', 'SLA_VAM', 'ncl22092004@gmail.com', '2024-04-01'),
('trangle', 'SLE_SLTK', 'nguyenchilinh.10b6.2020@gmail.com', '2024-04-02');

-- Thêm dữ liệu mẫu vào bảng Comments
--INSERT INTO Comments (Username, VideoId, CommentText, CommentDate) VALUES
--('linhnguyen', 'VD001', '!', '2024-04-02 10:30:00'),
--('user2', 'VD003', 'Nice work!', '2024-04-02 11:00:00'),
--('linhnguyen', 'VD002', 'Funny!', '2024-04-03 09:15:00');

-- Thêm dữ liệu mẫu vào bảng Ratings
INSERT INTO Ratings (Username, VideoId, Rating, RatedDate) VALUES
('linhnguyen', 'SLA_VAM', 5, '2024-04-01'),
('trangle', 'SLA_VAM', 4, '2024-04-02'),
('trangle', 'SLE_SLTK', 5, '2024-04-04'),
('linhnguyen', 'SLB_DPH', 4, '2024-04-02');


