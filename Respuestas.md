# big-data-mineria-laboratorio11

* Anio: 2023
* Universidad Del Chubut, Argentina, Chubut Rawson 
* Materia: Bases de Datos II
* Docente: Ing. Fabio Salerno
* Alumno: Soto Lucas
  
---

## Respuestas

### Parte I: Analisis.

1. 
   Las nociones de pobreza e indigencia empleadas por el INDEC para el cálculo de incidencia se corresponden con el método de medición indirecta, denominado también “línea”. El concepto de “Línea de Indigencia” (LI) procura establecer si los hogares cuentan con ingresos suficientes para cubrir una canasta de alimentos capaz de satisfacer un umbral mínimo de necesidades energéticas y proteicas, denominada Canasta Básica Alimentaria (CBA). De esta manera, los hogares que no superan ese umbral o línea son considerados indigentes. Los componentes de la CBA se valorizan con los precios relevados por el Índice de Precios al Consumidor (IPC) para cada período de medición.

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


2.     
    Base Individual y hogar. Total aglomerados , total interior, aglomerados de más y menos de 500.000 habitantes y cada aglomerado de EPH.
    Primer trimestre 2022.

## Migracion

A tener en cuenta:  
parece usar 2 bases de datos HOGAR y PERSONAS.  

Cada registro en ambas bases tienen tienen un codigo de identificacion (CODUSU), relaciona una vivienda con los hogares y las personas que lo componen.

en la base de datos HOGAR (archivo usu_hogar.txt) todo hogar que pertenezca a una misma vivienda tiene el mismo CODUSU. Para identificar los hogares se debe utilizar CODUSU y NRO_HOGAR.

en la base de datos PERSONAS (archivo usu_individual.txt) todo miembro del hogar tiene mismo CODUSU y NRO_HOGAR pero se difernecia por numero COMPONENTES.


