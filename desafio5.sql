SELECT 
    song_name AS cancao,
    COUNT(reproduction.song_id) AS reproducoes
FROM
    SpotifyClone.song AS music
        INNER JOIN
    SpotifyClone.reproduction_play AS reproduction
    ON reproduction.song_id = music.song_id
    GROUP BY
	cancao
	ORDER BY
	reproducoes DESC,
	cancao ASC
	LIMIT 2;