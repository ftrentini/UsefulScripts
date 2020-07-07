#!/bin/bash

database=$1

if mysqlcheck --check --databases $database ; then
        echo "Database ok. Running optimizer."
        mysqlcheck --optimize --database $database
else
        echo "Database not ok. Run repair first"
fi
