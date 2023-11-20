-- b. 
--FILTRANDO POR AGLOMERADO CABA Y GRAN BUENOS AIRES
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

