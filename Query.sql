CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255),
    category_image VARCHAR(255)
);

CREATE TABLE product (
    id BIGINT NOT NULL,
    `language` VARCHAR(255) NOT NULL,
    product_code VARCHAR(255),
    product_name VARCHAR(255),
    product_image VARCHAR(255),
    product_thumbnail VARCHAR(255),
    product_price DOUBLE,
    product_description TEXT,
    product_gender VARCHAR(50), -- enum Gender: 'Male', 'Female'
    product_size VARCHAR(255),  -- ví dụ: 'SIZE_39,SIZE_40,SIZE_41'
    category_id INT,
    PRIMARY KEY (id, `language`),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE role (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    enabled BOOLEAN NOT NULL,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(512),
    phonenumber VARCHAR(50)
);

CREATE TABLE users_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    customer_name VARCHAR(255),
    address VARCHAR(255),
	 email VARCHAR(255),
    phone VARCHAR(20),
    total_price DOUBLE,
    user_id BIGINT,
	 status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE order_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    language VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_product FOREIGN KEY (product_id, language) REFERENCES product(id, language)
);
INSERT INTO category (category_name,category_image) VALUES ('Nike','Nike.jpg');

INSERT INTO product (
    id,
    language,
    product_code,
    product_name,
    product_image,
    product_thumbnail,
    product_price,
    product_description,
    product_gender,
    product_size,
    category_id
) VALUES
(1, 'vi', 'NIKE001', 'Giày Nike Air Max', 'images/nike_airmax.jpg', 'thumbs/nike_airmax_thumb.jpg', 2499000, 'Giày Nike Air Max dành cho nam, phong cách thể thao và thời trang.', 'MALE', 'SIZE_40,SIZE_41,SIZE_42', 1),
(1, 'en', 'NIKE001', 'Nike Air Max Shoes', 'images/nike_airmax.jpg', 'thumbs/nike_airmax_thumb.jpg', 100, 'Nike Air Max shoes for men, sporty and stylish.', 'MALE', 'SIZE_40,SIZE_41,SIZE_42', 1),

(2, 'vi', 'NIKE002', 'Giày Nike Air Force 1', 'images/nike_af1.jpg', 'thumbs/nike_af1_thumb.jpg', 2599000, 'Giày Nike Air Force 1 dành cho nữ, thiết kế cổ điển.', 'FEMALE', 'SIZE_36,SIZE_37,SIZE_38', 1),
(2, 'en', 'NIKE002', 'Nike Air Force 1 Shoes', 'images/nike_af1.jpg', 'thumbs/nike_af1_thumb.jpg', 104, 'Classic Nike Air Force 1 for women.', 'FEMALE', 'SIZE_36,SIZE_37,SIZE_38', 1),

(3, 'vi', 'NIKE003', 'Giày Nike ZoomX Vaporfly', 'images/nike_zoomx.jpg', 'thumbs/nike_zoomx_thumb.jpg', 4899000, 'Giày chạy bộ hiệu suất cao dành cho nam.', 'MALE', 'SIZE_41,SIZE_42,SIZE_43', 1),
(3, 'en', 'NIKE003', 'Nike ZoomX Vaporfly Shoes', 'images/nike_zoomx.jpg', 'thumbs/nike_zoomx_thumb.jpg', 196, 'High-performance running shoes for men.', 'MALE', 'SIZE_41,SIZE_42,SIZE_43', 1),

(4, 'vi', 'NIKE004', 'Giày Nike Blazer Mid', 'images/nike_blazer.jpg', 'thumbs/nike_blazer_thumb.jpg', 2099000, 'Giày cổ cao dành cho nữ, phong cách vintage.', 'FEMALE', 'SIZE_36,SIZE_38,SIZE_39', 1),
(4, 'en', 'NIKE004', 'Nike Blazer Mid Shoes', 'images/nike_blazer.jpg', 'thumbs/nike_blazer_thumb.jpg', 84, 'Vintage-style high-top sneakers for women.', 'FEMALE', 'SIZE_36,SIZE_38,SIZE_39', 1),

