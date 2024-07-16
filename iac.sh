#!/bin/bash
#criação dos diretórios
mkdir -v -m 777 /publico
Diretorios=(/adm /ven /sec)
for i in "${!Diretorios[@]}";
do mkdir -v -m 770 "${Diretorios[$i]}";
done

#criação dos grupos
Grupos=(GRP_ADM GRP_VEN GRP_SEC)
for i in "${!Grupos[@]}";
do groupadd "${Grupos[$i]}";
done

#mudando o grupo dos diretórios
for i in "${!Grupos[@]}";
do chown -v root:"${Grupos[$i]}" "${Diretorios[$i]}";
done

#criação dos usuários
Usuarios_adm=(carlos maria joao)
for i in "${!Usuarios_adm[@]}";
do echo "Criando usuario:" "${Usuarios_adm[$i]}";
useradd "${Usuarios_adm[$i]}" -c "${Usuarios_adm[$i]}" -s /bin/bash -G GRP_ADM -p $(openssl passwd -1 Senha123) ;
passwd "${Usuarios_adm[$i]}" -d;
done

Usuarios_ven=(debora sebastiana roberto)
for i in "${!Usuarios_ven[@]}";
do echo "Criando usuario:" "${Usuarios_ven[$i]}";
useradd "${Usuarios_ven[$i]}" -c "${Usuarios_ven[$i]}" -s /bin/bash -G GRP_VEN -p $(openssl passwd -1 Senha123);
passwd "${Usuarios_ven[$i]}" -e;
done

Usuarios_sec=(josefina amanda rogerio)
for i in "${!Usuarios_sec[@]}";
do echo "Criando usuario:" "${Usuarios_sec[$i]}";
useradd "${Usuarios_sec[$i]}" -c "${Usuario_sec[$i]}" -s /bin/bash -G GRP_SEC -p $(openssl passwd -1 Senha123);
passwd "${Usuarios_sec[$i]}" -e;
done
