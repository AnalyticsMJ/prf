PASSWORD=$1
./create_tables.sh $PASSWORD && ./load_tables.sh $PASSWORD && ./load_tables_semestre.sh $PASSWORD
