
CREATE DATABASE IF NOT EXISTS eazydeals;

USE eazydeals;
CREATE TABLE admin (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(50),
    phone VARCHAR(20),
    PRIMARY KEY (id)
);
desc admin;

CREATE TABLE user (
    userid INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(45),
    password VARCHAR(45),
    phone VARCHAR(20),
    gender VARCHAR(20),
    registerdate TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    address VARCHAR(250),
    city VARCHAR(100),
    pincode VARCHAR(10),
    state VARCHAR(100),

    PRIMARY KEY (userid),
    UNIQUE (email),
    UNIQUE (phone)
);

CREATE TABLE category (
    cid INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    image VARCHAR(100),

    PRIMARY KEY (cid)
);

CREATE TABLE product (
    pid INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(500),
    price VARCHAR(20) NOT NULL,
    quantity INT,
    discount INT,
    image VARCHAR(100),
    cid INT,

    PRIMARY KEY (pid),

    CONSTRAINT fk_product_category
    FOREIGN KEY (cid)
    REFERENCES category(cid)
);

CREATE TABLE cart (
    id INT NOT NULL AUTO_INCREMENT,
    uid INT,
    pid INT,
    quantity INT,

    PRIMARY KEY (id),

    CONSTRAINT fk_cart_user
    FOREIGN KEY (uid)
    REFERENCES user(userid),

    CONSTRAINT fk_cart_product
    FOREIGN KEY (pid)
    REFERENCES product(pid)
);

CREATE TABLE `order` (
    id INT NOT NULL AUTO_INCREMENT,
    orderid VARCHAR(100),
    status VARCHAR(100),
    paymentType VARCHAR(100),
    userId INT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT fk_order_user
    FOREIGN KEY (userId)
    REFERENCES user(userid)
);

CREATE TABLE ordered_product (
    oid INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    quantity INT,
    price VARCHAR(45),
    image VARCHAR(100),
    orderid INT,

    PRIMARY KEY (oid),

    CONSTRAINT fk_ordered_product_order
    FOREIGN KEY (orderid)
    REFERENCES `order`(id)
);

CREATE TABLE wishlist (
    idwishlist INT NOT NULL AUTO_INCREMENT,
    iduser INT,
    idproduct INT,

    PRIMARY KEY (idwishlist),

    CONSTRAINT fk_wishlist_user
    FOREIGN KEY (iduser)
    REFERENCES user(userid),

    CONSTRAINT fk_wishlist_product
    FOREIGN KEY (idproduct)
    REFERENCES product(pid)
);

INSERT INTO admin
(id, name, email, password, phone)
VALUES
(1, 'Kumkum Solanki', 'test@gmail.com',
'abc123', '7755632012'),

(4, 'Akshay Kumar', 'test34@gmail.com',
'abc', '8565452152');

INSERT INTO user
(userid, name, email, password, phone,
gender, registerdate, address, city, pincode, state)

VALUES

(1, 'Anirudh Kumar', 'test786@gmail.com',
'abc123', '7546254260', 'Male',
'2023-09-24 05:22:11',
'KN nagar', 'Patna', '401980', 'Bihar'),

(3, 'Amit', 'amt677@gmail.com',
'abc', '8563201201', 'Male',
'2023-09-24 06:15:22',
'AJ', 'Banglore', '865012', 'Karnataka');

INSERT INTO category (cid, name, image)
VALUES

(1, 'Mobiles', 'mobiles.jpeg'),

(2, 'Appliances', 'appliances.png'),

(3, 'Laptops', 'newlaptop.jpeg'),

(4, 'Home & Furniture', 'home-furniture.png'),

(5, 'Books', 'books-.png'),

(6, 'Clothes & Fashion', 'cloths.png'),

(7, 'Electronics', 'electronics.png');

INSERT INTO product
(pid, name, description, price,
quantity, discount, image, cid)

VALUES

(1,
'SAMSUNG Galaxy F14 5G',
'Samsung smartphone with 6000 mAh battery',
'18490.0',
9, 24, 'phone1.jpeg', 1),

