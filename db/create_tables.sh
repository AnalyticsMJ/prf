#!/usr/bin/env bash

PASSWORD=$1

cat create_table.sql | mysql -u root --password=${PASSWORD} prf
