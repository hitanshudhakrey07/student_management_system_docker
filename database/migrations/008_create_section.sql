/*
=================================================
FILE INFORMATION
=================================================
File Name     :008_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `section` table for acadmic sections by group.
               This is the eighth table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS section(
    id SERIAL PRIMARY KEY,
    name VARCHAR(10) UNIQUE NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_section_name ON section(name);
CREATE INDEX idx_Section_is_active ON section(is_active);

COMMENT ON TABLE section IS 'section by group within a course and semester(e.g.,A,B,C)';
COMMENT ON COLUMN section.name IS 'section name,unique';
COMMENT ON COLUMN section.is_active IS 'whether the section is currently active or not';
