/*
=================================================
FILE INFORMATION
=================================================
File Name     :013_create_class_advisor.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-22
Description   :created the `class_advisor` table 
=================================================
*/
CREATE TABLE IF NOT EXISTS class_advisor(
    id SERIAL PRIMARY KEY,
    staff_id INTEGER NOT NULL,
	section_id INTEGER NOT NULL,
    academic_session_id INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_class_advisor_staff FOREIGN KEY (staff_id) REFERENCES staff(id) ON DELETE CASCADE,
    CONSTRAINT fk_class_advisor_section FOREIGN KEY (section_id) REFERENCES section(id) ON DELETE CASCADE,
    CONSTRAINT fk_class_advisor_academic_session FOREIGN KEY (academic_session_id) REFERENCES academic_session(id),
    CONSTRAINT unique_class_advisor UNIQUE (staff_id, section_id, academic_session_id,semester)
);

 CREATE INDEX idx_class_advisor_staff_id ON class_advisor(staff_id);
 CREATE INDEX idx_class_advisor_section_id ON class_advisor(section_id);
 CREATE INDEX idx_class_advisor_acadmic_session_id ON class_advisor(academic_session_id);
 CREATE INDEX idx_class_advisor_semester ON class_advisor(semester);
 CREATE INDEX idx_class_advisor_is_active ON class_advisor(is_active);

COMMENT ON TABLE class_advisor IS 'class advisor asignment for a section and semester';
COMMENT ON COLUMN class_advisor.staff_id  IS'references staff.id';
COMMENT ON COLUMN class_advisor.section_id  IS 'refeences section.id';
COMMENT ON COLUMN class_advisor.academic_session_id IS 'academic session.id';                       
COMMENT ON COLUMN class_advisor.semester  IS 'semster number 1 t0 8';
COMMENT ON COLUMN class_advisor.is_active IS 'whether this assignment is active or not';
COMMENT ON COLUMN class_advisor.assigned_at IS 'timestamp when the assignment was created';