--identificado sexo de cada individuo (totales 49076)
select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
from individual;


--Variables necesarias para realizar la matriz de correlacion
select  ind.ch04 as sexo,
        ind.ch07 as relacion_sentimental,
        ind.ch08 as cobertura_medica,
        ind.nivel_ed as nivel_educativo,
        ind.estado,
        ind.cat_inac as categoria_inactividad,
        ind.ipcf as ingreso_percapita_familiar
from individual ind;


--¿Cuántos desocupados hay en la muestra? ¿Cuántos inactivos? ¿Cuál es la media de ingreso per cápita familiar (IPCF) según estado (ocupado, desocupado, inactivo)?
select  count(CASE WHEN estado = 2 THEN 'DESOCUPADO' END) as desocupados,
        count(CASE WHEN estado = 3 THEN 'INACTIVO' END) as inactivos
from individual ind;

select  count(CASE WHEN estado = 2 THEN 'DESOCUPADO' END) as desocupados,
        count(CASE WHEN estado = 3 THEN 'INACTIVO' END) as inactivos,
        
        sum(CASE WHEN estado = 1 THEN ipcf END) as ingreso_percapita_familiar_ocupado,
        sum(CASE WHEN estado = 1 THEN ipcf END)/count(CASE WHEN estado = 1 THEN 'OCUPADO' END) as media_ingreso_percapita_familiar_ocupado,

        sum(CASE WHEN estado = 2 THEN ipcf END) as ingreso_percapita_familiar_desocupados,
        sum(CASE WHEN estado = 2 THEN ipcf END)/count(CASE WHEN estado = 2 THEN 'DESOCUPADO' END) as media_ingreso_percapita_familiar_desocupado,

        sum(CASE WHEN estado = 3 THEN ipcf END) as ingreso_percapita_familiar_inactivo,
        sum(CASE WHEN estado = 3 THEN ipcf END)/count(CASE WHEN estado = 3 THEN 'INACTIVO' END) as media_ingreso_percapita_familiar_inactivo

from individual ind;


