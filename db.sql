CREATE DATABASE IF NOT EXISTS education;
USE education;

-- Create Courses Table

-- Create Courses table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    duration VARCHAR(50) NOT NULL,
    description TEXT
) ENGINE=InnoDB;

-- Create Colleges table
CREATE TABLE Colleges (
    college_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Create Course_Colleges table (junction table)
CREATE TABLE Course_Colleges (
    course_id INT,
    college_id INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (college_id) REFERENCES Colleges(college_id),
    PRIMARY KEY (course_id, college_id)
) ENGINE=InnoDB;

-- Create Fees table
CREATE TABLE Fees (
    course_id INT PRIMARY KEY,
    fee_range VARCHAR(50) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ENGINE=InnoDB;

-- Create Eligibility table
CREATE TABLE Eligibility (
    course_id INT PRIMARY KEY,
    criteria TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ENGINE=InnoDB;

-- Create Career_Options table
CREATE TABLE Career_Options (
    course_id INT PRIMARY KEY,
    options TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ENGINE=InnoDB;

-- Create Application_Steps table
CREATE TABLE Application_Steps (
    course_id INT PRIMARY KEY,
    steps TEXT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ENGINE=InnoDB;

-- Insert sample data into Courses (expanded set of courses in Nepal)
INSERT INTO Courses (name, duration, description) VALUES
    ('BCA', '4 years', 'Bachelor of Computer Applications'),
    ('MBBS', '5.5 years', 'Bachelor of Medicine, Bachelor of Surgery'),
    ('Engineering', '4 years', 'Bachelor of Engineering'),
    ('MBA', '2 years', 'Master of Business Administration'),
    ('MA', '2 years', 'Master of Arts'),
    ('BSc CSIT', '4 years', 'Bachelor of Science in Computer Science and IT'),
    ('BBA', '4 years', 'Bachelor of Business Administration'),
    ('BHM', '4 years', 'Bachelor of Hotel Management'),
    ('BEd', '4 years', 'Bachelor of Education'),
    ('BPH', '4 years', 'Bachelor of Public Health'),
    ('BDS', '5 years', 'Bachelor of Dental Surgery'),
    ('BSc Nursing', '4 years', 'Bachelor of Science in Nursing'),
    ('BALLB', '5 years', 'Bachelor of Arts and Legislative Law'),
    ('BSc Forestry', '4 years', 'Bachelor of Science in Forestry'),
    ('Diploma in Pharmacy', '3 years', 'Diploma in Pharmacy'),
    ('PCL Nursing', '3 years', 'Proficiency Certificate Level in Nursing');

-- Insert sample data into Colleges (expanded set of colleges in Nepal)
INSERT INTO Colleges (name, location) VALUES
    ('Advance College', 'Kathmandu'),
    ('IOE Pulchowk', 'Lalitpur'),
    ('Kathmandu University', 'Kathmandu'),
    ('IOM', 'Kathmandu'),
    ('Tribhuvan University', 'Kathmandu'),
    ('Pokhara University', 'Pokhara'),
    ('Nepal Medical College', 'Kathmandu'),
    ('Nepal Law Campus', 'Kathmandu'),
    ('Kathmandu Model College', 'Kathmandu'),
    ('Lumbini Buddhist University', 'Lumbini'),
    ('Birendra Multiple Campus', 'Chitwan'),
    ('St. Xavier’s College', 'Kathmandu'),
    ('KIST College', 'Kathmandu'),
    ('Nepal Engineering College', 'Bhaktapur'),
    ('Manipal College of Medical Sciences', 'Pokhara');

-- Insert sample data into Course_Colleges (linking courses to colleges)
INSERT INTO Course_Colleges (course_id, college_id) VALUES
    (1, 1), (1, 5), (1, 9),  -- BCA: Advance College, TU, Kathmandu Model College
    (2, 4), (2, 7),  -- MBBS: IOM, Nepal Medical College
    (3, 2), (3, 3), (3, 14),  -- Engineering: IOE Pulchowk, KU, Nepal Engineering College
    (4, 5), (4, 3),  -- MBA: TU, KU
    (5, 5), (5, 6), (5, 10),  -- MA: TU, PU, Lumbini Buddhist University
    (6, 5), (6, 11),  -- BSc CSIT: TU, Birendra Multiple Campus
    (7, 5), (7, 13),  -- BBA: TU, KIST College
    (8, 6), (8, 12),  -- BHM: PU, St. Xavier’s College
    (9, 5), (9, 11),  -- BEd: TU, Birendra Multiple Campus
    (10, 4), (10, 7),  -- BPH: IOM, Nepal Medical College
    (11, 7), (11, 15),  -- BDS: Nepal Medical College, Manipal College
    (12, 7), (12, 5),  -- BSc Nursing: Nepal Medical College, TU
    (13, 8),  -- BALLB: Nepal Law Campus
    (14, 5),  -- BSc Forestry: TU
    (15, 5), (15, 7),  -- Diploma in Pharmacy: TU, Nepal Medical College
    (16, 5), (16, 7);  -- PCL Nursing: TU, Nepal Medical College

-- Insert sample data into Fees
INSERT INTO Fees (course_id, fee_range) VALUES
    (1, '300000-600000'), (2, '800000-1500000'), (3, '400000-800000'),
    (4, '300000-500000'), (5, '150000-300000'), (6, '300000-600000'),
    (7, '250000-500000'), (8, '200000-400000'), (9, '100000-250000'),
    (10, '200000-450000'), (11, '600000-1200000'), (12, '300000-600000'),
    (13, '200000-400000'), (14, '250000-500000'), (15, '150000-300000'),
    (16, '100000-200000');

-- Insert sample data into Eligibility
INSERT INTO Eligibility (course_id, criteria) VALUES
    (1, '50% in NEB +2 any stream'), 
    (2, '50% in NEB +2 with PCB and NEET'),
    (3, '45% in NEB +2 with PCM'), 
    (4, 'Bachelor’s degree with 50%'),
    (5, 'Bachelor’s degree with 45%'), 
    (6, '50% in NEB +2 with PCM'),
    (7, '50% in NEB +2 any stream'), 
    (8, '45% in NEB +2 any stream'),
    (9, '45% in NEB +2 any stream'), 
    (10, '50% in NEB +2 with science'),
    (11, '50% in NEB +2 with PCB'), 
    (12, '50% in NEB +2 with science'),
    (13, '45% in NEB +2 any stream'), 
    (14, '50% in NEB +2 with science'),
    (15, '45% in NEB +2 with science'), 
    (16, '40% in NEB +2 with science');

-- Insert sample data into Career_Options
INSERT INTO Career_Options (course_id, options) VALUES
    (1, 'software developer, IT manager'), 
    (2, 'doctor, surgeon'),
    (3, 'civil engineer, software developer'), 
    (4, 'business manager, consultant'),
    (5, 'researcher, educator'), 
    (6, 'data analyst, programmer'),
    (7, 'business analyst, entrepreneur'), 
    (8, 'hotel manager, tourism expert'),
    (9, 'teacher, education consultant'), 
    (10, 'public health officer, researcher'),
    (11, 'dentist, oral surgeon'), 
    (12, 'nurse, healthcare administrator'),
    (13, 'lawyer, legal advisor'), 
    (14, 'forester, environmentalist'),
    (15, 'pharmacist, drug inspector'), 
    (16, 'nurse, clinical assistant');

-- Insert sample data into Application_Steps
INSERT INTO Application_Steps (course_id, steps) VALUES
    (1, '1. Pass entrance exam, 2. Submit +2 transcripts, 3. Apply by July'),
    (2, '1. Clear NEET, 2. Submit PCB scores, 3. Apply by April'),
    (3, '1. Pass IOE exam, 2. Submit PCM scores, 3. Apply by June'),
    (4, '1. Submit bachelor’s transcript, 2. Apply by May'),
    (5, '1. Submit bachelor’s transcript, 2. Apply by May/December'),
    (6, '1. Pass TU entrance, 2. Submit +2 scores, 3. Apply by August'),
    (7, '1. Pass entrance, 2. Submit +2 scores, 3. Apply by June'),
    (8, '1. Apply online, 2. Submit +2 scores, 3. Interview'),
    (9, '1. Submit +2 scores, 2. Apply by July'),
    (10, '1. Pass entrance, 2. Submit science scores, 3. Apply by May'),
    (11, '1. Clear entrance, 2. Submit PCB scores, 3. Apply by April'),
    (12, '1. Pass entrance, 2. Submit science scores, 3. Apply by June'),
    (13, '1. Submit +2 scores, 2. Apply by July'),
    (14, '1. Pass entrance, 2. Submit science scores, 3. Apply by August'),
    (15, '1. Submit +2 scores, 2. Apply by May'),
    (16, '1. Submit +2 scores, 2. Apply by June');



INSERT INTO Courses (name, duration, description)
VALUES ('BIT', '4 years', 'Bachelor of Information Technology');
SELECT course_id, name, duration, description FROM Courses;
SELECT course_id, name, duration, description FROM Courses WHERE name = 'BCA';
UPDATE Courses 
SET duration = '5 years', description = 'Updated Bachelor of Engineering'
WHERE name = 'Engineering';
DELETE FROM Courses WHERE name = 'BIT';
INSERT INTO Colleges (name, location)
VALUES ('Ace Institute of Management', 'Kathmandu');
SELECT college_id, name, location FROM Colleges;
SELECT college_id, name, location FROM Colleges WHERE name = 'IOE Pulchowk';
UPDATE Colleges 
SET location = 'Kathmandu Valley'
WHERE name = 'Kathmandu University';
DELETE FROM Colleges WHERE name = 'Ace Institute of Management';
INSERT INTO Course_Colleges (course_id, college_id)
VALUES ((SELECT course_id FROM Courses WHERE name = 'BCA'), 
        (SELECT college_id FROM Colleges WHERE name = 'Kathmandu University'));



SELECT co.name AS course, c.name AS college, c.location 
FROM Course_Colleges cc
JOIN Courses co ON cc.course_id = co.course_id
JOIN Colleges c ON cc.college_id = c.college_id;


SELECT c.name, c.location 
FROM Course_Colleges cc
JOIN Colleges c ON cc.college_id = c.college_id
WHERE cc.course_id = (SELECT course_id FROM Courses WHERE name = 'BCA');

UPDATE Course_Colleges 
SET college_id = (SELECT college_id FROM Colleges WHERE name = 'Tribhuvan University')
WHERE course_id = (SELECT course_id FROM Courses WHERE name = 'BCA') 
AND college_id = (SELECT college_id FROM Colleges WHERE name = 'Advance College');


DELETE FROM Course_Colleges 
WHERE course_id = (SELECT course_id FROM Courses WHERE name = 'BCA') 
AND college_id = (SELECT college_id FROM Colleges WHERE name = 'Kathmandu University');


INSERT INTO Fees (course_id, fee_range)
VALUES ((SELECT course_id FROM Courses WHERE name = 'BHM'), '150000-300000');

SELECT c.name, f.fee_range 
FROM Fees f
JOIN Courses c ON f.course_id = c.course_id;

SELECT fee_range FROM Fees 
WHERE course_id = (SELECT course_id FROM Courses WHERE name = 'BCA');

SELECT fee_range FROM Fees 
WHERE course_id = (SELECT course_id FROM Courses WHERE name = 'BCA');

UPDATE Fees 
SET fee_range = '350000-700000'
WHERE course_id = (SELECT course_id FROM Courses WHERE name = 'BCA');

INSERT INTO Eligibility (course_id, criteria)
VALUES ((SELECT course_id FROM Courses WHERE name = 'BHM'), '45% in NEB +2 any stream');