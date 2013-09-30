echo "Script executed from: ${PWD}"

BASEDIR=$(dirname $0)
echo "Script location: ${BASEDIR}"

PASSWORD=$1
${BASEDIR}/create_tables.sh $PASSWORD && ./load_tables.sh $PASSWORD && ./load_tables_semestre.sh $PASSWORD
