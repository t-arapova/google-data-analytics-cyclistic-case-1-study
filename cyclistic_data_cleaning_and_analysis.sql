CREATE TABLE `my-first-project-96548.cyclistic_dataset.cleaned_trips` AS
SELECT 
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  
  --  Travel time in minutes
  ROUND(DATETIME_DIFF(ended_at, started_at, SECOND) / 60.0, 2) AS ride_length_minutes,
  
  --  Day of the week for the start
  FORMAT_DATETIME('%A', started_at) AS day_of_week,
  
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  member_casual
FROM `my-first-project-96548.cyclistic_dataset.cőmbined_trip`

WHERE 
  -- 1. Removing timing errors
  started_at < ended_at
  -- 2. Removing short trips (< 60 секунд)
  AND DATETIME_DIFF(ended_at, started_at, SECOND) >= 60
  -- 3. Removing long trips (>= 24 часов)
  AND DATETIME_DIFF(ended_at, started_at, HOUR) < 24
  -- 4. Excluding test stations
  AND (start_station_name NOT LIKE '%TEST%' OR start_station_name IS NULL)
  AND (end_station_name NOT LIKE '%TEST%' OR end_station_name IS NULL)

-- 5. Deduplication ride_id
QUALIFY ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) = 1;
