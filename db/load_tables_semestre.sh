#!/usr/bin/env bash

PASSWORD=$1

DATA_DIR="..\/temp" 
ANOS="2007 2008 2009 2010 2011 2012"
SEMESTRES="1 2"
for ANO in $ANOS; do
  for SEM in $SEMESTRES; do
    sed "-e s/{%ano%}/${ANO}/g;s/{%sem%}/${SEM}/g;s/{%data_dir%}/${DATA_DIR}/g" load_tables_semestre.sql.tpl | mysql -u root --password=${PASSWORD} prf
  done
done
