#!/bin/sh
# wait-for-sqlserver.sh

set -e
  
host="$1"
shift
  
until /opt/mssql-tools/bin/sqlcmd -S $host -U SA -P $SA_PASSWORD -Q 'select 1'; do
  >&2 echo "SqlServer is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "SqlServer is up - executing command"
exec "$@"