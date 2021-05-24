SELECT * FROM part_nyc
SELECT * FROM part_sfo
SELECT * FROM supplier
SELECT * FROM color

SELECT COUNT(*)
FROM part_nyc
WHERE on_hand > 70;

SELECT SUM(on_hand)
FROM
  (part_nyc
   UNION
   part_sfo)
WHERE color = 'Red';

SELECT supplier FROM
  (SELECT supplier, SUM(on_hand)
  FROM part_nyc
  GROUP BY supplier
  LEFT JOIN
  SELECT supplier, SUM(on_hand)
  FROM part_sfo
  GROUP BY supplier)
WHERE part_nyc > part_sfo OR part_sfo = NULL;

SELECT supplier
FROM 
  (SELECT part_number, supplier
  FROM part_nyc
   
  EXCEPT
  
  SELECT part_number, supplier
  part_sfo S);
