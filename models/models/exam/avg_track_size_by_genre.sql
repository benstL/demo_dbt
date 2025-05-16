{{ config(materialized='view', tags=['examen']) }}

SELECT
    g.Name AS genre,
    AVG(t.Bytes) AS avg_size_bytes
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'genre') }} g
    ON t.GenreId = g.GenreId
GROUP BY g.Name
