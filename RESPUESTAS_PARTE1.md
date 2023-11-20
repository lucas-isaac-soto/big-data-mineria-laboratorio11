# big-data-mineria-laboratorio11

- Anio: 2023
- Universidad Del Chubut, Argentina, Chubut Rawson
- Materia: Bases de Datos II
- Docente: Ing. Fabio Salerno
- Alumno: Soto Lucas

---

## Respuestas PARTE I

## (Antes de poder correr el programa en python es necesario que lea el archivo REQUISITOS.md y siga los pasos para que pueda ejecutar el programa.)

---

### Parte I: Analisis.

1.  Las nociones de pobreza e indigencia empleadas por el INDEC para el cálculo de incidencia se corresponden con el método de medición indirecta, denominado también “línea”. El concepto de “Línea de Indigencia” (LI) procura establecer si los hogares cuentan con ingresos suficientes para cubrir una canasta de alimentos capaz de satisfacer un umbral mínimo de necesidades energéticas y proteicas, denominada Canasta Básica Alimentaria (CBA). De esta manera, los hogares que no superan ese umbral o línea son considerados indigentes. Los componentes de la CBA se valorizan con los precios relevados por el Índice de Precios al Consumidor (IPC) para cada período de medición.

    Asimismo, la “Línea de Pobreza” (LP) extiende el umbral para incluir no sólo los consumos alimentarios mínimos sino también otros consumos básicos no alimentarios. La suma de ambos conforma la Canasta Básica Total (CBT), la cual es también contrastada con los ingresos de los hogares relevados por la Encuesta Permanente de Hogares (EPH).

    Para calcular la línea de pobreza, por lo tanto, es necesario contar con el valor de la CBA y ampliarlo con la inclusión de bienes y servicios no alimentarios (vestimenta, transporte, educación, salud, etcétera) con el fin de obtener el valor de la Canasta Básica Total (CBT).

    Dado que las necesidades nutricionales difieren entre la población, se construye una unidad de referencia, el “adulto equivalente”, correspondiente a un hombre adulto de actividad moderada, para establecer luego las relaciones en las necesidades energéticas según edad y sexo de las personas.

    A partir de estas equivalencias se construyen las líneas para cada hogar según su tamaño y composición. En tanto que las líneas se construyen por hogar, el valor de las canastas que estas suponen debe ser contrastado con el ingreso total familiar del hogar, lo que permite clasificarlos en hogares indigentes, pobres no indigentes, pobres (incluye las dos anteriores) y no pobres, extendiéndose esa caracterización a cada una de las personas que los integran.

    **A partir de los ingresos de los hogares se establece si éstos tienen capacidad de satisfacer -por medio de la compra de bienes y servicios- un conjunto de necesidades alimentarias y no alimentarias consideradas esenciales. El procedimiento parte de utilizar una canasta básica de alimentos (CBA) y ampliarla con la inclusión de bienes y servicios no alimentarios (vestimenta, transporte, educación, salud, etc.) con el fin de obtener el valor de la canasta básica total (CBT).
    Para calcular la incidencia de la pobreza se analiza la proporción de hogares cuyo ingreso no supera el valor de la CBT; para el caso de la indigencia, la proporción cuyo ingreso no superan la CBA.**

    Fuentes:

    Buenos Aires, Noviembre 2016
    La medición de la pobreza y la indigencia en la Argentina  
     https://www.indec.gob.ar/ftp/cuadros/sociedad/EPH_metodologia_22_pobreza.pdf

    Linea de pobreza  
     https://www.indec.gob.ar/indec/web/Nivel4-Tema-4-46-152

2.  Base Individual y hogar. Total aglomerados , total interior, aglomerados de más y menos de 500.000 habitantes y cada aglomerado de EPH.
    Primer trimestre 2022.

## Migracion

A tener en cuenta:  
Parece usar 2 bases de datos HOGAR y PERSONAS.  
Pero nosotros vamos a utilizarlas como 2 tablas en una base de datos.  
Para ello ingresamos a nuestro cliente postgres y creamos una base de datos nueva para este laboratorio.

```
create database bigdata;
```

Todo lo que haremos sera dentro de la base de datos creada.

