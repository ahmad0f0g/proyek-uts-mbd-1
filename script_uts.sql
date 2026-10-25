-- 1. Pembuatan Skema
CREATE SCHEMA SALAM;

-- 2. Pembuatan Tabel (Primary Key, Unique Constraint, Check Constraint)
CREATE TABLE SALAM.mahasiswas (
    nim VARCHAR(15) PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    nama VARCHAR(100) NOT NULL,
    ipk DECIMAL(3,2) CHECK (ipk >= 0.00 AND ipk <= 4.00)
);

-- 3. Pembuatan User Baru
CREATE USER backend_dev WITH PASSWORD 'backend123';
CREATE USER bi_dev WITH PASSWORD 'bidev123';
CREATE USER data_engineer WITH PASSWORD 'engineer123';

-- Memberikan izin akses dasar ke skema SALAM untuk semua user
GRANT USAGE ON SCHEMA SALAM TO backend_dev, bi_dev, data_engineer;

-- 4. Pengaturan Hak Akses (Role)
-- Role backend_dev: CRUD semua table
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- Role bi_dev: Hanya read/select semua table
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- Role data_engineer: CREATE, MODIFY, DROP semua objects, CRUD semua table
GRANT ALL PRIVILEGES ON SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;