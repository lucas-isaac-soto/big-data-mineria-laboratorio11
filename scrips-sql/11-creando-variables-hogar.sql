--agregando columna nueva a tabla individual
ALTER TABLE hogar
ADD COLUMN menor18_trabaja integer;

ALTER TABLE hogar
ADD COLUMN conyuge_trabaja integer;

--actualiza los hogares donde hay chicos menores a 18 trabajando
UPDATE hogar
SET menor18_trabaja = 1
WHERE (codusu, nro_hogar) IN (
    SELECT codusu, nro_hogar
    FROM individual
    WHERE ch06 < 18 AND estado = 1
    ORDER BY ch06
);

--actualiza los hogares faltantes donde no hay chicos menores a 18 trabajando
UPDATE hogar
SET menor18_trabaja = 0
WHERE menor18_trabaja is null;


--actualiza los hogares donde hay conyuges trabajando
UPDATE hogar
SET conyuge_trabaja = 1
WHERE (codusu, nro_hogar) IN (
    SELECT codusu, nro_hogar
    FROM individual
    WHERE ch03 = 2 AND estado = 1
    ORDER BY ch06
);

--actualiza los hogares faltantes donde no conyuges trabajando
UPDATE hogar
SET conyuge_trabaja = 0
WHERE conyuge_trabaja is null;



select codusu, nro_hogar, componente,itf, ad_equiv_hogar,ingreso_necesario
from respondieron_itf
order by codusu, nro_hogar, componente;





select
    count(*) as total_hogare
from (
    SELECT
        codusu,
        nro_hogar,
        itf,
        ingreso_necesario
    FROM respondieron_itf
    GROUP BY codusu, nro_hogar, itf, ingreso_necesario
    ORDER BY codusu, nro_hogar    
) as subconsulta;


SELECT
    COUNT(*) AS total_hogares_pobres
FROM (
    SELECT
        codusu,
        nro_hogar,
        itf,
        ingreso_necesario
    FROM respondieron_itf
    where itf < ingreso_necesario
    GROUP BY codusu, nro_hogar, itf, ingreso_necesario
    ORDER BY codusu, nro_hogar
) AS subconsulta;

