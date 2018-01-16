FROM apache/couchdb:latest

ARG admin_user=${smk_admin}
ARG password=${smk_admin_password}

RUN curl -s -X PUT http://localhost:5984/_config/admins/$admin_user -d '"$password"'

