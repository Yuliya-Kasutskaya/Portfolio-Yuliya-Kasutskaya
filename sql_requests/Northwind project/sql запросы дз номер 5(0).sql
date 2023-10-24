1. Создать таблицу exam с полями:

- идентификатора экзамена - автоинкрементируемый, уникальный, запрещает NULL;
- наименования экзамена
- даты экзамена

CREATE TABLE exam
(
	exam_id serial UNIQUE NOT NULL,
	exam_name varchar,
	exam_date varchar
);
 


2. Удалить ограничение уникальности с поля идентификатора

ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;


3. Добавить ограничение первичного ключа на поле идентификатора

ALTER TABLE exam
ADD PRIMARY KEY (exam_id);


4. Создать таблицу person с полями

- идентификатора личности (простой int, первичный ключ)
- имя
- фамилия

CREATE TABLE person
(
	person_id int PRIMARY KEY,
	name varchar,
	last_name varchar
);

5. Создать таблицу паспорта с полями:

- идентификатора паспорта (простой int, первичный ключ)
- серийный номер (простой int, запрещает NULL)
- регистрация
- ссылка на идентификатор личности (внешний ключ)

CREATE TABLE passport
(
	passport_id int PRIMARY KEY,
	serial_number int NOT NULL,
	registration varchar,
	person_id int,

	CONSTRAINT FK_passport_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);


6. Добавить колонку веса в таблицу book (создавали ранее) с ограничением, проверяющим вес (больше 0 но меньше 100)

ALTER TABLE book
ADD COLUMN weigth decimal CONSTRAINT CHK_book_weigth CHECK (weigth > 0 AND weigth < 100);

7. Убедиться в том, что ограничение на вес работает (попробуйте вставить невалидное значение)

SELECT * FROM book

INSERT INTO book
VALUES 
(1, 'New book', 'ibsn', 1, 1),
(3, 'New book1', 'ibsn', 1, 4),
(5, 'New book2', 'ibsn', 1, 4090);


8. Создать таблицу student с полями:

- идентификатора (автоинкремент)
- полное имя
- курс (по умолчанию 1)


CREATE TABLE student
(
	student_id serial,
	full_name varchar,
	course varchar DEFAULT 1
);


9. Вставить запись в таблицу студентов и убедиться, что ограничение на вставку значения по умолчанию работает

INSERT INTO student
VALUES 
(1, 'alex alexev')

10. Удалить ограничение "по умолчанию" из таблицы студентов

ALTER TABLE student 
ALTER COLUMN course DROP DEFAULT



