# Antes de comenzar para poder utilizar el programa en python es necesario que cuente con:

## ANTES DE EJECUTAR EL PROGRAMA

instalar python y hacer un hola mundo

LISTAR TODOS LOS PYTHONS  
ls /usr/bin/python\*

VERIFICAR PHYTON INSTALADO  
python3 --version  
phyton --version#instalando python3.11

INSTALAR PYTON 3.10 (YA QUE EN PYTHON 3.11 NO FUNCIONA psycopg2)  
sudo atp-get install python3.10

HACER UN HOLA MUNDO  
python3.10  
print("hola mundo")

---

INSTALAR PIP  
sudo apt install python3-pip

---

INSTALAR EL MODULO PSYCOPG2 PARA QUE LEA BASE DE DATOS  
pip install psycopg2-binary
pip install psycopg2
pip3 install psycopg2

VERIFICAR NOMBRE DATABASE, NOMBRE USUARIO Y CONTRASENIA USUARIO DEL PROGRAMA  
dbname  
usuario  
password

---

GRAFICOS ESTADISTICO (el segundo me funciono)  
pip install matplotlib  
python3 -m pip install -U matplotlib

COMPLEMENTOS ESTADISTICOS
python3 -m pip install seaborn
pip install seaborn

---

EJECUTAR PROGRAMA
python3 appEstadisticas.py

LOGICA PARA REALIZAR LAS CONSULTAS CON PSYCOPG2
1 HACEMOS UNA CONEXION
2 CREAMOS UN CURSOR DE LA CONEXION
3 PREPARAMOS STRING SQL
4 EJECUTAMOS CONSULTA SOBRE EL CURSOR
5 OBTENEMOS LOS RESULTADOS DE CURSOR CON FETCHALL
6 ITERAMOS SOBRE LOS POSIBLES RESULTADOS

Con todo lo mencionado anteriormente ya podrias correr el programa tranquilamente