Cada registro en ambas bases tienen tienen un codigo de identificacion (CODUSU), relaciona una vivienda con los hogares y las personas que lo componen.

en la base de datos HOGAR (archivo usu_hogar.txt) todo hogar que pertenezca a una misma vivienda tiene el mismo CODUSU. Para identificar los hogares se debe utilizar CODUSU y NRO_HOGAR.

en la base de datos PERSONAS (archivo usu_individual.txt) todo miembro del hogar tiene mismo CODUSU y NRO_HOGAR pero se difernecia por numero COMPONENTES.

---

#### Scrip de creacion de tabla hogar:

creacion de tabla hogar:

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/2-creacion-hogar.sql
```

cargar datos de indec:

```
\copy hogar from '/path-a-carpeta/big-data-mineria-laboratorio11/EPH_usu_1er_Trim_2022_txt/usu_hogar_T122.txt' DELIMITER ';' CSV HEADER;
```

---

#### Scrip de creacion de tabla Individual:

creacion de tabla individual:

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/2-creacion-individual.sql
```

cargar datos de indec:

```
\copy individual from '/path-a-carpeta/big-data-mineria-laboratorio11/EPH_usu_1er_Trim_2022_txt/usu_individual_T122.txt' DELIMITER ';' CSV HEADER;
```

---

### Filtrando registros

Importante leido en documentacion EPH:

- Los códigos 9, 99, 999, 9999 corresponden, salvo indicación en contrario, a la
  categoría No sabe/No responde.
- Una excepción la constituyen los montos de ingreso, en cuyo caso la no
  respuesta se identifica con el código -9.

Los filtrados que se van a hacer son:

- Observaciones que no corresponden a los aglomerados de Ciudad Autónoma de Buenos Aires o Gran Buenos Aires.
- Observaciones con valores que no tienen sentido

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/3-filtrando-bbdd.sql
```

#### De lo analizado en los datos

No se encontraron registros que con observaciones u valroes se justifiquen dar de bajas.

---

### Respuesta d: grafico de barra.

Para este punto se utilizo python para conectarse a la base de datos y que nos muestre un grafico estadistico de barra y de torta.

**Para poder ver la matriz debe ir a la carpeta ESTADISTICAS-PYTHON, y ejecutar con python3 appEstadisticas.py e ir a la opcion 1**

---

### Respuesta e: a matriz de correlacion

Para poder interpretar la matriz resultado es necesario que esta matriz nos muestra que tanto impactan las variables entre si, siendo valores entre +-0 y +-0,3 tienen un poco impacto y en cuanto incremente hasta 1 esta tiene un impacto muy fuerte entre ellas.

La diagonal siempre sera de 1 como se puede observar la matriz en el ejercicio.

De lo resultado en la matriz podemos ver que la gran mayoria no tienen una correlacion muy fuerte, pero tenemos algunas donde llegan hasta 0.8 lo cual indicua una fuerte relacion, este es el caso de CAT_INAC y ESTADO como podemos ver es una relacion obvia fuerta ya que indica si el individuo tiene o no una categoria de inactividad.

**Para poder ver la matriz debe ir a la carpeta ESTADISTICAS-PYTHON, y ejecutar con python3 appEstadisticas.py e ir a la opcion 2**

---

### Respuesta punto f: cuantos desocupados, inactivos, media de ingreso per capita familiar segun estado.

Para resolver este punto se realizo la siguiente consulta en postgresql.

```
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
```

Al realizar la siguiente consulta, vemos que:

- Hay un total de 1367 DESOCUPADOS
- Hay un totla de 20615 INACTIVOS
- La media de ingreso per capita familiar de OCUPADOS: 33580.71
- La media de ingreso per capita familiar de DESOCUPADOS: 17671.41
- La media de ingreso per capita familiar de INACTIVOS: 27162.19

---

### Respuesta punto g:

A continuacion se detallara la tabla de adulto equivalente ya que no se encontro en la web de indec como un archivo.

| Edad    | Mujeres | Varones |
| ------- | ------- | ------- |
| < 1     | 0,35    | 0,35    |
| 1       | 0,37    | 0,37    |
| 2       | 0,46    | 0,46    |
| 3       | 0,51    | 0,51    |
| 4       | 0,55    | 0,55    |
| 5       | 0,60    | 0,60    |
| 6       | 0,64    | 0,64    |
| 7       | 0,66    | 0,66    |
| 8       | 0,68    | 0,68    |
| 9       | 0,69    | 0,69    |
| 10      | 0,70    | 0,79    |
| 11      | 0,72    | 0,82    |
| 12      | 0,74    | 0,85    |
| 13      | 0,76    | 0,90    |
| 14      | 0,76    | 0,96    |
| 15      | 0,77    | 1,00    |
| 16      | 0,77    | 1,03    |
| 17      | 0,77    | 1,04    |
| 18 a 29 | 0,76    | 1,02    |
| 30 a 45 | 0,77    | 1,00    |
| 46 a 60 | 0,76    | 1,00    |
| 61 a 75 | 0,67    | 0,83    |
| > 75    | 0,63    | 0,74    |

Ya que la tabla no se encontro vamos a crearlas nosotros utilizando el siguiente script que crea la tabla y le ingresa los datos:

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/5-creacion-adulto-equivalente.sql
```

