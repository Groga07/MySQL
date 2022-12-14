USE boardgamer;

INSERT INTO categories VALUES
	(1,'Экономика','Зарабатываем деньги, развиваем экономику'),
	(2,'Научная фантастика','Атмосфера научной фантастики'),
	(3,'Строительство','Строим'),
	(4,'Миниатюры','Игры с миньками'),
	(5,'Кооператив','Игры с кооперативным режимом'),
	(6,'Кубики','Игры с большим количеством рандома'),
	(7,'Логистика','Перевозки, перемещение'),
	(8,'Наследие', 'Результат партии влияет на все последующие игры'),
	(9,'Фэнтези', 'Гномы, эльфы и прочая нечесть'),
	(10,'Переговоры', 'Игры обязательными элементами союзов и предательств'),
	(11,'Контроль территории','Игры на контроль территории'),
	(12,'Карточная','Карты - основной или даже единственный элемент'),
	(13,'Тайлы','Игры с выкладыванием тайлов')
;

INSERT INTO publishers VALUES
	(1,'Stonemaier Games', 'SM'),
	(2,'Awaken Realms', null),
	(3,'Fryxgames',null),
	(4,'Phalanx Games', null),
	(5,'Z-Man games', 'At Z-Man Games, we create innovative games that become modern essentials.'), -- 3 игры
	(6,'RIO Grande Games', null),
	(7,'Fantasy Flight', null), -- 2 игры
	(8,'IELLO', 'Франция'),
	(9,'GAGA games', 'Спб'),	
	(10,'Hobby games', 'Мой выбор'),	-- локализаторов в перспективе буду выводить через отдельную таблицу и станет 1:n, сейчас m:n для games publishers
	(11,'Repos Production', null)
;

INSERT INTO games (id,name,name_original,playing_time_from,playing_time_to,players_from,players_to,age,description) VALUES
	(1,'Серп','Scythe',90,115,1,5,14,'Первое, чем удивит и порадует игроков настольная игра "Серп", – обилие миниатюр, фишек и карточек...'),
	(2,'Немезида','Nemesis',90,180,1,5,12,'Что может пойти не так на высокотехнологичном космическом корабле под управлением искусственного интеллекта?...'),
	(3,'Покорение Марса','Terraforming Mars',120,null,1,5,12,'Глобальная игра про освоение красной планеты, в которой игроки с помощью строительства "проектов...'),
	(4,'Брасс. Бирмингем','Brass: Birmingham',120,180,2,4,14,'Самая известная стратегия Мартина Уолласа о создании и развитии собственной промышленной империи...'),
	(5,'Пандемия. Наследие — Первый сезон','Pandemic Legacy: Season 1',60,null,2,4,13,'Одну из болезней лечить тяжелее остальных, но к этому вы уже привыкли, вы справитесь, однако скоро наступит февраль, и вот тогда…'),
	(6,'Кубарем по галактике','Roll for the Galaxy',45,null,2,5,13,'«Кубарем по Галактике» — игра о становлении космических империй для 2—5 игрокови...'),
	(7,'Игра Престолов (Второе издание)','A Game of Thrones: The Board Game (Second Edition)',120,240,3,6,14,'"Игра престолов" – это атмосферная, оригинальная и продуманная настольная стратегия по мотивам популярного цикла романов Джорджа Мартина...'),
	(8,'Брюгге','Bruges',60,null,2,4,10,'«Кубарем по Галактике» — игра о становлении космических империй для 2—5 игрокови...'),
	(9,'Цивилизация Сида Мейера','Sid Meier\'s Civilization: The Board Game',120,240,2,4,13,'В настольной игре "Цивилизация Сида Мейера" от 2 до 4 игроков берут на себя роли великих лидеров...'),
	(10,'Повелитель Токио','King of Tokyo',30,null,2,6,8,'Многострадальный город Токио вновь подвергся нападению гигантских монстров!'),
	(11,'7 чудес','7 Wonders',30,null,2,7,10,'Эта яркая стратегическая настольная игра, необычайно динамичная для игр её класса, уже завоевала популярность во всём мире. Но мне не нравится!'),
	(12,'Каркассон','Carcassonne',30,45,2,5,7,'Настоящий шедевр в мире настольных игр, уже многие годы объединяющий за столами людей всех возрастов по всему миру.')
;

INSERT INTO categories_games VALUES
	(1, 1),(1, 2),(1, 3),
	(2, 4),(2, 5),(2, 6),(2, 2),
	(3, 1),(3, 2),(3, 3),
	(4, 1),(4, 3),(4, 7),
	(5, 5),(5, 7),(5, 8),
	(6, 1),(6, 2),(6, 6),
	(7, 9),(7, 10),(7, 11),
	(8, 12),(8, 1),(8, 3),
	(9, 1),(9, 3),(9, 10),
	(10, 2),(10, 6),
	(11, 1),(11, 12),
	(12, 3),(12, 11), (12, 13)
