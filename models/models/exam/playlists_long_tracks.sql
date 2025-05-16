{{ config(materialized='view', tags=['examen']) }}

SELECT DISTINCT
    p.Name AS playlist_name
FROM {{ source('music', 'playlist') }} p
JOIN {{ source('music', 'playlisttrack') }} pt
    ON p.PlaylistId = pt.PlaylistId
JOIN {{ source('music', 'track') }} t
    ON pt.TrackId = t.TrackId
WHERE t.Milliseconds > 240000
