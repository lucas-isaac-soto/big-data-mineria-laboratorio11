--creando tabla con la misma informacion que individuales pero que si respondieron el itf
CREATE TABLE respondieron_itf AS
SELECT *
FROM individual
WHERE itf > 0;

--creando tabla con la misma informacion que individuales pero que no respondieron el itf
CREATE TABLE no_respondieron_itf AS
SELECT *
FROM individual
WHERE itf <= 0;