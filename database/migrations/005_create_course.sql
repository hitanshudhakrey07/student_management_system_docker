/*
=================================================
FILE INFORMATION
=================================================
File Name     :005_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `course` table for acadmic courses
               This is the fifth table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS course(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL,
    description TEXT,
    duration_years INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_course_code ON course(code);
CREATE INDEX idx_course_is_active ON course(is_active);

COMMENT ON TABLE course IS 'acadmic course offered(e.g.,b.tech cse)';
COmMENT ON COLUMN course.name IS 'full couse name';
COMMENT ON COLUMN course.code IS 'unique course code';
COMMENT ON COLUMN course.duration_years IS 'number of year for the course';
COMMENT ON COLUMN course.is_active IS 'whether the course is offered or not';

