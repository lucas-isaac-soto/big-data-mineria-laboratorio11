-- c.
--Si hay observaciones con valores que no tienen sentido, descártelas (ingresos y edades negativos, por ejemplo).

-- SE ENCONTRO UN REGISTRO CON DESCRIPCION DE TIPO DE VIVIENDA SIN SENTIDO.
select  codusu,
        nro_hogar, 
        iv1 as tipo_hogar,
        iv1_esp as descripcion
from hogar
where iv1 = 6
order by codusu;

--SE EN CONTRO HOGARES CON AMBIENTES 99???
select  codusu,
        nro_hogar,
        iv2 as ambientes_hogar
from hogar
order by iv2 desc;

--origen del agua del hogar
SELECT  codusu,
        nro_hogar, 
        IV6 as agua_hogar,
        IV7 as agua_es_de, 
        iv7_esp as descripcion 
from hogar 
order by iv7 desc;


--tiene banio, donde  | SE ENCONTRO VALOR 0 EN UBICACION BANIO invalido.
SELECT  codusu,
        nro_hogar,
        IV8 as tiene_banio,
        iv9 as ubicacion_banio
from hogar 
order by iv9;

--vivienda cerca de basural, zona indundable, villa de emergencia
SELECT  codusu,
        nro_hogar,
        IV12_1 as cerca_basural, 
        IV12_2 as zona_indundable, 
        IV12_3 as villa_emergencia 
from hogar
order by IV12_1, IV12_2, IV12_3;

--ambientes exclusivos, cuantos para dormir | algunos tienen 99 que significa
select  codusu,
        nro_hogar,
        ii1 as ambientes_exclusivos,
        ii2 as ambientes_para_dormir
from hogar
order by ii1, ii2;

--tenencia del hogar y descripcion si es necesario. hay valores con 0
select  codusu,
        nro_hogar,
        ii7 as tenencia_hogar,
        ii7_esp as tenencia_descripcion
from hogar
order by ii7;

--combustible cocina y descripcion si es necesario. hay valores con 0
select  codusu,
        nro_hogar,
        ii8 as combistible_cocina,
        ii8_esp as combustible_descripcion
from hogar
order by ii8;

--uso del banio en el hogar. hay valores con 0
select  codusu,
        nro_hogar,
        ii9 as uso_banio_hogar
from hogar
order by ii9;

--ultimos 3 meses las personas del hogar han vivido
select  codusu,
        nro_hogar, 
        v1 as de_lo_que_ganan,
        v2 as alguna_jubilacion,
        v21 as aguinaldo_jubilacion_pension,
        v22 as retroactivo_jubilacion,
        v3 as indemnizacion_despido,
        v4 as seguro_desempleado,
        v5 as subsidio_ayuda_social,
        v6 as mercaderia_ropa_alimentos_gobierno,
        v7 as mercaderia_ropa_alimentos_familiares_otros,
        v8 as alquiler_propietario,
        v9 as negocio_no_trabaja,
        v10 as intereses_plazofijo_inversion,
        v11 as beca_estudio,
        v12 as cuota_alimento_ayuda_otros,
        v13 as de_lo_ahorrado,
        v14 as prestamos_familia_amigos,
        v15 as prestamos_banco_financiera,
        v16 as compra_cuota_fiado,
        v17 as vender_pertenencoas,
        v18 as efectivo_limosnas_azar,
        v19_a as menor10_dinero_trabajo,
        v19_b as menor10_pidiendo
from hogar;


--resumen hogar cantidad miembros
select  codusu,
        nro_hogar,
        ix_tot as total_miembros_hogar,
        ix_men10 as menores10_anios,
        ix_mayeq10 as mayor10_anios
from hogar;

--ingreso total y per capita familiar | hay muchos registros donde el ingreso total es 0
select  codusu,
        nro_hogar,
        itf as total_familiar,
        ipcf as ingreso_per_capita_familiar
from hogar
order by itf;
