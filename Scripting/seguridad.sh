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
            |   7. Todos los anteriores         |
            |   8. Exit                         |
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


#------------------------{ Programa Principal }-----------------------------------------
while ((TST>0));
do
Show_menu
read input
    case $input in

        1)  echo  "Select SSH"
            SSH_Security_check  ;;
        2)  echo  "TCP Wrapper"
            TCPWrapper_check    ;;
        3)  echo  "FileSystem Security Check"
            FileSystemChecks    ;;
        4)  echo  "Kernel Level Security"
            Kernel_Tuning       ;;
        5)  echo  "Log & audit control"
            Log_check
            Audit_control
            User_Set_Perm
            Disable_user
            Disable_Group       ;;
        6)  echo "Service Control"
            Service_Control
            Xinetd_srv_control  ;;
        7)  echo "Selected All Options"
            SSH_Security_check
            TCPWrapper_check
            FileSystemChecks
            Kernel_Tuning
            Log_check
            Audit_control
            User_Set_Perm
            Disable_user
            Disable_Group
            Service_Control
            Xinetd_srv_control  ;;
        8)  exit 0                      ;;
        *)  echo "unknown Options... "
                                ;;
    esac
Sub_menu
read input
    case $input in                                                               
        1) TST=1                ;;
        2) TST=0                ;;
    esac
done
