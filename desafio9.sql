SELECT
    COUNT(reproduction.song_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.users AS users
        INNER JOIN
    SpotifyClone.reproduction_play AS reproduction
    ON users.users_name = 'Barbara Liskov'
    AND users.users_id = reproduction.users_id;