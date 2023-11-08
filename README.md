# big-data-mineria-laboratorio11

* Anio: 2023
* Universidad Del Chubut, Argentina, Chubut Rawson 
* Materia: Bases de Datos II
* Docente: Ing. Fabio Salerno
* Alumno: Soto Lucas

Analizaremos el problema de la medición de la tasa de pobreza y aplicar distintos métodos de la Minería de Datos, para identificar individuos que caen bajo la línea de pobreza.

---

## Parte I: Analisis.
La Encuesta Permanente de Hogares (EPH) es un programa nacional de producción sistemática y permanente de indicadores sociales que lleva a cabo el Instituto Nacional de Estadística y Censos (INDEC), que permite conocer las características sociodemográficas y socioeconómicas de la población. Uno de los indicadores más valiosos que pueden obtenerse con los datos extraídos de esta encuesta es la tasa de pobreza.  

1. Utilizando información disponible en la página del INDEC, explique brevemente cómo se identifica a las personas pobres.

---

2. Entre a la página [Indec Bases de Datos](https://www.indec.gob.ar/indec/web/Institucional-Indec-BasesDeDatos "Indec").  
Descarguen la base de microdatos de la Encuesta Permanente de Hogares (EPH) correspondiente al primer trimestre de 2022. En la página web, también encontrará un diccionario de variables con el nombre de “Diseño de registro y estructura para las bases preliminares (hogares y personas)”; este archivo les indica qué significa cada variable que aparece en la base de datos, en particular, en la sección de Diseño de registros de la base Personas.


<ol style="list-style-type:lower-alpha">
    <li>Migrelo a Postgresql.</li>
    <li>Elimine todas las observaciones que no corresponden a los aglomerados de Ciudad Autónoma de Buenos Aires o Gran Buenos Aires.</li>
    <li>Si hay observaciones con valores que no tienen sentido, descártelas (ingresos y edades negativos, por ejemplo).</li>
    <li>Una vez hecha esa limpieza, realice un gráfico de barras mostrando la composición por sexo.</li>
    <li>Realice una matriz de correlación con las siguientes variables: CH04, CH07, CH08, NIVEL_ED, ESTADO, CAT_INAC, IPCF. Comente los resultados.</li>
    <li>¿Cuántos desocupados hay en la muestra? ¿Cuántos inactivos? ¿Cuál es la media de ingreso per cápita familiar (IPCF) según estado (ocupado, desocupado, inactivo)?</li>
    <li>Utilizando el archivo tabla_adulto_equiv.xlsx, agregue una columna a su base de datos llamada adulto_equiv que contenga los valores de adulto equivalente de cada persona según su sexo y edad (por ejemplo, a un varón de 2 años le corresponde 0.46).</li>
    <li>Finalmente, con el comando GROUP BY sume esta nueva columna para las personas que pertenecen a un mismo hogar y guarde ese dato en una columna llamada ad_equiv_hogar (por ejemplo, si una familia está compuesta por un varón de 40 años (adulto_equiv=1) y su esposa de la misma edad (adulto_equiv=0.77) con sus mellizos varones de 5 años (adulto_equiv=0.60 cada uno), a todos se les deberáimputar en ad_equiv_hogar un valor igual a 2.97, que es la cantidad de adultos equivalentes en ese hogar.)</li>
</ol>

---

3. Uno de los grandes problemas de la EPH es la creciente cantidad de hogares que no reportan sus ingresos. ¿Cuántas personas no respondieron cuál es su ingreso total familiar (ITF)? Guarde como una base distinta las observaciones donde respondieron la pregunta sobre su ITF bajo el nombre respondieron. Las observaciones con ITF=0 guárdelas bajo el nombre norespondieron.

---


4. Sabiendo que la Canasta Básica Total para un adulto equivalente en el Gran Buenos Aires en el primer trimestre de 2022 es aproximadamente $27.197,64, agregue a la base respondieron una columna llamada ingreso_necesario que sea el producto de este valor por ad_equiv_hogar. 

---

5. Por último, agregue a respondieron una columna llamada pobre que tome valor 1 si el ITF es menor al ingreso_necesario que necesita esa familia, y 0 en caso contrario. ¿Cuántos pobres identificó?.

---


## Parte II: Análisis de la base de hogares y cálculo de pobreza

Ahora que ya se han familiarizado con la Encuesta Permanente de Hogares (EPH) asegúrense de estar calculando niveles de pobreza a nivel individual y a nivel de hogar similares a los que calcula el INDEC para la misma región.

1. Descarguen la base de microdatos de la EPH correspondiente al primer trimestre de 2022 (la base de hogares se llama usu_hogar_T122.xls). Importen los datos de la encuesta de hogar y al igual que en el TP1 conserven sólo las observaciones que corresponden a los aglomerados de Ciudad Autónoma de Buenos Aires o del Gran Buenos Aires.

---

2. Unan la tabla de la encuesta individual con la de la encuesta de hogar. Asegúrense de estar usando las variables CODUSU y NRO_HOGAR.

---

3. Limpien la base de datos tomando criterios que hagan sentido, tanto para el tratamiento de los valores faltantes, de los outliers, como así también decidan qué variables categóricas y strings usarán y transfórmenlas de forma que haga sentido para los ejercicios siguientes. Justifiquen sus decisiones.

---

4. Construyan variables (mínimo 2) que no estén en la base pero que sean relevantes a la hora de predecir individuos bajo la línea de pobreza (ej. proporción de mujeres (o niños) en el hogar, ¿su cónyuge trabaja?)

---

5. Sean creativos y presenten un gráfico (que no sea de barras) para describir la interacción o correlación entre dos o más variables.

---

6. Construyan la columna adulto_equiv y la columna ad_equiv_hogar y luego dividan la base en dos dataframes donde: uno conserve las personas que reportaron ITF (llamada respondieron) y la otra conserve las personas que no reportaron ITF (llamada norespondieron). Además, agreguen a la base respondieron una columna llamada ingreso_necesario que sea el producto de la canasta básica por ad_equiv_hogar.

---

7. Agreguen a respondieron una columna llamada pobre que tome valor 1 si el ITF es menor al ingreso_necesario que necesita esa familia, y 0 en caso contrario.

---

8. Para calcular la tasa de hogares bajo la linea de pobreza utilicen una sola observación por hogar y sumen el ponderador PONDIH que permite expandir la muestra de la EPH al total de la población que representa. ¿Cuál es la tasa de hogares bajo la línea de pobreza para el Gran Buenos Aires? ¿Lograron que se asemeje al % que reporta el INDEC? el ITF es menor al ingreso_necesario que necesita esa familia, y 0 en caso contrario.

---

9.  Para calcular la tasa de hogares bajo la linea de pobreza utilicen una sola observación por hogar y sumen el ponderador PONDIH que permite expandir la muestra de la EPH al total de la población que representa. ¿Cuál es la tasa de hogares bajo la línea de pobreza para el Gran Buenos Aires? ¿Lograron que se asemeje al % que reporta el INDEC?
