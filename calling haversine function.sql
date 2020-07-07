SELECT * ,
       111.045*haversine(latitude,longitude,latpoint, longpoint) AS distance_in_km
 FROM markers
 JOIN (
     SELECT  0.0000  AS latpoint,  0.0000 AS longpoint
   ) AS p
 ORDER BY distance_in_km
 LIMIT 15
 
 
 # the latitude and longitude of a starting point.
 # the latitude and longitude of an ending point.
 # the number of kilometers (111.045), statute miles (69), or nautical miles (60) in a degree of latitude.
 # LIMIT of the distance in KM.