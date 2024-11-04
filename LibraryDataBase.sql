DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS copy; 
DROP TABLE IF EXISTS book; 
DROP TABLE IF EXISTS student;


CREATE TABLE book(
  isbn CHAR(17) NOT NULL,
  title VARCHAR(30) NOT NULL,
  author VARCHAR(30) NOT NULL,
  CONSTRAINT pri_isbn PRIMARY KEY (isbn));
  
  
CREATE TABLE student(
	no INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    school CHAR(3) NOT NULL,
    embargo BIT(1) NOT NULL DEFAULT FALSE,
    CONSTRAINT pri_student PRIMARY KEY (no));
    
    CREATE TABLE copy (
	code INT NOT NULL,
    isbn CHAR(17) NOT NULL,
    duration TINYINT NOT NULL,
    CONSTRAINT pri_copy PRIMARY KEY(code),
    CONSTRAINT for_copy FOREIGN KEY (isbn)
		REFERENCES book (isbn) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE loan (
	code INT NOT NULL,
    no INT NOT NULL,
    taken DATE NOT NULL,
    due DATE NOT NULL,
    return_date DATE NULL,
	CONSTRAINT pri_loan PRIMARY KEY(code, no, taken),
	CONSTRAINT for1_loan FOREIGN KEY (no)
    REFERENCES student (no) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT for2_loan FOREIGN KEY (code)
    REFERENCES copy (code) ON UPDATE CASCADE ON DELETE CASCADE);
    

#----------------------CREATE VIEW STATEMENTS-----------------------
DROP VIEW IF EXISTS CMP_Students;

CREATE VIEW CMP_Students AS
SELECT  name, school,embargo,no
FROM student
WHERE school= 'CMP'
WITH CHECK OPTION;

#testing rejection with school not CMP
INSERT INTO CMP_Students (no,name, school,embargo)
VALUES (2003, 'Sarah', 'ENG', False);
