#!/usr/bin/env bash

CURRENT_DIR=`pwd`

ESTADOS="AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO"

DATA_DIR="../data" 

OUTPUT_DIR="../temp"

mkdir "${OUTPUT_DIR}/config"

for UF in $ESTADOS; do
	sed "-e s/{%uf%}/${UF}/g;" export_svg.tpl.json > "${OUTPUT_DIR}/config/${UF}.json"
	sed "-e s/{%uf%}/${UF}/g;" export_miniature_svg.tpl.json > "${OUTPUT_DIR}/config/thumb-${UF}.json"
done

cd $DATA_DIR

mkdir "${OUTPUT_DIR}/output"
for UF in $ESTADOS; do
  	echo "Gerando svg para ${UF}..."
	kartograph "${OUTPUT_DIR}/config/${UF}.json" -o "${OUTPUT_DIR}/output/${UF}.svg" -s style.css
	kartograph "${OUTPUT_DIR}/config/thumb-${UF}.json" -o "${OUTPUT_DIR}/output/thumb-${UF}.svg" -s thumb-style.css
	
done

cd $CURRENT_DIR
