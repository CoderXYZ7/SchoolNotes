#!/bin/bash

# Function to execute an SQL file
function esegui_file_sql {
    local server=$1
    local port=$2
    local username=$3
    local password=$4
    local sql_file_path=$5

    # Replace the placeholder with the absolute path of the CSV directory
    current_path_mysql=$(pwd)/DatiCSV
    sed -i "s|%currentPathMySql%|$current_path_mysql|g" "$sql_file_path"

    # Execute the SQL file using the MySQL client
    mysql -h "$server" -P "$port" -u "$username" -p"$password" < "$sql_file_path"

    if [ $? -eq 0 ]; then
        echo "File SQL eseguito con successo. Database creato e dati importati."
    else
        echo "Errore durante l'esecuzione del file SQL."
    fi
}

# Prompt the user for MySQL server access details
read -p "Inserisci la porta su cui MySQL è in ascolto (es.: 3306 o 3307): " port
read -p "Inserisci il nome utente per accedere a MySQL (es.: root): " username
read -s -p "Inserisci la password per accedere a MySQL con l'utente $username: " password
echo

# MySQL server settings
server="localhost"

# Path to the SQL file to execute
sql_file_path="./Script/Command.sql"

# Call the function to execute the SQL file
esegui_file_sql "$server" "$port" "$username" "$password" "$sql_file_path"