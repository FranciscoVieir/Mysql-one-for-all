SELECT 
    users.users_name AS usuario,
    IF(MAX(YEAR(reproduction.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.reproduction_play AS reproduction
    INNER JOIN
    SpotifyClone.users AS users ON reproduction.users_id = users.users_id
    GROUP BY users.users_name
	ORDER BY users.users_name ASC;