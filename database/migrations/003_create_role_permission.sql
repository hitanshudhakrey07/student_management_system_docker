/*
=================================================
FILE INFORMATION
=================================================
File Name     :003_create_role_permission.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `role_permission` table which maps roles to permission
               This is the third table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS role_permission(
  id SERIAL PRIMARY KEY,
  role_id INTEGER NOT NULL,
  permission_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fK_role_permission_role FOREIGN KEY(role_id) REFERENCES role (id) ON DELETE CASCADE,
  CONSTRAINT fk_role_permission_permission FOREIGN KEY(permission_id) REFERENCES permission (id) ON DELETE CASCADE,
  CONSTRAINT unique_role_permission UNIQUE(role_id,permission_id)
);

COMMENT ON TABLE role_permission IS 'MAPS ROLES TO PERMISSION(many to many)';
COMMENT ON TABLE role_permission.id IS 'AUTO INCREMENTING PRIMARY KEY';
COMMENT ON TABLE role_permission.role_id IS 'FOREIGN KEY TO ROLE.ID';
COMMENT ON TABLE role_permission.permission_id IS 'FOREIGN KEY TO PERMISSION.ID';
COMMENT ON TABLE role_permission.created_at IS 'UTC TIMESTAMP WHEN THE MAPPING WAS CREATED';

CREATE INDEX IF NOT EXISTS idx_role_permission_role ON role_permission(role_id);
CREATE INDEX IF NOT EXISTS idx_role_permission_permission ON role_permission(permission_id);