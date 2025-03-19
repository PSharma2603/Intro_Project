E-Commerce Orders Tracking System

For this Rails project, we will develop an E-Commerce Orders Tracking System that allows users to browse products, place orders, and track transactions. The system will rely on three different data sources to populate its database:

 Fake Store API – Fetches real-world product details.
 Faker Gem – Generates fake orders and users.
 CSV File  – Stores additional product data.

 Data Structure and Integration
Our data sources contribute to different aspects of the database, which consists of six tables:


Categories - Faker / API	Stores product categories (One-to-Many with Products)
Products	API / CSV / Faker	Stores product details (Many-to-Many with Orders and Vendors)
Orders - Faker - Stores user orders (Many-to-Many with Products)
Users -	CSV	- Stores user details from a CSV file
Tags - Faker - Stores product tags (One-to-Many with Products)
Vendors	Faker - CSV	- Stores vendor details (Many-to-Many with Products)