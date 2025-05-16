{{ config(materialized='view', tags=['examen']) }}

SELECT
    t.Name AS track_name,
    a.Prod_year
FROM {{ source('music', 'track') }} t
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
WHERE a.Prod_year IN (2000, 2002)
