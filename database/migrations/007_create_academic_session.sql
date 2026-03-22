/*
=================================================
FILE INFORMATION
=================================================
File Name     :007_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `acadmic_session` table for acadmics year by session 
               This is the seventh table in migration order.
=================================================
*/

CREATE TABLE IF NOT EXISTS academic_session(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_acadmic_session_name ON acadmic_session(name);  
CREATE INDEX idx_acadmic_session_is_active ON acadmic_session(is_active);
CREATE INDEX idx_acadmic_session_date ON acadmic_session(start_date,end_date);

COMMENT ON TABLE acadmic_session IS 'acadmic years by session (2025-26)';
COMMENT ON COLUMN acadmic_session.name IS 'session name,unique';
COMMENT ON COLUMN acadmic_session.start_date IS 'start date of the session';
COMMENT ON COLUMN acadmic_session.end_date IS 'end date of the session';
COMMENT ON COLUMN acadmic_session.is_active IS 'whether this is the current active session or not';


