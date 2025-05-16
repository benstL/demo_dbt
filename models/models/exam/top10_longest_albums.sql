{{ config(materialized='view', tags=['examen']) }}

SELECT
    a.Title AS album_title,
    SUM(t.Milliseconds) AS total_duration_ms
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
GROUP BY a.Title
ORDER BY total_duration_ms DESC
LIMIT 10
