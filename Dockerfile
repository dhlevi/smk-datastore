FROM apache/couchdb:latest

RUN mkdir -p \
    /opt/couchdb/ && \
    chown -R couchdb.0 \
    /opt/couchdb/ && \
    # Loosen permission bits to avoid problems running container with arbitrary UID
    chmod -R g+rwx \
    /opt/couchdb/

# Copy executable utilities.
COPY bin/ /usr/bin/
COPY docker-entrypoint.sh /

RUN chmod 555 /docker-entrypoint.sh
RUN chmod 555 /usr/bin/fix-permissions

USER couchdb

# Create setup tables
#RUN curl -X PUT http://127.0.0.1:5984/_users
#RUN curl -X PUT http://127.0.0.1:5984/_replicator
#RUN curl -X PUT http://127.0.0.1:5984/_global_changes

#copy in the local.ini
#COPY local.ini /opt/couchdb/etc/