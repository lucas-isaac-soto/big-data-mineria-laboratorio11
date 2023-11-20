--agregando columna nueva a tabla individual
ALTER TABLE respondieron_itf
ADD COLUMN ingreso_necesario FLOAT;

--actualizando la columna nueva
update respondieron_itf
set ingreso_necesario = 27197.64 * ad_equiv_hogar;