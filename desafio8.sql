SELECT 
    artist.artist_name AS artista, albuns.album_name AS album
FROM
    SpotifyClone.artist AS artist
        INNER JOIN
    SpotifyClone.albuns AS albuns
    ON artist.artist_name = 'Elis Regina'
    AND artist.artist_id = albuns.artist_id;