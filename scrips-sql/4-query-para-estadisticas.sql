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
from individual ind
inner join hogar hog on hog.codusu = ind.codusu and hog.nro_hogar = ind.nro_hogar;