(5, 'vi', 'NIKE005', 'Giày Nike React Infinity', 'images/nike_react.jpg', 'thumbs/nike_react_thumb.jpg', 3299000, 'Thiết kế tối ưu cho vận động viên nam.', 'MALE', 'SIZE_40,SIZE_42,SIZE_44', 1),
(5, 'en', 'NIKE005', 'Nike React Infinity Shoes', 'images/nike_react.jpg', 'thumbs/nike_react_thumb.jpg', 132, 'Optimized design for male athletes.', 'MALE', 'SIZE_40,SIZE_42,SIZE_44', 1),

(6, 'vi', 'NIKE006', 'Giày Nike Court Vision Low', 'images/nike_court.jpg', 'thumbs/nike_court_thumb.jpg', 1899000, 'Giày nữ phong cách bóng rổ nhẹ nhàng.', 'FEMALE', 'SIZE_35,SIZE_36,SIZE_37', 1),
(6, 'en', 'NIKE006', 'Nike Court Vision Low Shoes', 'images/nike_court.jpg', 'thumbs/nike_court_thumb.jpg', 76, 'Lightweight basketball-inspired shoes for women.', 'FEMALE', 'SIZE_35,SIZE_36,SIZE_37', 1),

(7, 'vi', 'NIKE007', 'Giày Nike SB Dunk Low', 'images/nike_sb.jpg', 'thumbs/nike_sb_thumb.jpg', 2899000, 'Thiết kế thời trang đường phố cho nam.', 'MALE', 'SIZE_41,SIZE_42,SIZE_43', 1),
(7, 'en', 'NIKE007', 'Nike SB Dunk Low Shoes', 'images/nike_sb.jpg', 'thumbs/nike_sb_thumb.jpg', 116, 'Street-style design for men.', 'MALE', 'SIZE_41,SIZE_42,SIZE_43', 1),

(8, 'vi', 'NIKE008', 'Giày Nike Free RN', 'images/nike_free.jpg', 'thumbs/nike_free_thumb.jpg', 2199000, 'Giày nữ siêu nhẹ, linh hoạt cho chạy bộ.', 'FEMALE', 'SIZE_36,SIZE_37,SIZE_38', 1),
(8, 'en', 'NIKE008', 'Nike Free RN Shoes', 'images/nike_free.jpg', 'thumbs/nike_free_thumb.jpg', 88, 'Ultra-light running shoes for women.', 'FEMALE', 'SIZE_36,SIZE_37,SIZE_38', 1),

(9, 'vi', 'NIKE009', 'Giày Nike Pegasus Trail', 'images/nike_pegasus.jpg', 'thumbs/nike_pegasus_thumb.jpg', 3399000, 'Giày chạy địa hình dành cho nam.', 'MALE', 'SIZE_42,SIZE_43,SIZE_44' , 1),
(9, 'en', 'NIKE009', 'Nike Pegasus Trail Shoes', 'images/nike_pegasus.jpg', 'thumbs/nike_pegasus_thumb.jpg', 134, 'Trail running shoes for men.', 'MALE', 'SIZE_42,SIZE_43,SIZE_44', 1),

(10, 'vi', 'NIKE010', 'Giày Nike Air Huarache', 'images/nike_huarache.jpg', 'thumbs/nike_huarache_thumb.jpg', 2999000, 'Thiết kế hiện đại, cá tính dành cho nữ.', 'FEMALE', 'SIZE_36,SIZE_38,SIZE_39', 1),
(10, 'en', 'NIKE010', 'Nike Air Huarache Shoes', 'images/nike_huarache.jpg', 'thumbs/nike_huarache_thumb.jpg', 120, 'Modern and bold design for women.', 'FEMALE', 'SIZE_36,SIZE_38,SIZE_39', 1);

INSERT INTO role (`name`) VALUES ('ROLE_ADMIN'),('ROLE_USER');
INSERT INTO users (username,`password`,enabled,firstname,lastname,email,address,phonenumber) 
VALUES ('admin','$2a$12$B8/5j/d./GRlUmHTMoq.TOCKUD3UoR8yk1Hh6pth0EyKy7CVkmqX6',1,'admin','admin','admin@gmail.com',NULL,NULL),
		 ('guest','$2a$12$B8/5j/d./GRlUmHTMoq.TOCKUD3UoR8yk1Hh6pth0EyKy7CVkmqX6',1,'guest','guest','guest@gmail.com',NULL,NULL);
		 
INSERT INTO users_roles (user_id,role_id) VALUES (1,1), (2,2);

