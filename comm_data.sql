//catagorry
INSERT INTO comm_categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

//product
INSERT INTO comm_products (product_name, product_size, price, category_id, color) VALUES
('Smartphone', '6 inch', 599.99, 1, 'Black'),
('Laptop', '15 inch', 999.99, 1, 'Silver'),
('T-shirt', 'M', 19.99, 2, 'White'),
('Jeans', '32', 49.99, 2, 'Blue'),
('Novel', '300 pages', 14.99, 3, 'N/A');

//customer
INSERT INTO comm_customers (customer_name, address, email, phone) VALUES
('John Doe', '123 Main St, City', 'john@example.com', '123-456-7890'),
('Jane Smith', '456 Elm St, Town', 'jane@example.com', '987-654-3210');

//ORDER
INSERT INTO comm_orders (order_date, customer_id, amount, status) VALUES
(SYSTIMESTAMP, 1, 619.98, 'processing'),
(SYSTIMESTAMP - INTERVAL '1' DAY, 2, 1049.98, 'delivered');

//order details
INSERT INTO comm_order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 599.99),
(1, 3, 1, 19.99),
(2, 2, 1, 999.99),
(2, 4, 1, 49.99);

//cart
INSERT INTO comm_cart (customer_id, product_id, status, quantity, price) VALUES
(1, 5, 'active', '1', 14.99),
(2, 3, 'active', '2', 39.98);

//comments
INSERT INTO comm_reviews (customer_id, product_id, rating, content, review_date) VALUES
(1, 1, 5, 'Great smartphone!', SYSTIMESTAMP),
(2, 2, 4, 'Good laptop, but a bit expensive', SYSTIMESTAMP - INTERVAL '2' DAY);

//shipping
INSERT INTO comm_shipping_status (order_id, status, shipping_address) VALUES
(1, 'preparing', '123 Main St, City'),
(2, 'delivered', '456 Elm St, Town');