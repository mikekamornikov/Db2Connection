#!/bin/sh

# install ibm db2
sudo apt-get install db2exc

# set DB2 users' passwords
echo -e "db2inst1\ndb2inst1" | sudo passwd db2inst1
echo -e "db2fenc1\ndb2fenc1" | sudo passwd db2fenc1
echo -e "db2das1\ndb2das1" | sudo passwd db2das1

# install php ibm_db2 extension
echo "/opt/ibm/db2/V9.7" | sudo pecl install ibm_db2
echo "extension=ibm_db2.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`

