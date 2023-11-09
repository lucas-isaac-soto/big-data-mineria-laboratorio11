-- b.
--TABLAS  = hogar e individual
--CAMPO   = AGLOMERADO:
--VALOR 1 = Ciudad Autonoma De Buenos Aires = 32
--VALOR 2 = Gran Buenos Aires (Partidos del GBA) = 33
delete 
from hogar
where AGLOMERADO != 32 AND AGLOMERADO != 33;

delete 
from individual
where AGLOMERADO != 32 AND AGLOMERADO != 33;


-- c.
--Si hay observaciones con valores que no tienen sentido, descártelas (ingresos y edades negativos, por ejemplo).

--contabilizar personas por edad??
select  extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy'))) as años,

        count(
            extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy')))
            ) as cantidad

from individual
group by extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy')))
order by  extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy'))) desc;

--encontrar personas que nacieron despues de 2025???
--encontrar personas mas jovenes/vieja
select  CODUSU,
        NRO_HOGAR,
        COMPONENTE,
        ANO4 as anio_relevamiento,
        TO_DATE(ch05, 'dd-mm-yyyy') AS fecha_nacimiento,
        extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy'))) as años
from individual
order by  extract (YEAR from age(now() , TO_DATE(ch05, 'dd-mm-yyyy'))) ;

--ingreso de hogar

--ingreso de individual
