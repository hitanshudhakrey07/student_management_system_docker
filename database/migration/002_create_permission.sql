/*
=================================================
FILE INFORMATION
=================================================
File Name     :002_create_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `permission` table which store gangular permission
               This is the second table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS permission(
    id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 
SELECT * FROM permission;

COMMENT ON TABLE permission IS 'granular permission that can be assigned to roles';
COMMENT ON column permission.id IS'auto incrementation primary key';
COMMENT ON COLUMN permission.name IS 'unique permission name e.g.,"student.view"';
COMMENT ON COLUMN permission.description IS 'optional';
COMMENT ON COLUMN permission.created_at IS 'utc timestamp when the permission was created';

SELECT obj_description('permission'::regclass) AS table_comment;
SELECT column_name,pg_catalog.col_description(('permission'::regclass)::oid,ordinal_position) AS column_comment
FROM information_schema.columns WHERE table_name = 'permission'
ORDER BY ordinal_position;

