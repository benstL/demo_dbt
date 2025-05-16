{{ config(materialized='view', tags=['examen']) }}

SELECT
    Title
FROM {{ source('music', 'album') }}
WHERE Cd_year > 1
