#!/bin/bash

Diretorios=(/publico /adm /ven /sec)
for i in "${!Diretorios[@]}";
do rmdir -v "${Diretorios[$i]}";
done

echo "Excluindo grupos..."
Grupos=(GRP_ADM GRP_VEN GRP_SEC)
for i in "${!Grupos[@]}";
do groupdel "${Grupos[$i]}";
done

echo "Excluindo usuários"
Usuarios=(carlos maria joao debora sebastiana roberto josefina amanda rogerio)
for i in "${!Usuarios[@]}"; 
do userdel "${Usuarios[$i]}"; 
done
