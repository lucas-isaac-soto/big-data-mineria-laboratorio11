--agregando columna nueva a tabla individual
ALTER TABLE individual
ADD COLUMN adulto_equiv FLOAT;

--logica para agregar el valor correcto de la tabla adulto_equivalente

--Este query actualiza el valor para aquellas personas que son mayores a 75 anios
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = 76)
where ch06 >= 76;

--Este query actualiza el valor para aquellas personas que son entre 61 y 75 anios
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = 61)
where ch06 >= 61 and ch06 <= 75;

--Este query actualiza el valor para aquellas personas que son entre 46 y 60 anios
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = 46)
where ch06 >= 46 and ch06 <= 60;


--Este query actualiza el valor para aquellas personas que son entre 30 y 45 anios
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = 30)
where ch06 >= 30 and ch06 <= 45;


--Este query actualiza el valor para aquellas personas que son entre 18 y 29 anios
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = 18)
where ch06 >= 18 and ch06 <= 29;

--Este query actualiza el valor para aquellas personas que son menores a 18
update individual
set adulto_equiv = (select CASE 
                                WHEN ch04 = 1 THEN varones
                                WHEN ch04 = 2 THEN mujeres
                            END as adulto_equiv
                    from adulto_equivalente
                    where descripcion_anios = ch06)
where ch06 < 18;

