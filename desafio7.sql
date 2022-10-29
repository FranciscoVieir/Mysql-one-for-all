 SELECT 
    artist.artist_name AS artista,
    albuns.album_name AS album,
    COUNT(follow.artist_id) AS seguidores
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.albuns AS albuns ON artist.artist_id = albuns.artist_id
        INNER JOIN
    SpotifyClone.artist_followed AS follow ON follow.artist_id = artist.artist_id
GROUP BY
albuns.album_id
ORDER BY seguidores DESC , artista ASC , album ASC;