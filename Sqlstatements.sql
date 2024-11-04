#-------------------------------INSERT STATEMENTS---------------------------
INSERT INTO	 book(isbn, title, author)
	VALUES
    ('111-2-33-444444-5','Pro JavaFX', 'Dave Smith'),
    ('222-3-44-555555-6','Oracle Systems', 'Kate Roberts'),
    ('333-4-55-666666-7','Expert jQuery', 'Mike Smith');

INSERT INTO copy(code,isbn,duration)
	VALUES
    (1011, '111-2-33-444444-5',21),
    (1012, '111-2-33-444444-5',14),
    (1013, '111-2-33-444444-5',7),
    (2011, '222-3-44-555555-6',21),
    (3011, '333-4-55-666666-7',7),
    (3012, '333-4-55-666666-7',14);
    
    
INSERT INTO student(no, name, school,embargo)
	VALUES
    (2001, 'Mike', 'CMP', False),
    (2002, 'Andy', 'CMP', True),
    (2003, 'Sarah', 'ENG', False),
	(2004, 'Karen', 'ENG', True),
	(2005, 'Lucy', 'BUE', False);
    
INSERT INTO loan(code, no, taken, due, return_date)
	VALUES
  (1011, 2002, '2024-01-10', '2024-01-31', '2024-01-31'),
  (1011, 2002, '2024-02-05', '2024-02-26', '2024-02-23'),
  (1011, 2003, '2024-05-10', '2024-05-31', NULL),
  (1013, 2003, '2023-03-02', '2023-03-16', '2023-03-10'),
  (1013, 2002, '2023-08-02', '2023-08-16', '2023-08-16'),
  (2011, 2004, '2022-02-01', '2022-02-22', '2022-02-20'),
  (3011, 2002, '2024-07-03', '2024-07-10', NULL),
  (3011, 2005, '2023-10-10', '2023-10-17', '2023-10-20');
    
#---------------------------------SELECT STATEMENTS----------------------------------------
    
SELECT isbn, title,author
	FROM book;
    
SELECT no, name, school
	FROM student
    ORDER BY school DESC;
    
SELECT isbn, title
	FROM book
    WHERE author LIKE '%Smith%';
    
    
#selecting max due date of any book
SELECT MAX(due) AS max_due
	FROM loan
WHERE 
    code IN ( SELECT 
			code
		FROM 
			copy);
            
#selecting no of student with max due date
SELECT no 
FROM loan
WHERE due = (SELECT MAX(due)
             FROM loan
             WHERE code IN (SELECT code FROM copy));
            
#selecting student name
SELECT no
FROM student 
WHERE no IN (
    SELECT no
    FROM loan 
    WHERE due = (SELECT MAX(due)
                   FROM loan
                   WHERE code IN (SELECT code FROM copy))
);

#selecting student no, loan code and due date for current year
SELECT no ,code,due
FROM loan 
WHERE 
    YEAR(due) = YEAR(CURRENT_DATE())       
    AND loan.return_date IS NULL;   
    
#fetching student number,name, book isbn and title for students that loaned book for 7 days
SELECT DISTINCT student.no, name, book.isbn, title
FROM student 
INNER JOIN loan 
ON student.no= loan.no
INNER JOIN copy
ON loan.code =copy.code
INNER JOIN book
ON copy.isbn= book.isbn
WHERE duration=7;


#using JOINS and subqueries to fecth student number
SELECT DISTINCT student.no	
FROM student
INNER JOIN loan
	ON student.no=loan.no
INNER JOIN copy
WHERE due = (SELECT MAX(due)
                   FROM loan
                   WHERE code IN (SELECT code FROM copy));
                   

#calculating and displaying loan frequency for every book that has been borrowed more than 2 times
SELECT COUNT(loan.code) AS loaned,book.isbn,title
	FROM book
INNER JOIN copy
ON book.isbn= copy.isbn
INNER JOIN loan 
ON loan.code=copy.code
GROUP BY book.title, book.isbn
HAVING loaned>=2;

