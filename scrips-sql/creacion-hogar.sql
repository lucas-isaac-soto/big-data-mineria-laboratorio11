CREATE TABLE hogar (
    CODUSU CHAR(29),
    ANO4 SMALLINT,
    TRIMESTRE SMALLINT,
    NRO_HOGAR SMALLINT, 
    REALIZADA SMALLINT,
    REGION SMALLINT,
    MAS_500 CHAR(1),
    AGLOMERADO SMALLINT,
    PONDERA SMALLINT, 
    
    IV1 SMALLINT,
    IV1_ESP CHAR(45),
    IV2 SMALLINT,
    IV3 SMALLINT,
    IV3_ESP CHAR(45),
    IV4 SMALLINT,
    IV5 SMALLINT,
    IV6 SMALLINT,
    IV7 SMALLINT,
    IV7_ESP CHAR(45),
    IV8 SMALLINT,
    IV9 SMALLINT,
    IV10 SMALLINT,
    IV11 SMALLINT,
    IV12_1 SMALLINT,
    IV12_2 SMALLINT,
    IV12_3 SMALLINT,

    II1 SMALLINT,
    II2 SMALLINT,
    II3 SMALLINT,
    II3_1 SMALLINT,
--  II4 SMALLINT,
    II4_1 SMALLINT,
    II4_2 SMALLINT,
    II4_3 SMALLINT,
    II5 SMALLINT,
    II5_1 SMALLINT,
    II6 SMALLINT,
    II6_1 SMALLINT,
    II7 SMALLINT,
    II7_ESP CHAR(45),
    II8 SMALLINT,
    II8_ESP CHAR(45),
    II9 SMALLINT,

    V1 SMALLINT,
    V2 SMALLINT,
    V21 SMALLINT,
    V22 SMALLINT,
    V3 SMALLINT,
    V4 SMALLINT,
    V5 SMALLINT,
    V6 SMALLINT,
    V7 SMALLINT,
    V8 SMALLINT,
    V9 SMALLINT,
    V10 SMALLINT,
    V11 SMALLINT,
    V12 SMALLINT,
    V13 SMALLINT,
    V14 SMALLINT,
    V15 SMALLINT,
    V16 SMALLINT,
    V17 SMALLINT,
    V18 SMALLINT,
    V19_A SMALLINT,
    V19_B SMALLINT,

    IX_TOT SMALLINT,
    IX_MEN10 SMALLINT,
    IX_MAYEQ10 SMALLINT,

    ITF INTEGER,
    DECIFR CHAR(2),
    IDECIFR CHAR(2),
    RDECIFR CHAR(2),
    GDECIFR CHAR(2),
    PDECIFR CHAR(2),
    ADECIFR CHAR(2),

    IPCF DECIMAL,
    DECCFR CHAR(2),
    IDECCFR CHAR(2),
    RDECCFR CHAR(2),
    GDECCFR CHAR(2),
    PDECCFR CHAR(2),
    ADECCFR CHAR(2),
    POMDIH CHAR(6),

    VII1_1 SMALLINT,
    VII1_2 SMALLINT,
    VII2_1 SMALLINT,
    VII2_2 SMALLINT,
    VII2_3 SMALLINT,
    VII2_4 SMALLINT,

     PRIMARY KEY (CODUSU, NRO_HOGAR,REALIZADA,ANO4,TRIMESTRE,REGION,MAS_500,AGLOMERADO,PONDERA)
);
