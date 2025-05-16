{{ config(materialized='view', tags=['examen']) }}

SELECT
    ar.Name AS artist_name,
    g.Name AS genre_name,
    t.Name AS track_name,
    ar.Country
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'genre') }} g
    ON t.GenreId = g.GenreId
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
JOIN {{ source('music', 'artist') }} ar
    ON a.ArtistId = ar.ArtistId
WHERE LOWER(g.Name) LIKE '%rock%'
  AND LOWER(ar.Country) = 'france'
