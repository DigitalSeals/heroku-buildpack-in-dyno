#!/bin/sh
service_startup_timeout=30
pid_file_path=/var/tmp/mysql.pid
i=0
while test $i -ne $service_startup_timeout ; do


  test -s "$pid_file_path" && i='' && break

  i=`expr $i + 1`
  sleep 1

done

if test -z "$i" ; then
  echo "SUCCESS"
  return 0
else
  echo " ERROR! MYSQL daemon was not started"
  return 1
fi