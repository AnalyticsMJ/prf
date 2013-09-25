#!/usr/bin/env bash

PASSWORD=$1

cat create_tables.sql | mysql -u root --password=${PASSWORD} prf
