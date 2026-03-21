/*
=================================================
FILE INFORMATION
=================================================
File Name     :011_create_staff_attendence.sql
Developer     :Hitanshu Dhakrey
Contact       :hitanshudhakrey07@gmail.com
version       :1.0.0
Date          :2026-03-21
Description   :created the `staff_attendence` table for daily staff punch in by out.
               This is the eleventh table in migration order.
=================================================
*/
CREATE TABLE IF NOT EXISTS staff_attendence(
    id SERIAL PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    date DATE NOT NULL,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20) DEFAULT'Present' CHECK(status IN('Present','Absent','Late','Half Day','Leave')),
    remarks TEXT,
    recorded_by INTEGER ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_staff_attendence_staff FOREIGN KEY (staff_id) REFERENCES staff_id ON DELETE CASCADE,
    CONSTRAINT fk_staff_attendence_recorded_by FOREIGN KEY (recorded_by) REFERENCES staff_id ON DELETE SET NULL,
    CONSTRAINT unique_staff_attendence_date UNIQUE (staff_id,date)
);

 /*
     * CONSTRAINT fk_staff_attendence_staff FOREIGN KEY (staff_id) REFERENCES staff_id ON DELETE CASCADE;
     * when a record in the `staff` table is deleted , all rows in staff_attendence that refered to that staff_id are automatically as deleted as well.
     * eg.,if a staff member leaves the institution and we remove there record from staff ,we also want to remove their attendence history (since it no longer exist).This keeps the database clean
 */

 /*
   * CONSTRAINT fk_staff_attendence_recorded_by FOREIGN KEY (recorded_by) REFERENCES staff_id ON DELETE SET NULL;
   * when a staff member who recorded an attendence is deleted ,the recorded by column in_staff_attendence is set to NULL instead of deleting the attendence record eg., The attendence itself is still useful(it tells us a staff member was present and absent) even if the person who recorded it is no longer in the system.We don't want to loss that data,so we just set the recorded_by reference to NULL

 */

 /*
    * CONSTRAINT unique_staff_attendence_date UNIQUE (staff_id,date);
    * Ensure that for a given staff_id and date,there can be only row in the table
    * eg., a staff member should have only one attendence record per day no duplicate.This prevents accidental duplicate entries for the same day.
 
 */
 /*
    * NULL vs NOT NULL
    * NULL means"no value" or unknown .It's not the same as empty string or zero.A column can be defined as NULL(the default value if you don't specify) or NOT NULL
    * NOT NULL forces a column to always have a value. YOu cannot insert a row without providing a value for that column.
    * IN our above table
    *  staff_id is NOT NULL (implicitly because it is a foreign key without set NULL and we have ON DELETE CASCADE).
 */
 CREATE INDEX idx_staff_attendence_staff_id ON staff_attendence(staff_id);
 CREATE INDEX idx_staff_attendence_date ON staff_attendence(date);
 CREATE INDEX idx_staff_attendence_status ON staff_attendence(status);
  
COMMENT ON TABLE staff_attendence IS 'daily attendence records for staff(punch in by out)';
COMMENT ON COLUMN staff_attendence.staff_id IS 'references staff.id';
COMMENT ON COLUMN staff_attendence.date IS 'attendence date';
COMMENT ON COLUMN staff_attendence.check_in IS 'punch in time';
COMMENT ON COLUMN staff_attendence.check_out IS 'punch out time';
COMMENT ON COLUMN staff_attendence.status IS 'attendence status';
COMMENT ON COLUMN staff_attendence.recorded_by IS 'staff who recorded this(system , HR)';


