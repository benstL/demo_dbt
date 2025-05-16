{{ config(materialized='view', tags=['examen']) }}

SELECT
    t.Name AS track_name,
    t.Composer,
    g.Name AS genre
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'genre') }} g
    ON t.GenreId = g.GenreId
WHERE g.Name IN ('Rock', 'Jazz')
