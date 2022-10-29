SELECT
 (SELECT COUNT(*) FROM SpotifyClone.song) AS cancoes,
 (SELECT COUNT(*) FROM SpotifyClone.artist) AS artistas,
 (SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns;