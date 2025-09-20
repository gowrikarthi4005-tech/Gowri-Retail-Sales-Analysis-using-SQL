create database sqlfinal;
CREATE TABLE sqlfinal.customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE sqlfinal.store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);


CREATE TABLE sqlfinal.staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE sqlfinal.products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE sqlfinal.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    store_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE sqlfinal.order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);





