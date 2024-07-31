CREATE TABLE comm_products (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    product_name VARCHAR2(255),
    product_size VARCHAR2(255),
    price NUMBER,
    category_id NUMBER,
    color VARCHAR2(255),
    CONSTRAINT comm_products_pk PRIMARY KEY (id)
);

CREATE TABLE comm_categories (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    category_name VARCHAR2(255),
    CONSTRAINT comm_categories_pk PRIMARY KEY (id)
);

CREATE TABLE comm_orders (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    order_date TIMESTAMP,
    customer_id NUMBER,
    amount NUMBER,
    status VARCHAR2(20) CHECK (status IN ('delivered', 'received', 'processing')),
    CONSTRAINT comm_orders_pk PRIMARY KEY (id)
);

CREATE TABLE comm_reviews (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    customer_id NUMBER,
    product_id NUMBER,
    rating NUMBER,
    content VARCHAR2(255),
    review_date TIMESTAMP,
    CONSTRAINT comm_reviews_pk PRIMARY KEY (id)
);

CREATE TABLE comm_customers (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    customer_name VARCHAR2(255),
    address VARCHAR2(255),
    email VARCHAR2(255),
    phone VARCHAR2(255),
    CONSTRAINT comm_customers_pk PRIMARY KEY (id)
);

CREATE TABLE comm_cart (
    cart_id NUMBER GENERATED ALWAYS AS IDENTITY,
    customer_id NUMBER,
    product_id NUMBER,
    status VARCHAR2(255),
    quantity VARCHAR2(255),
    price NUMBER,
    CONSTRAINT comm_cart_pk PRIMARY KEY (cart_id)
);

CREATE TABLE comm_shipping_status (
    shipping_id NUMBER GENERATED ALWAYS AS IDENTITY,
    order_id NUMBER,
    status VARCHAR2(255),
    shipping_address VARCHAR2(255),
    CONSTRAINT comm_shipping_status_pk PRIMARY KEY (shipping_id)
);

CREATE TABLE comm_order_details (
    order_detail_id NUMBER GENERATED ALWAYS AS IDENTITY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    unit_price NUMBER,
    CONSTRAINT comm_order_details_pk PRIMARY KEY (order_detail_id)
);

ALTER TABLE comm_products ADD CONSTRAINT fk_products_category
    FOREIGN KEY (category_id) REFERENCES comm_categories(id);

ALTER TABLE comm_reviews ADD CONSTRAINT fk_reviews_customer
    FOREIGN KEY (customer_id) REFERENCES comm_customers(id);

ALTER TABLE comm_reviews ADD CONSTRAINT fk_reviews_product
    FOREIGN KEY (product_id) REFERENCES comm_products(id);

ALTER TABLE comm_orders ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES comm_customers(id);

ALTER TABLE comm_cart ADD CONSTRAINT fk_cart_product
    FOREIGN KEY (product_id) REFERENCES comm_products(id);

ALTER TABLE comm_cart ADD CONSTRAINT fk_cart_customer
    FOREIGN KEY (customer_id) REFERENCES comm_customers(id);

ALTER TABLE comm_shipping_status ADD CONSTRAINT fk_shipping_order
    FOREIGN KEY (order_id) REFERENCES comm_orders(id);

ALTER TABLE comm_order_details ADD CONSTRAINT fk_order_details_order
    FOREIGN KEY (order_id) REFERENCES comm_orders(id);

ALTER TABLE comm_order_details ADD CONSTRAINT fk_order_details_product
    FOREIGN KEY (product_id) REFERENCES comm_products(id);