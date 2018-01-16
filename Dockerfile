#https://docs.docker.com/samples/library/couchdb/
FROM apache/couchdb:latest

#Environment settings
ARG admin_user=${smk_admin_user}
ARG password=${smk_admin_password}

# For any custom configurations needed on image creation
# currently nothing is required
#RUN --name smk-couchdb -v /my/custom-config-dir:/opt/couchdb/etc/local.d -d couchdb

RUN -e COUCHDB_USER=$admin_user -e COUCHDB_PASSWORD=$password -d --name smk-couchdb couchdb

#only do this to expose the couchdb externally.
#RUN -p 5984:5984 -d couchdb
#Likely, we'll want to link the container to our service api instead:
#RUN --name smk-service --link smk-couchdb:couch couchdb
