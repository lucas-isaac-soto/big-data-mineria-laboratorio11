# Titulo: Trabajo Practico BigData
# Catedra: Base de Datos II
# Profesor: Ing. Fabio Salerno
# Alumno: 
#   - Lucas Soto

import psycopg2  #Biblioteca que conecta a base de datos
import matplotlib.pyplot as plt #Bliblioteca para mostrar graficos estadisticos
import numpy as np #Biblioteca soporte para vectores y matrices
import seaborn as sns
import pandas as pd

# Nombre de la base de datos de conexion por defecto
DBnombre = "bigdata"

# Nombre Funcion: conexion
# Descripcion: realiza una conexion a la base de datos de postgresql local.
# Parametros:
# Salidas:
#       -conexion a la base de datos especificada en variable DBnombre
def conexion():
    #Datos conexion
    usuario = "postgres"
    contrasenia = "321"
    direccion = "localhost"

    conn = psycopg2.connect(
            database=DBnombre,
            user=usuario,
            password=contrasenia,
            host=direccion)
    return conn

# Nombre Funcion: finConexion
# Descripcion: Finaliza una conexion y cursor activos.
# Parametros: cursor usado para recorrer registros y conn conexion a una base de datos
# Salidas:
def finConexion(cursor,conn):
    # Cerrar el cursor y la conexión
    if cursor:
        cursor.close()
    if conn:
        conn.close()
    pass

# Nombre Funcion: menu
# Descripcion: imprime por pantalla opciones del menu
# Parametros:
# Salidas:
def menu():
    print("\nMenu:")
    print("1. Estadistica 1")
    print("2. Estadistica 2")
    print("3. Estadistica 3")
    print("4. Salir")


# Nombre Funcion: subMenuEstadisticaSexo
# Descripcion: imprime por pantalla opciones del submenu para estadisticas en base a sexo
# Parametros:
# Salidas:
def subMenuEstadisticaSexo():
    print("\nSubMenu Estadisticas por Sexo:")
    print("1. Totales sin filtracion")
    print("2. Para menores de 10")
    print("3. Para mayores de 10 y menores de 18")
    print("4. Para mayores de 18")
    print("5. Para mayores de 40")
    print("6. Volver al menu principal")



# Nombre Funcion: mostrarGraficoBarraTortaEstadisticaSexo
# Descripcion: Se encarga de mostrar un grafico con un grafico de barra y un grafico de torta
# Parametros: 
#   -   valores: es un arreglo con 3 enteros    
#   -   tituloEstadistica: es una cadena que se muestra en la ventana donde se encuentran los graficos estadisticos
# Salidas:
def mostrarGraficoBarraTortaEstadisticaSexo(valores, titutloEstadistica):
    totales = valores[0]
    varones = valores[1]
    mujeres = valores[2]

    #Datos para el grafico de barra
    barraCategorias = ['Totales', 'Varones', 'Mujeres']
    barraColores = ['blue', 'red','pink']

    #Datos para el grafico de pie
    pieCategorias = ['Varones', 'Mujeres']
    pieColores = ['red', 'pink']
    pieValores = [varones*100/totales, mujeres*100/totales]


    #CREO UNA FIGURA CON 2 GRAFICOS
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))

    #Armando grafico de barras
    barra = ax1.bar(barraCategorias, valores, color=barraColores)
    ax1.set_xlabel('Individuos')
    ax1.set_ylabel('Cantidad')
    ax1.set_title('Grafico en Barra')
    
    #Asigna arriba de cada barra el valor que representa        
    for category, value in zip(barraCategorias, valores):
        ax1.annotate(str(value),
                 xy=(barraCategorias.index(category), value),
                 xytext=(0, 3),
                 textcoords="offset points",
                 ha='center', va='bottom', color='black')
        
    #Armando grafico de barras
    ax2.pie(pieValores, labels=pieCategorias, colors=pieColores, autopct='%1.2f%%', startangle=90)
    ax2.axis('equal')  #Para que el pie sea circular
    ax2.set_title('Grafico en Torta')


    plt.suptitle(titutloEstadistica, fontsize=16)
    plt.tight_layout()
    plt.show()


# Nombre Funcion: queryEstadisticaSexo
# Descripcion: devuelve una cadena en lenguaje postgresql en base a la opcion ingresada
# Parametros: opcion: es un valor cadena entre 1 y 5
# Salidas:
def queryEstadisticaSexo(opcion):
    if opcion == '1' :
        return """
        select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
        from individual;
        """
    elif opcion == '2' :
        return """
        select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
        from individual
        where ch06 <= 10;
        """
    elif opcion == '3' :
        return """
        select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
        from individual
        where ch06 > 10 and ch06 < 18;
        """
    elif opcion == '4' :
        return """
        select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
        from individual
        where ch06 >= 18;
        """
    elif opcion == '5' :
        return """
        select  count(*) as totales,
        count(CASE WHEN ch04 = 1 THEN 'VARON' END) as varones,
        count(CASE WHEN ch04 = 2 THEN 'MUJER' END) as mujeres
        from individual
        where ch06 >= 40;
        """


