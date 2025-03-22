#!/bin/bash
export $(grep -v '^#' .env | xargs)

output=$(docker exec -i mariadb mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
SHOW DATABASES;
SELECT user FROM mysql.user;
")

if echo "$output" | grep -q ${WORDPRESS_DB_NAME} &&
   echo "$output" | grep -q ${ROUND_DB_NAME} &&
   echo "$output" | grep -q ${WORDPRESS_DB_USER} &&
   echo "$output" | grep -q ${ROUND_DB_USER} 
then
    echo "✅ Banco de dados e usuários verificados com sucesso!"
else
    echo "❌ Verificação falhou. Confira os bancos e usuários criados."
    echo "--- Variáveis de ambiente ---"
    echo ${WORDPRESS_DB_NAME}
    echo ${ROUND_DB_NAME}
    echo ${WORDPRESS_DB_USER}
    echo ${ROUND_DB_USER}
    echo "--- Saída completa ---"
    echo "$output"
fi