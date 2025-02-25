CREATE DATABASE IF NOT EXISTS education;
USE education;

-- Create Courses Table
CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration VARCHAR(50),
    min_fees INT,
    max_fees INT,
    description TEXT
);

-- Create Colleges Table
CREATE TABLE IF NOT EXISTS colleges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    ranking INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Create Scholarships Table
CREATE TABLE IF NOT EXISTS scholarships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    eligibility TEXT,
    amount INT,
    deadline DATE
);

-- Insert sample data
INSERT INTO courses (name, duration, min_fees, max_fees, description) 
VALUES ('BCA', '4 Years', 200000, 600000, 'Bachelor in Computer Applications');

INSERT INTO colleges (name, location, ranking, course_id) 
VALUES ('ABC College', 'Kathmandu', 5, 1);

INSERT INTO scholarships (name, eligibility, amount, deadline) 
VALUES ('Merit Scholarship', '80%+ in +2', 50000, '2025-06-30');