Ahora vamos a agregarle a la tabla individual una nueva columna, esta llamada adulto_equiv como dice el enunciado y tendra el valor correspondiente segun la edad y el sexo, para eso usaremos el siguiente script.

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/6-agregando-columna-individual.sql
```

---

### Respuesta punto h:

Finalmente, con el comando GROUP BY sume esta nueva columna para las personas que pertenecen a un mismo hogar y guarde ese dato en una columna llamada ad_equiv_hogar (por ejemplo, si una familia está compuesta por un varón de 40 años (adulto_equiv=1) y su esposa de la misma edad (adulto_equiv=0.77) con sus mellizos varones de 5 años (adulto_equiv=0.60 cada uno), a todos se les deberáimputar en ad_equiv_hogar un valor igual a 2.97, que es la cantidad de adultos equivalentes en ese hogar.)

Para este punto vamos a volver a crear una nueva columna para la tabla individual y esta tendra la suma de la columna adulto_equiv para las personas que viven en un mismo hogar la cual fue previamente creada y llenada.

**Las personas que viven en un mismo hogar tienen el mismo codusu y nro_hogar**

Para agregar y llenar la columna correctamente ejecutaremos el siugiente script:

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/7-agregando-columna-individual-hogar-equiv.sql
```

---

### Punto 3: EPH la creciente cantidad de hogares que no reportan sus ingresos.

Para este punto vamos a crear 2 tablas nuevas, una con la informacion de las personas que si respondieron su ingreso total familiar y otra tabla con la informacion de las personas que no respondieron su ingreso total familiar.

**Las objervaciones con ITF = 0 son aquellas que no respondieron**

para ello vamos a ejecutar el siguiente script el cual se encarga de crear ambas tablas y ademas poblarla con los datos correspondientes.

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/8-cracion-tablas-itf.sql
```

Para saber cuantas personas no respondieron podemos ejecutar el siguiente script

```
select cont(*) as no_respondieron
from no_respondieron_itf;
```

Nos dio un total de 10985

---

### Punto 4: agregando columna nueva ingreso_necesario.

Para este punto agregamos una columna nueva llamada ingreso_necesario y el valor que tendra esta sera el precio de la canasta basica 27197.64 \* ad_equiv_hogar.

Ejecutando el siguiente script se realizara la tarea mencionada:

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/9-creando-ingreso-necesario.sql
```

---

### Punto 5: columna llamada pobre

Este punto es similar al anterior, vamos a agregar una nueva columna llamada pobre a la tabla respondieron_itf y dependiendo si supera el valor necesario se asignara un 1 o un 0 como se explica en el enunciado del ejercicio.

El siguiente script realiza lo mencionado anteriormente.

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/10-creando-pobre.sql
```

Ahora realizando el siguiente script:

```
select count(*)
from respondieron_itf
where pobre = 1;
```

Nos da un total de 14616 gente que no supera con su itf el ingreso_necesario de un total de 38721 individuos.

---
