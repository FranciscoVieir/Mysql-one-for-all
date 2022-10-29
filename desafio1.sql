DROP DATABASE IF EXISTS SpotifyClone;

	CREATE DATABASE IF NOT EXISTS SpotifyClone;
    
    
    CREATE TABLE SpotifyClone.plan(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_name VARCHAR(100) NOT NULL,
      plan_value DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;
  
  
   CREATE TABLE SpotifyClone.users(
      users_id INT PRIMARY KEY AUTO_INCREMENT,
      users_name VARCHAR(80) NOT NULL,
      user_age INT NOT NULL,
      plan_id INT NOT NULL,
      signature_date DATE NOT NULL,
      CONSTRAINT FK_id_plan FOREIGN KEY(plan_id) REFERENCES plan(plan_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plan(plan_name, plan_value)
  VALUES('gratuito', 0),
        ('universitário', 5.99),
        ('pessoal', 6.99),
        ('familiar', 7.99);

  INSERT INTO SpotifyClone.users(plan_id, users_name, user_age, signature_date)
  VALUES(1, 'Barbara Liskov', 82, "2019-10-20"),
        (1, 'Robert Cecil Martin', 58, "2017-01-06"),
        (4, 'Ada Lovelace', 37, "2017-12-30"),
        (4, 'Martin Fowler', 46, "2017-01-17"),
        (4, 'Sandi Metz', 58, "2018-04-29"),
        (2, 'Paulo Freire', 19, "2018-02-14"),
        (2, 'Bell Hooks', 26, "2018-01-05"),
        (3, 'Christopher Alexander', 85, "2019-06-05"),
        (3,'Judith Butler', 45, "2020-05-13"),
        (3, 'Jorge Amado', 58, "2017-02-17");

  CREATE TABLE SpotifyClone.artist(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artist(artist_name)
  VALUES('Beyoncé'),
		('Queen'),
        ('Elis Regina'),
        ('Baco Exu do Blues'),
        ('Blind Guardian'),
        ('Nina Simone');

  CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      album_year YEAR NOT NULL,
      CONSTRAINT FK_id_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.albuns(artist_id, album_name, album_year)
  VALUES(1,'Renaissance', "2022"),
		(2, 'Jazz', "1978"),
        (2, 'Hot Space', "1982"),
        (3, 'Falso Brilhante', "1998"),
        (3, 'Vento de Maio', "2001"),
        (4, 'QVVJFA?', "2003"),
        (5, 'Somewhere Far Beyond', "2007"),
        (6, 'I Put A Spell On You', "2012");

  CREATE TABLE SpotifyClone.artist_followed(
      artist_id INT,
      users_id INT,
      PRIMARY KEY (artist_id, users_id),
      CONSTRAINT FK_id_artist_followed_table FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
      CONSTRAINT FK_id_users_followed_table FOREIGN KEY(users_id) REFERENCES users(users_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song(
      song_id INT PRIMARY KEY NOT NULL auto_increment,
      song_name VARCHAR(100) NOT NULL,
      duration_in_seconds INT NOT NULL,
      artist_id INT NOT NULL,
      album_id INT NOT NULL,
      CONSTRAINT FK_id_artist_song FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
      CONSTRAINT FK_id_album_song FOREIGN KEY(album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;
    
	CREATE TABLE SpotifyClone.reproduction_play(
	users_id INT,
	song_id INT,
    reproduction_date DATETIME NOT NULL,
    PRIMARY KEY (users_id, song_id),
    CONSTRAINT FK_id_users FOREIGN KEY(users_id) REFERENCES users(users_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(song_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.song(song_name, duration_in_seconds, album_id, artist_id)
    VALUES
    ("break my soul", 279, 1, 1),
    ("VIRGO’S GROOVE", 369, 1, 1),
    ("ALIEN SUPERSTAR", 116, 1, 1),
    ("Don’t Stop Me Now", 203, 2, 2),
    ("Under Pressure", 152, 3, 2),
    ("Como Nossos Pais", 105, 4, 3),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5, 3),
    ("Samba em Paris", 267, 6, 4),
    ("The Bard’s Song", 244, 7, 5),
    ("Feeling Good", 100, 8, 6);
    
    INSERT INTO SpotifyClone.artist_followed(users_id, artist_id)
  VALUES(1, 1),
        (1, 2),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 1),
        (7, 6),
        (9, 3),
        (10, 2);
        
	INSERT INTO SpotifyClone.reproduction_play(users_id, song_id, reproduction_date)
	VALUES(1, 8, "2022-02-28 10:45:55"),
		(1, 2, "2020-05-02 05:30:35"),
		(1, 10, "2020-03-06 11:22:33"),
		(2, 10, "2022-08-05 08:05:17"),
        (2, 7, "2020-01-02 07:40:33"),
		(3, 10, "2020-11-13 16:55:13"),
        (3, 2, "2020-12-05 18:38:30"),
		(4, 8, "2021-08-15 17:10:10"),
		(5, 8, "2022-01-09 01:44:33"),
        (5, 5, "2020-08-06 15:23:43"),
		(6, 7, "2017-01-24 00:31:17"),
        (6, 1, "2017-10-12 12:35:20"),
		(7, 4, "2011-12-15 22:30:49"),
		(8, 4, "2012-03-17 14:56:41"),
		(9, 9, "2022-02-24 21:14:22"),
		(10, 3, "2015-12-13 08:30:22");