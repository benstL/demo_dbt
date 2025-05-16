{{ config(materialized='view', tags=['examen']) }}

SELECT
    ar.Name AS artist_name,
    COUNT(*) AS track_count
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
JOIN {{ source('music', 'artist') }} ar
    ON a.ArtistId = ar.ArtistId
GROUP BY ar.Name