# Nombre Funcion: estadisticaSexoTotales
# Descripcion: muestra grafico estadistico en base a los individuos totales por su sexo
# Parametros:
#       - opcion: es un valor cadena entre 1 y 5 usado para una funcion
#       - tituloEstadistica: es una cadena de texto utilizada para una funcion
# Salidas:
def estadisticaSexo(opcion,tituloEstadistica):
    try:
        conn = conexion()

        cursor = conn.cursor()
        sql_query = queryEstadisticaSexo(opcion)

        cursor.execute(sql_query)
        resultados = cursor.fetchall()

        totales = 0
        varones = 0
        mujeres = 0
        
        print("------------------------------")
        print("|    Estadisticas por sexo:    |")
        print("------------------------------\n")
        for resultado in resultados:
            print(f"[   Individuos totales: {resultado[0]},")
            print(f"    Individuos varones: {resultado[1]},")
            print(f"    Individuos mujeres: {resultado[2]},")
            print("\n----------------------------------\n")
            
            totales = int(resultado[0])
            varones = int(resultado[1])
            mujeres = int(resultado[2])

        valores = [totales, varones, mujeres]

        mostrarGraficoBarraTortaEstadisticaSexo(valores,tituloEstadistica)

    except psycopg2.Error as e:
        print(f"Error: {e}")
    finally:
        finConexion(cursor,conn)


def option2():
    #Realice una matriz de correlación con las siguientes variables: CH04, CH07, CH08, NIVEL_ED, ESTADO, CAT_INAC, IPCF. Comente los resultados.
    #ch04: sexo del individuo. 1 varon, 2 mujer
    #ch07: relacion sentimental
    #ch08: cobertura medica
    #NIVEL_ED: nivel educativo
    #ESTADO: Ocupado,Desocupado, Inactivo , menor 10 años
    #CAT_INAC: categoria inactividad
    #ipcf: monto de ingreso per capita familiar  
    
    try:
        conn = conexion()
        cursor = conn.cursor()
        sql_query = """
        select  ind.ch04 as sexo,
                ind.ch07 as relacion_sentimental,
                ind.ch08 as cobertura_medica,
                ind.nivel_ed as nivel_educativo,
                ind.estado,
                ind.cat_inac as categoria_inactividad,
                ind.ipcf as ingreso_percapita_familiar
        from individual ind
        inner join hogar hog on hog.codusu = ind.codusu and hog.nro_hogar = ind.nro_hogar;
        """
        cursor.execute(sql_query)
        resultados = cursor.fetchall()

        data = {
            'ch04': [],
            'ch07': [],
            'ch08': [],
            'NIVEL_ED': [],
            'ESTADO': [],
            'CAT_INAC': [],
            'ipcf': [],
        }
        person_data = {
        }

        print("------------------------------")
        print("|    Matriz de correlacion    |")
        print("------------------------------\n")
        for resultado in resultados:
            #recuperando los datos de la persona
            person_data = {
                'ch04': int(resultado[0]),
                'ch07': int(resultado[1]),
                'ch08': int(resultado[2]),
                'NIVEL_ED': int(resultado[3]),
                'ESTADO': int(resultado[4]),
                'CAT_INAC': int(resultado[5]),
                'ipcf': float(resultado[6]),
            }
            #agregando informacion al dataset
            for variable, value in person_data.items():
                data[variable].append(value)
        
         # formate a una matriz
        df = pd.DataFrame(data)

        # realiza la correlacion de la matriz
        corr_matrix = df.corr()

        #crea el mapa de calor con seaborn
        plt.figure(figsize=(10, 8))
        sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt='.2f', square=True)
        plt.title('Matriz de Correlacion')
        plt.show()
        
    except psycopg2.Error as e:
        print(f"Error: {e}")
    finally:
        finConexion(cursor,conn)



def option3():
    # Creating a hypothetical dataset
    data = {
        'ch04': [1, 2, 1, 2, 1],
        'ch07': [1, 2, 3, 4, 5],
        'ch08': [1, 2, 3, 4, 5],
        'NIVEL_ED': [1, 2, 3, 4, 5],
        'ESTADO': [1, 2, 3, 4, 5],
        'CAT_INAC': [1, 2, 3, 4, 5],
        'ipcf': [1000, 2000, 1500, 3000, 2500],
    }

    # formate a una matriz
    df = pd.DataFrame(data)

    # realiza la correlacion de la matriz
    corr_matrix = df.corr()

    # crea el mapa decalor con seaborn
    plt.figure(figsize=(10, 8))
    sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt='.2f', square=True)
    plt.title('Matriz de Correlacion')
    plt.show()


def main(): 
    while True:
        menu()
        opcion = input("Ingrese una opcion (1-4): ")

        #Grafico estadistico para individuos en base a su sexo
        if opcion == '1':
            subMenuEstadisticaSexo()
            subOpcion = input("Ingrese una opcion (1-6): ")
            
            if subOpcion == '1':
                estadisticaSexo(subOpcion,'Estado de individuos en base a su sexo')
            elif subOpcion == '2':
                estadisticaSexo(subOpcion,'Estado de individuos menores o iguales de 10 anios en base a su sexo')
            elif subOpcion == '3':
                estadisticaSexo(subOpcion,'Estado de individuos mayores de 10 y menores de 18 anios en base a su sexo')
            elif subOpcion == '4':
                estadisticaSexo(subOpcion, 'Estado de individuos mayores o iguales de 18 anios en base a su sexo')
            elif subOpcion == '5':
                estadisticaSexo(subOpcion, 'Estado de individuos mayores o iguales de 40 anios en base a su sexo')
            elif subOpcion == '6':
                print('\n')
            else:
                print("Opcion Invalida. Volviendo al menu Principal")

        elif opcion == '2':
            option2()
        elif opcion == '3':
            option3()

        elif opcion == '4':
            print("Finalizando el programa. HASTA LUEGO!")
            break
        else:
            print("Opcion Invalida. Ingrese un numero entre 1 - 4.")




if __name__ == "__main__":
    main()