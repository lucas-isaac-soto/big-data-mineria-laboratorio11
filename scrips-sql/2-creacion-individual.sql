CREATE TABLE individual (
        CODUSU CHAR(29),
        ANO4 INTEGER,
        TRIMESTRE SMALLINT,
        NRO_HOGAR SMALLINT, 
        COMPONENTE SMALLINT,
        H15 SMALLINT,
        REGION SMALLINT,
        MAS_500 CHAR(1),
        AGLOMERADO SMALLINT,
        PONDERA INTEGER, 
   
    CH03 SMALLINT,
    CH04 SMALLINT,
    CH05 TEXT,
    CH06 SMALLINT,
    CH07 SMALLINT,
    CH08 SMALLINT,
    CH09 SMALLINT,
    CH10 SMALLINT,
    CH11 SMALLINT,
    CH12 SMALLINT,
    CH13 SMALLINT,
    --CH14 SMALLINT,
    CH14 CHAR(3),
    CH15 SMALLINT,
    CH15_COD CHAR(3),
    CH16 SMALLINT,
    CH16_COD CHAR(3),
    NIVEL_ED SMALLINT,
    ESTADO SMALLINT,
    CAT_OCUP SMALLINT,
    CAT_INAC SMALLINT,
    IMPUTA SMALLINT,
    PP02C1 SMALLINT,
    PP02C2 SMALLINT,
    PP02C3 SMALLINT,
    PP02C4 SMALLINT,
    PP02C5 SMALLINT,
    PP02C6 SMALLINT,
    PP02C7 SMALLINT,
    PP02C8 SMALLINT,
    PP02E SMALLINT,
    PP02H SMALLINT,
    PP02I SMALLINT,

    PP03C SMALLINT,
    PP03D SMALLINT,
    PP3E_TOT DECIMAL,
    PP3F_TOT DECIMAL,
    PP03G SMALLINT,
    PP03H SMALLINT,

    PP03I SMALLINT,
    PP03J SMALLINT,
    INTENSI SMALLINT,

    PP04A SMALLINT,
    PP04B_COD INTEGER,
    PP04B1 SMALLINT,
    PP04B2 SMALLINT,

    PP04B3_MES SMALLINT,
    PP04B3_ANO SMALLINT,
    PP04B3_DIA SMALLINT,
    PP04C SMALLINT,
    PP04C99 SMALLINT,
    PP04D_COD CHAR(5),
    PP04G SMALLINT,

    PP05B2_MES SMALLINT,
    PP05B2_ANO SMALLINT,
    PP05B2_DIA SMALLINT,

    PP05C_1 SMALLINT,
    PP05C_2 SMALLINT,
    PP05C_3 SMALLINT,

    PP05E SMALLINT,
    PP05F SMALLINT,
    PP05H SMALLINT,

    PP06A SMALLINT,
    PP06C INTEGER,
    PP06D INTEGER,
    PP06E INTEGER,
    PP06H INTEGER,

    PP07A SMALLINT,
    PP07C SMALLINT,
    PP07D SMALLINT,
    PP07E SMALLINT,
    
    PP07F1 SMALLINT,
    PP07F2 SMALLINT,
    PP07F3 SMALLINT,
    PP07F4 SMALLINT,
    PP07F5 SMALLINT,
    PP07G1 SMALLINT,
    PP07G2 SMALLINT,
    PP07G3 SMALLINT,
    PP07G4 SMALLINT,
    PP07G_59 SMALLINT,
    PP07H SMALLINT,
    PP07I SMALLINT,
    PP07J SMALLINT,
    PP07K SMALLINT,

    PP08D1 INTEGER,
    PP08D4 INTEGER,
    PP08F1 INTEGER,
    PP08F2 INTEGER,
    PP08J1 INTEGER,
    PP08J2 INTEGER,
    PP08J3 INTEGER,
    
    PP09A INTEGER,
    PP09A_ESP CHAR(90),
    PP09B SMALLINT,
    PP09C SMALLINT,
    PP09C_ESP CHAR(90),

    PP10A SMALLINT,
    PP10C SMALLINT,
    PP10D SMALLINT,
    PP10E SMALLINT,
    PP11A SMALLINT,
    PP11B_COD INTEGER,
    PP11B1 SMALLINT,
    PP11B2_MES SMALLINT,
    PP11B2_ANO SMALLINT,
    PP11B2_DIA SMALLINT,
    PP11C SMALLINT,

    PP11C99 SMALLINT,
    PP11D_COD CHAR(5),

    PP11G_ANO SMALLINT,
    PP11G_MES SMALLINT,
    PP11G_DIA SMALLINT,

    PP11L SMALLINT,
    PP11L1 SMALLINT,
    PP11M SMALLINT,
    PP11N SMALLINT,
    PP11O SMALLINT,
    PP11P SMALLINT,
    PP11Q SMALLINT,
    PP11R SMALLINT,
    PP11S SMALLINT,
    PP11T SMALLINT,

    P21 INTEGER,

    DECOCUR CHAR(2),
    IDECOCUR CHAR(2),
    RDECOCUR CHAR(2),
    GDECOCUR CHAR(2),
    PDECOCUR CHAR(2),
    ADECOCUR CHAR(2),
    PONDIIO INTEGER,

    TOT_P12 INTEGER,
    P47T INTEGER,
    DECINDR CHAR(2),
    IDECINDR CHAR(2),
    RDECINDR CHAR(2),
    GDECINDR CHAR(2),
    PDECINDR CHAR(2),
    ADECINDR CHAR(2),
    PONDII INTEGER,

    V2_M INTEGER,
    V3_M INTEGER,
    V4_M INTEGER,
    V5_M INTEGER,
    V8_M INTEGER,
    V9_M INTEGER,
    V10_M INTEGER,
    V11_M INTEGER,
    V12_M INTEGER,
    V18_M INTEGER,
    V19_AM INTEGER,
    V21_M INTEGER,
    T_VI NUMERIC,
    
    ITF NUMERIC,
    DECIFR CHAR(2),
    IDECIFR CHAR(2),
    RDECIFR CHAR(2),
    GDECIFR CHAR(2),
    PDECIFR CHAR(2),
    ADECIFR CHAR(2),

    IPCF NUMERIC,
    DECCFR CHAR(2),
    IDECCFR CHAR(2),
    RDECCFR CHAR(2),
    GDECCFR CHAR(2),
    PDECCFR CHAR(2),
    ADECCFR CHAR(2),
    PONDIH INTEGER,

    PRIMARY KEY (CODUSU, ANO4,TRIMESTRE,NRO_HOGAR,COMPONENTE,H15,REGION,MAS_500,AGLOMERADO,PONDERA)
);

