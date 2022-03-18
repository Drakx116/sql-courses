-- Clean database content

DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS facility;
DROP TABLE IF EXISTS member;

-- Tables creation

CREATE TABLE booking(
    id INTEGER NOT NULL,
    faculty_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    start_time TIMESTAMP WITHOUT TIME ZONE
--     end_time TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE facility (
    id INTEGER NOT NULL,
    name VARCHAR(64) NOT NULL,
    member_cost INTEGER NOT NULL,
    guest_cost INTEGER NOT NULL,
    initial_outlay NUMERIC,
    monthly_maintenance NUMERIC
);

CREATE TABLE member (
    id INTEGER NOT NULL,
    username VARCHAR(64),
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    zip_code INTEGER NOT NULL,
    recommended_by INTEGER,
    join_date TIMESTAMP WITHOUT TIME ZONE
);

-- Booking Slot field creation

ALTER TABLE booking ADD COLUMN slots INTEGER;
ALTER TABLE booking RENAME slots TO slot;
ALTER TABLE booking ALTER COLUMN slot TYPE VARCHAR(32);
