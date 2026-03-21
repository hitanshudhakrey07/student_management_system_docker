/*
=================================================
FILE INFORMATION
=================================================
File Name     :001_create_role.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-20
Description   :created the `roles` table which stores system roles.
               this is the first table in the migration order
=================================================
*/
DROP TABLE IF EXISTS role CASCADE;

CREATE TABLE IF NOT EXISTS role(
     id SERIAL PRIMARY KEY,
     name VARCHAR(20) UNIQUE NOT NULL CHECK(name IN('superadmin','teacher','admin','manager','parent','student')),
     description TEXT,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE role IS 'system roles(superadmin,admin,manager,parent,student)';
COMMENT ON COLUMN role.id IS 'AUTO INCREMENTING ON PRIMARY KEY';
COMMENT ON COLUMN role.name IS 'UNIQUE ROLE NAME';
COMMENT ON COLUMN role.description IS 'OPTIONAL DESCRIPTION';
COMMENT ON COLUMN role.created_at IS 'utc timestamp when role is created';

-- ===========================================================
-- INITIAL DATA
================
INSERT INTO role (
  name,description
) VALUES
('superadmin','Full System Access'),
('admin','Administrative Staff'),
('manager','Limited Administrative Access'),
('teacher','LIMITED ADMINISTRATIVE ACCESS'),
('student','DEFAULT ROLE FOR STUDENT'),
('parent','PARENT BY GARDIAN ROLE')
ON CONFLICT (name) DO NOTHING;

select * from role
ERROR:  new row for relation "role" violates check constraint "role_name_check"
Failing row contains (12, superadmin, Full System Access, 2026-03-20 19:51:12.514713). 

SQL state: 23514
Detail: Failing row contains (12, superadmin, Full System Access, 2026-03-20 19:51:12.514713).
SELECT column_name,data_type,is_nullable,column_default
FROM information_schema.columns WHERE table_name = 'role';

SELECT obj_description('role'::regclass) AS table_comment;
SELECT column_name,pg_catalog.col_description(('role'::regclass)::oid,ordinal_position) AS column_comment
FROM information_schema.columns WHERE table_name = 'role'
ORDER BY ordinal_position;