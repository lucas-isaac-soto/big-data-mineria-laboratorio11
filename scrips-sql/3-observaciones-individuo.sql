
-- informacion basica del individuo
select  codusu,
        nro_hogar,
        componente,
        ch03 as parentezco_hogar,
        ch04 as sexo,
        ch05 as fecha_nacimiento,
        ch06 as anios_cumplidos,
        ch07 as relacion_sentimental
from individual;

-- informacion medica y estudios del individuo
select  codusu,
        nro_hogar,
        componente,
        ch08 as cobertura_medica,
        ch09 as lee_escribe,
        ch10 as asiste_asistio_educacion,
        ch11 as donde_estudio,
        ch12 as estudio_mas_alto,
        ch13 as finalizo_ese_nivel,
        nivel_ed as nivel_educativo
from individual;

-- informacion nacimiento individuo
select  codusu,
        nro_hogar,
        componente,
        ch15 as donde_nacio,
        ch16 as donde_vivio_5_anios
from individual;


--informacion estado individuo ocupado 
select  codusu,
        nro_hogar,
        componente,
        estado as estado,
        cat_ocup as categoria_estado
from individual; 

--informacion estado individuo inactivo
select  codusu,
        nro_hogar,
        componente,
        estado as estado,
        cat_inac as categoria_inactivo
from individual; 


--informacion ingresos individuo
select  codusu,
        nro_hogar,
        componente,
        p47t as total_ingreso,
        p21 as ingreso_ocupacion_principal,
        Tot_p12 as ingreso_otras_ocupaciones,
        v2_m as ingreso_jubilacion,
        v3_m as ingreso_indemnizacion_despido,
        v4_m as ingreso_seguro_desempleo,
        v5_m as ingreso_subsidio_ayuda_social,
        v8_m as ingreso_alquiler,
        v9_m as ingreso_negocio_trabajo,
        v10_m as ingreso_interes_plazofijo_inversion,
        v11_m as ingreso_beca_estudio,
        v12_m as ingreso_cuotas_alimento_ayuda_personas,
        v19_am as ingreso_trabajo_menores10,
        t_vi as ingreso_no_laboral
from individual
order by p47t; 


