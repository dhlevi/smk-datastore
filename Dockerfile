FROM apache/couchdb:latest

ARG ADMIN_USER=${smk_admin}
ARG ADMIN_PASSWORD=${smk_admin_password}

#RUN echo curl -s -X PUT http://localhost:5984/_node/nonode@nohost/_config/admins/$ADMIN_USER -d '"$ADMIN_PASSWORD"'
#set the admin password on image build
RUN curl -s -X PUT http://localhost:5984/_node/nonode@nohost/_config/admins/$ADMIN_USER -d '"$ADMIN_PASSWORD"'