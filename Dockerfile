FROM apache/couchdb:latest

#copy in the local.ini
COPY local.ini /opt/couchdb/etc/
