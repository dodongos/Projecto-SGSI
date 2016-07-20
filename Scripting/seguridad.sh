#!/bin/bash
#      
# Título        :  seguridad.sh
# Descripción   :  Script diseñado para comprobar ciertos parámetros del servidor 
# Author        :  Juan Matamoro Padrón
# Date          :  mié jul 20 19:25:40 WEST 2016 
# Version       :  0.1    
# bash_version  :  Testeado en GNU bash
# OS Specs      :  Debian
#

# Variables
TST=1

# Algunas funciones

Show_menu() {
clear
cat <<_EOF
            -------------------------------------
            |     Menú de Seguridad             |
            -------------------------------------
            |   1. Puertos que están escuchando |
            |   2. Conexiones activas           |
            |   3. Uso de CPU                   |
            |   4. Seguridad del Kernel         |
            |   5. Control de auditoría y Logs  |
            |   6. Control de Servicios         |
            |   7. Compilar el Kernel           |
            |   8. Todos los anteriores         |
            |   9. Exit                         |
            -------------------------------------
##############################################################                                             

_EOF
}

Sub_menu() {
Line "-"
echo ""
cat <<_EOF
1. Volver al Menú Principal
2. Salir del programa
_EOF
Line "="
echo ""
}

Line() {
        local col_size=$(( $(tput cols) - 45))
        for (( i=$col_size; i>0; i--))
        do
                printf "%s" "${@}"
        done
}

Listen_ports() {
netstat -plunt
}

Active_conections() {
netstat -nt
}

CPU() {
top -b -n 1
}

Kernel_Tuning() {
kmod list
}

Log_check() {
dmesg
}

Audit_control () {
cat /var/log/auth.log
}

Service_Control () {
ps
}

Compilar() {
echo "Compilar el Kernel requiere ejecutar este script con privilegios de root"
echo ""
cd /usr/src/linux
make
}

#------------------------{ Programa Principal }-----------------------------------------
while ((TST>0));
do
Show_menu
read input
    case $input in

        1)  echo  "Puertos escuchando"
            Listen_ports  ;;
        2)  echo  "Conexiones activas"
            Active_conections    ;;
        3)  echo  "Uso de CPU"
            CPU    ;;
        4)  echo  "Seguridad del Kernel"
            Kernel_Tuning       ;;
        5)  echo  "Control de Auditoría y Logs"
            Log_check
            Audit_control	;;
        6)  echo "Control de Servicios"
            Service_Control	;;
	7)  echo "Compilar el Kernel"
	    Compilar		;;
        8)  echo "Todas las opciones"
            Listen_ports
            Active_conections
            CPU
            Kernel_Tuning
            Log_check
            Audit_control
            Service_Control	;;
        9)  exit 0                      ;;
        *)  echo "Opción desconocida... "
                                ;;
    esac
Sub_menu
read input
    case $input in                                                               
        1) TST=1                ;;
        2) TST=0                ;;
    esac
done
