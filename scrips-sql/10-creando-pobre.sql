--agregando columna nueva a tabla individual
ALTER TABLE respondieron_itf
ADD COLUMN pobre integer;

--actualizando la columna nueva
update respondieron_itf
set pobre = CASE 
                WHEN itf < ingreso_necesario THEN 1
                WHEN itf >= ingreso_necesario THEN 0
            END