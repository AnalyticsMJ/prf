#!/usr/bin/env bash

PASSWORD=$1

DATA_DIR="..\/temp" 

sed "-e s/{%data_dir%}/${DATA_DIR}/g" load_tables.sql.tpl | mysql -u root --password=${PASSWORD} prf
