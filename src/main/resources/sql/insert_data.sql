INSERT INTO public.roles (id, description, title)
SELECT (1, 'Роль пользователя', 'USER')
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE id = 1)
UNION ALL
SELECT (2, 'Роль модератора', 'MODERATOR')
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE id = 2);
/*insert into roles
values (1, 'Роль пользователя', 'USER'),
    (2, 'Роль админа', 'ADMIN');*/



--АВТОРЫ
drop sequence directors_sequence;
create sequence directors_sequence;
alter sequence directors_sequence owner to postgres;

truncate table films_directors;
truncate table directors cascade;
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:46:11.797607', 'Александр Грибоедов', 'Писатель Александр Грибоедов ' ||
                                                                                              'родился в 1795 году в Москве. С детства Александр был невероятно развитым мальчиком — в шесть
                     лет он знал уже три языка, а еще через 6 — еще три.', '1795-01-15');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:47:02.414728', 'Джейн Остин',
        'Остен Джейн — выдающий британский писатель, классик мировой литературы. Родилась в 1775 году в небольшом городке в графстве Хэмпшир. В семье кроме Джейн росло еще 7 детей. У будущей романистки было 6 братьев и сестра Кассандра. ',
        '1775-12-16');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:48:53.363059', 'Федор Достоевский',
        'Гордость отечественной литературы Федор Михайлович Достоевский родился в Москве в 1821 году в семье врача. Почти все свое детство Федор и его шесть братьев и сестер провели внутри больничных стен на работе отца. Воспитывались дети в строгости.',
        '1821-11-11');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:50:12.953413', 'Эмили Бронте',
        'член знаменитого литературного английского семейства, при жизни была, пожалуй, самой незаметной на фоне своих знаменитых сестры и брата. С детства отличаясь живым и ярким воображением',
        '1818-07-30');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:51:08.314682', 'Михаил Булгаков',
        'Михаил Афанасьевич Булгаков появился на свет 15 мая (по старому стилю — 3 мая) 1891 года в Киеве. Его родители были преподавателями и сделали все, чтобы дать сыну блестящее образование.',
        '1891-05-15');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:51:08.314682', 'Илья Ильф', 'настоящее имя — Иехиел-Лейб бен Арьевич Файнзильберг; 1897—1937', '1897-01-01');
INSERT INTO directors (id, created_by, created_when, fio, description, birth_date)
VALUES (nextval('directors_sequence'), 'admin', '2022-11-15 13:51:08.314682', 'Евгений Петров', 'настоящее имя — Евгений Петрович Катаев; 1902—1942', '1902-01-01');



--filmS
drop sequence films_sequence;
create sequence films_sequence;
alter sequence films_sequence owner to postgres;
truncate table films cascade;
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:54:28.115079', 100, 3, null, '1966-01-01', '1-М', 'Мастер и Маргарита', 'журнал «Москва»', 416);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:56:12.600618', 10, 3, null, '1925-01-01', '1-Б', 'Белая Гвардия', 'журнал «Россия»', 416);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:57:05.231780', 11, 2, null, '2023-01-15', '17-Г', 'Грозовой перевал', 'Азбука, 2023 г.', 384);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:57:43.883671', 11, 3, null, '2022-01-01', '1-И', 'Идиот', 'Эксмо', 636);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:58:12.172216', 111, 2, null, '2022-03-22', '13-Г', 'Гордость и предубеждение', 'АСТ', 416);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:58:12.172216', 110, 2, null, '2016-03-11', '1-Г', 'Горе от ума', 'Азбука', 256);
INSERT INTO films (id, created_by, created_when, amount, genre, online_copy_path, publish_date, imdb, title, publish, minutes_count)
VALUES (nextval('films_sequence'), 'admin', '2022-11-15 13:58:12.172216', 2, 3, null, '2016-03-11', '1-Г', 'Золотой теленок', 'Текст', 432);

--filmS_directorS
INSERT INTO films_directors (film_id, director_id)
VALUES (1, 5);
INSERT INTO films_directors (film_id, director_id)
VALUES (2, 5);
INSERT INTO films_directors (film_id, director_id)
VALUES (3, 4);
INSERT INTO films_directors (film_id, director_id)
VALUES (4, 3);
INSERT INTO films_directors (film_id, director_id)
VALUES (5, 2);
INSERT INTO films_directors (film_id, director_id)
VALUES (6, 1);
INSERT INTO films_directors (film_id, director_id)
VALUES (7, 6);
INSERT INTO films_directors (film_id, director_id)
VALUES (7, 7);
