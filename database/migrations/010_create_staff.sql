/*
=================================================
FILE INFORMATION
=================================================
File Name     :010_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `staff` table for staff member(teacher,admin,manager.
               This is the tenth table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS staff(
    id SERIAL PRIMARY KEY,
    employee_id VARCHAR(20) UNIQUE,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    gender VARCHAR(10) CHECK(gender IN('Male','Female','Other')), 
    blood_group VARCHAR(5) CHECK(blood_group IN('A+','A-','AB+','AB-','O+','Unknown')),
    martial_status VARCHAR(20) CHECK (martial_status IN('Single','Married','Divorced','Widowed')),
    date_of_birth DATE,
    aadhar_number VARCHAR(12) UNIQUE,
    pan_number VARCHAR(10) UNIQUE,
    pf_number VARCHAR(50),
    uan_number VARCHAR(50),
    address TEXT,
    permanent_address TEXT,
    joining_date DATE,
    relieving_date DATE,
    position VARCHAR(100),
    department_id INTEGER,
    reporting_to INTEGER,
    salary NUMERIC(12,2),
    emergency_contact_name VARCHAR(100),
    emergency_contact VARCHAR(15),
    work_phone VARCHAR(15),
    qualifications JSONB,
    bank_details JSONB,
    employee_status VARCHAR(20) DEFAULT 'Permanent' CHECK(employee_status IN('Permanent','Probation','Contract','Intern')),
    contract_end_date DATE ,
    is_teaching BOOLEAN DEFAULT FALSE,
    can_approval_leave BOOLEAN DEFAULT FALSE,
    hostel_id INTEGER,
    avatar_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    CONSTRAINT fk_staff_department FOREIGN KEY(department_id) REFERENCES department(id) ON DELETE CASCADE,
    CONSTRAINT fk_staff_reporting_to FOREIGN KEY(reporting_to) REFERENCES staff(id)

);
CREATE INDEX idx_staff_employee_id ON staff(employee_id);
CREATE INDEX idX_staff_department_id ON staff(department_id);
CREATE INDEX idx_staff_deleted_at ON staff(deleted_at) WHERE deleted_at IS NULL;

COMMENT ON TABLE staff IS 'all staffs members.Authenication handle by user table';