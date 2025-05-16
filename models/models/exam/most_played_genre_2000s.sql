{{ config(materialized='view', tags=['examen']) }}

SELECT
    g.Name AS genre_name,
    COUNT(*) AS play_count
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'genre') }} g
    ON t.GenreId = g.GenreId
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
WHERE a.Prod_year BETWEEN 2000 AND 2009
GROUP BY g.Name
ORDER BY play_count DESC
LIMIT 1
