{{ config(materialized='view', tags=['examen']) }}

SELECT DISTINCT
    p.Name AS playlist_name
FROM {{ source('music', 'playlist') }} p
JOIN {{ source('music', 'playlisttrack') }} pt
    ON p.PlaylistId = pt.PlaylistId
JOIN {{ source('music', 'track') }} t
    ON pt.TrackId = t.TrackId
JOIN {{ source('music', 'album') }} a
    ON t.AlbumId = a.AlbumId
JOIN {{ source('music', 'artist') }} ar
    ON a.ArtistId = ar.ArtistId
WHERE ar.Birthyear < 1990
