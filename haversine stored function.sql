CREATE DEFINER=`root`@`localhost` FUNCTION `haversine`(lat1 FLOAT, lon1 FLOAT,
        lat2 FLOAT, lon2 FLOAT
     ) RETURNS float
    NO SQL
    DETERMINISTIC
    COMMENT 'Returns the distance in degrees on the\n             Earth between two known points\n             of latitude and longitude\n             using the Vincenty formula\n             from http://en.wikipedia.org/wiki/Great-circle_distance'
BEGIN
    RETURN  DEGREES(
    ATAN2(
      SQRT(
        POW(COS(RADIANS(lat2))*SIN(RADIANS(lon2-lon1)),2) +
        POW(COS(RADIANS(lat1))*SIN(RADIANS(lat2)) -
             (SIN(RADIANS(lat1))*COS(RADIANS(lat2)) *
              COS(RADIANS(lon2-lon1))) ,2)),
      SIN(RADIANS(lat1))*SIN(RADIANS(lat2)) +
      COS(RADIANS(lat1))*COS(RADIANS(lat2))*COS(RADIANS(lon2-lon1))));
END