(2,
'LG 242 L Frost Free Double Door Refrigerator',
'LG refrigerator with Smart Inverter Compressor',
'37099.0',
50, 29, 'fridge1.jpeg', 2),

(3,
'OnePlus Y1S Pro 138 cm Ultra HD (4K) LED Smart Android TV',
'OnePlus 4K Smart Android TV',
'49999.0',
1, 18, 'tv1.jpeg', 2),

(8,
'Samsung Galaxy S23 5G',
'Samsung Galaxy S23 with Android 13 and 5G',
'79999.0',
10, 17, 'Samsung_Galaxy.jpg', 1),

(9,
'ASUS TUF Gaming A15',
'ASUS Gaming Laptop with 144Hz Display',
'71990.0',
11, 20, 'asus_tuf.jpeg', 3),

(10,
'Men Printed Casual Jacket',
'Printed casual jacket made from pure cotton',
'1999.0',
1, 57, 'men_jacket.jpeg', 6),

(12,
'boAt Airdopes 161 with 40 Hours Playback',
'Wireless Bluetooth earbuds',
'2400.0',
27, 42, 'boat-airdopes.jpeg', 7),

(13,
'KURLON Natural Product, Firm Support, Rutile 5 inch Queen Coir Mattress',
'Queen size firm support mattress',
'8000.0',
11, 16, 'mattress.jpeg', 4);

INSERT INTO cart
(id, uid, pid, quantity)

VALUES
(9, 1, 13, 1);

INSERT INTO `order`
(id, orderid, status, paymentType, userId, date)

VALUES

(1, 'ORD-20230924105716',
'Order Placed', 'COD', 1, '2023-09-24 05:27:16'),

(2, 'ORD-20230924110928',
'Order Placed', 'COD', 1, '2023-09-24 05:39:28'),

(3, 'ORD-20230924111023',
'Order Placed', 'COD', 1, '2023-09-24 05:40:23'),

(4, 'ORD-20230924111502',
'Order Placed', 'COD', 1, '2023-09-24 05:45:02'),

(5, 'ORD-20230924112315',
'Order Placed', 'COD', 1, '2023-09-24 05:53:15'),

(6, 'ORD-20230924115427',
'Order Placed', 'online', 1, '2023-09-24 06:24:27'),

(7, 'ORD-20230924115652',
'Order Placed', 'online', 1, '2023-09-24 06:26:52');

INSERT INTO ordered_product
(oid, name, quantity, price, image, orderid)

VALUES

(1, 'boAt Airdopes 161 with 40 Hours Playback',
1, '1392.0', 'boat-airdopes.jpeg', 3),

(2, 'OnePlus Y1S Pro 138 cm Ultra HD (4K) LED Smart Android TV',
1, '41000.0', 'tv1.jpeg', 4),

(3, 'ASUS TUF Gaming A15',
1, '57592.0', 'asus_tuf.jpeg', 5),

(4, 'Men Printed Casual Jacket',
1, '860.0', 'men_jacket.jpeg', 6),

(5, 'LG 242 L Frost Free Double Door Refrigerator',
1, '26341.0', 'fridge1.jpeg', 6),

(6, 'SAMSUNG Galaxy F14 5G',
1, '14053.0', 'phone1.jpeg', 7);

INSERT INTO wishlist
(idwishlist, iduser, idproduct)

VALUES
(3, 1, 10);

SELECT 'admin' AS table_name, COUNT(*) AS total
FROM admin

UNION ALL

SELECT 'user', COUNT(*) FROM user

UNION ALL

SELECT 'category', COUNT(*) FROM category

UNION ALL

SELECT 'product', COUNT(*) FROM product

UNION ALL

SELECT 'cart', COUNT(*) FROM cart

UNION ALL

SELECT 'order', COUNT(*) FROM `order`

UNION ALL

SELECT 'ordered_product', COUNT(*)
FROM ordered_product

UNION ALL

SELECT 'wishlist', COUNT(*) FROM wishlist;