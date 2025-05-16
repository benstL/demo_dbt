{{ config(materialized='view', tags=['examen']) }}

SELECT
    ar.Name AS artist_name,
    COUNT(*) AS album_count
FROM {{ source('music', 'album') }} al
JOIN {{ source('music', 'artist') }} ar
    ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
