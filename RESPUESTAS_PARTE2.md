# big-data-mineria-laboratorio11

- Anio: 2023
- Universidad Del Chubut, Argentina, Chubut Rawson
- Materia: Bases de Datos II
- Docente: Ing. Fabio Salerno
- Alumno: Soto Lucas

---

## Respuestas PARTE II

## (Antes de poder correr el programa en python es necesario que lea el archivo REQUISITOS.md y siga los pasos para que pueda ejecutar el programa.)

---

### Creando tabla usando usu_hogar_T122.xls

Para este punto el uso del scrip creacion-hogar.sql ya nos permitira migrar los datos.

### Punto 2: Uniendo tabla hogar con individual.

Para esto podemos usar el siguiente scrip el cual nos permite unir 2 tablas:

```
select *
from hogar ho
inner join individual indi on indi.codusu = ho.codusu and indi.codusu = ho.codusu;
```

---

### Punto 3: Limpiando base de datos y variables categoricas.

No se encontraron datos faltantes u erroneso, y no fue posible identificar variables categoricas.  
Por lo tanto para este punto no se tomaran medidas.

---

### Punto 4: Construyendo variables.

Las variables que se decidieron crear son:

- menor18_trabaja: 1 si el menor trabaja pidiendo o en un oficio. 0 si no y 2 si no tiene menores de 15 anios
- conyuge_trabaja: 1 si esta ocupado, 2 si esta desocupado.

Con el siguiente scrip se pueden crear las columnas necesarias y cargarle los datos correspondientes.

```
\i /path-a-carpeta/big-data-mineria-laboratorio11/scrips-sql/11-creando-variables-hogar.sql
```

---

### Punto 5: Grafico de correlacion de variables con matriz.

Para poder interpretar la matriz resultado es necesario que esta matriz nos muestra que tanto impactan las variables entre si, siendo valores entre +-0 y +-0,3 tienen un poco impacto y en cuanto incremente hasta 1 esta tiene un impacto muy fuerte entre ellas.

La diagonal siempre sera de 1 como se puede observar la matriz en el ejercicio.

Las variables que voy a relacionar son: menor18_trabaja, conyuge_trabaja, iv2 , v1 , v11 y itf

**Para poder ver la matriz debe ir a la carpeta ESTADISTICAS-PYTHON, y ejecutar con python3 appEstadisticas.py e ir a la opcion 3**

---

### Los puntos 6 7 ya se realizaron en la respuesta 1

---

### Punto 8: tasa de hogares bajo la linea de pobreza.

Para este puntos vamos a utilizar nuestras tablas ya preparadas y con sql realizar una consulta que nos devuelve cual es esta tasa de hogares bajo el indice de pobreza.

Con el siguiente query podemos ver cuantos hogares tenemos en total donde fueron reportados los ingresos itf

```
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
```

Nos dio un total de 13269 hogares

Con el siguiente query podemo ver de esos hogares cuantos son pobres:

```
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
```

Nos dio un total de 3639 hogares que caen bajo la linea de pobreza.

Eso quiere decir que con la muestra que utilizamos sacada de indec el porcentaje de hogares bajo la linea de pobreza, utilizando regla de tres simple:

13269 total hogares -> 100%
3639 hogares bajo pobreza -> x

(3639 \* 100 ) / 13269 = 27,43 %

Segun el INDEC el total de hogares bajo la linea de pobreza fue de: 27,9%

Los calculos que se hicieron utilizando los datos del indec nos dio una aproximacion del resultado calculado por ellos.

### Punto 9: esta repetido junto al 8.

# FIN DEL LABORATORIO
