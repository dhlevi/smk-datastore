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

RUN chmod 001 /docker-entrypoint.sh

USER couchdb

#copy in the local.ini
#COPY local.ini /opt/couchdb/etc/