;

INSERT INTO publishers_games VALUES 
	(1,1,2016),(2,2,2018),(2,10,2018),(3,3,2016),(4,4,2018),(5,5,2015),(6,6,2014),(7,7,2011),(8,5,2013),(9,7,2010),(10,8,2011),(11,11,2010),(12,5,2000)
;

INSERT INTO medias VALUES	-- ссылки с оф сайтов
	(1,'https://stonemaiergames.com/wp-content/uploads/2018/12/3d-scythe-768x767.png','img'),
	(2,'https://awakenrealms.com/wp-content/uploads/2019/10/NEMESIS_RULEBOOK_280x280mm_ENG.pdf','pdf'),
	(3,'https://www.fryxgames.se/wp-content/uploads/2014/11/TMbox.jpg','img'),
	(4,'https://phalanxgames.co.uk/pics/games//259-l.jpg','img'),
	(5,'https://images.zmangames.com/filer_public/19/65/19657c0c-5e78-4f7e-8985-49124948cad9/zm7170_combined_front_left_520px.png','img')
;

-- часть 2 (социальная)

INSERT INTO users (id, nick_name, first_name, email, birthday, city, gender) VALUES
	(1,'admin','Admin','admin@yandex.ru','1984-08-16',NULL,'m'),
	(2,'kate','Катя','bot_2@yandex.ru','2000-1-2','NY','w'),
	(3,'dim4ik','Димон','bot_3@yandex.ru','1984-4-26','Екатеринбург','m'),
	(4,'malishka','Дарья','bot_4@yandex.ru','1999-07-15','Тула','w'),
	(5,'user','Пользователь','bot_5@yandex.ru','1990-03-08','NY','x'),
	(6,'player','Игрок','bot_6@yandex.ru','1987-07-19','NY','x'),
	(7,'visor','Артем','visor517@yandex.ru','1984-08-16','Москва','m')
;

INSERT INTO rating_votes (user_id, game_id, vote) VALUES
	(2,1,7), (2,2,6), (2,5,8), (2,7,8), (2,10,3),
	(3,2,8), (3,4,6), (3,7,10), (3,9,6), (3,11,3),
	(4,1,8), (4,3,6), (4,4,8), (4,5,9), (4,12,7),
	(5,2,6), (5,3,9), (5,5,4), (5,8,7), (5,10,7),
	(6,5,8), (6,8,6), (6,9,7), (6,10,8), (6,11,4),
	(7,1,8), (7,2,8), (7,3,6), (7,4,7), (7,5,10), (7,6,8), (7,7,8), (7,8,7), (7,9,6), (7,10,7), (7,11,4), (7,12,8)
; 

INSERT INTO collections VALUES
	(2,1), (2,5), (2,8), (2,9), (2,11),
	(3,2), (3,6), (3,7), (3,9), (3,12),
	(4,1), (4,3), (4,4), (4,5), (4,12),
	(5,2), (5,3), (5,5), (5,8), (5,10), (5,12),
	(6,5), (6,7), (6,8), (6,9), (6,10), (6,11),
	(7,1), (7,2), (7,5), (7,7), (7,8), (7,9), (7,10), (7,12)
;

INSERT INTO reviews (user_id, game_id, txt) VALUES
	(2,5,'У меня ряд игр их, весьма играемые'),
	(2,8,'Все правильно сыграли'),
	(3,5,'Реиграбельность на уровне'),
	(3,11,'Играю с допом.'),
	(4,2,'Подскажите, где можно скачать планшет медика для печати?'),
	(4,4,'Хорошая игра с приятным оформлением.'),
	(5,1,'Взаимодействия в игре гораздо больше, чем может показаться на первый взгляд.'),
	(5,2,'Час назад приобрел. Оформление конечно великолепное!'),
	(6,7,'Я вот сравниваю к примеру с такой евро как "Чужие рубежи" - небо и земля игры.'),
	(7,2,'Жаль не с кем сыграть!'),
	(7,5,'Пока - мой топ 1'),
	(7,7,'Тоже компанию сложно собрать (')
;

INSERT INTO review_likes VALUES
	(2,1,true), (2,3,true), (2,10,true), (3,3,true), (3,5,true), (4,2,false), (4,8,true), (5,2,false), (5,7,true), (5,9,false), (5,11,true), (6,11,true), (7,6,true), (7,9,true)
;
