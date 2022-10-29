SELECT 
	users.users_name AS usuario,
  COUNT(reproduction.song_id) AS qt_de_musicas_ouvidas,
  SUM(ROUND(music.duration_in_seconds/60, 2)) AS total_minutos
FROM 
	SpotifyClone.reproduction_play AS reproduction
		INNER JOIN
	SpotifyClone.users AS users ON reproduction.users_id = users.users_id
		INNER JOIN
	SpotifyClone.song AS music ON reproduction.song_id = music.song_id
GROUP BY
users.users_name
ORDER BY
users.users_name ASC;