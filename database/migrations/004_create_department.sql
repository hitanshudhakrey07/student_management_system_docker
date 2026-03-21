
/*
=================================================
FILE INFORMATION
=================================================
File Name     :004_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `department` table which maps roles to the department.
               This is the fourth table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS department(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT ,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_department_name ON department(name);
CREATE INDEX idx_department_is_active ON department(is_active);

COMMENT ON TABLE department IS 'originasational department(e.g.,CSE,ECE)';
COMMENT ON COLUMN department.name IS'unique department name';
COMMENT ON COLUMN department.description  IS 'brief description of the department';
COMMENT ON COLUMN department.is_active IS 'soft disable flag for department'
