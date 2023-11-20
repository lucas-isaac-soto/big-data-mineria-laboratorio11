--agregando columna nueva a tabla individual
ALTER TABLE individual
ADD COLUMN ad_equiv_hogar FLOAT;

--actualiza la columna con la sumatoria de las personas que viven en el mismo hogar
UPDATE individual AS indi
SET ad_equiv_hogar = subconsulta.suma_hogar
FROM (
    SELECT
        codusu,
        nro_hogar,
        SUM(adulto_equiv) AS suma_hogar
    FROM individual
    GROUP BY codusu, nro_hogar
) AS subconsulta
WHERE indi.codusu = subconsulta.codusu AND indi.nro_hogar = subconsulta.nro_hogar;

